<?php
namespace app\admin\controller;

use app\admin\model\CategoryModel;
class Category extends Error
{
    public function listApi()
    {
       $param = input('post.');
       $page = $param['page'] ?? 1;
       
       $where['is_delete'] = 0;
       $where['parent_id'] = 0;
       if(!empty($param['name'])){
           $where['name'] = $param['name'];
       }
       if (!empty($param['id'])) {
            $where['parent_id'] = $param['id'];
       }

       $total = $this->db('yzm_class')->where($where)->count();
       if(0 == $total){
           return [200,['total'=>0,'data'=>[]]];
       }

       $data = $this->db('yzm_class')->where($where)->page($page,10)->order('id desc')->field('id,name,parent_id')->select();

       return [200, ['total' => $total, 'data' => $data]];

    }

    public function treeListApi()
    {
        $list = $this->db('yzm_class')->where(['is_delete'=>0])->field('id,name as title,parent_id')->select();
        $data = array_combine(array_column($list,'id'),$list);
        
        foreach ($data as $dataKey => $dataValue) {
            $data[$dataValue['parent_id']]['children'][] = &$data[$dataValue['id']];
        }
        
        return [200 , $data['0']['children']];
    }

    public function insertApi()
    {
        $param = input('post.');

        if(empty($param['name']))
        {
            return [501 ,'分类名称不能为空'];
        }

        $parentId = 0;
        if(!empty($param['parent_id'])){
            $parentId = $param['parent_id'];
        }

        $cate = $this->db('yzm_class')->where('is_delete',0)->where('name',$param['name'])->find();
        if($cate){
            return [501 , '分类名称已存在'];
        }

        $row = $this->db('yzm_class')->insert([
            'name' => $param['name'],
            'parent_id' => $parentId,
            'create_time' => time(),
            'is_delete' => 0,
        ]);

        if($row<1){
            return [501 , '操作失败'];
        }

        return [200 , '操作成功'];
    }

    public function infoApi()
    {
        $id = input('post.id');

        $cate = $this->db('yzm_class')->where('is_delete',0)->where('id',$id)->find();

        if(!$cate){
            return [501 , '信息错误'];
        }

        return [200,$cate];
    }

    public function updateApi()
    {
        $param = input('post.');

        if(empty($param['name']) || empty($param['id'])){
            return [501 , '分类名称或id不能为空'];
        }

        $parentId = 0;
        if (!empty($param['parent_id'])) {
            $parentId = $param['parent_id'];
        }

        if($parentId == $param['id']){
            return [501, '添加分类与上级分类冲突,请重新修改'];
        }

        $cate = $this->db('yzm_class')->where('is_delete',0)->where('name',$param['name'])->where('id','<>',$param['id'])->find();
        if($cate){
            return [501, '该分类已存在'];
        }

        $row = $this->db('yzm_class')->where('id',$param['id'])->update([
            'name' => $param['name'],
            'parent_id' => $parentId,
        ]);

        if ($row < 0 ) {
            return [501, '修改失败'];
        }

        return [200, '修改成功'];
        
    }

    public function htmlListApi()
    {
        $cate = new CategoryModel();

        $data = $cate->getHtmlList();

        return [200, $data];
    }

    public function deleteApi()
    {
        $id = input('post.id');

        $cate = $this->db('yzm_class')->where('is_delete', 0)->where('id', $id)->find();
        if (!$cate) {
            return [501, '数据错误'];
        }

        $child = $this->db('yzm_class')->where('parent_id',$id)->where('is_delete', 0)->find();
        if($child){
            return [501, '为避免恶意删除,请先删除子分类'];
        }

        $goods = $this->db('yzm_shop')->where('class_id', $id)->where('is_delete', 0)->find();
        if($goods){
            return [501, '为避免恶意删除,请先删除分类下商品'];
        }

        $row = $this->db('yzm_class')->where('id',$id)->update(['is_delete' => 1]);

        if ($row < 1) {
            return [501, '修改失败'];
        }

        return [200, '修改成功'];

    }
}