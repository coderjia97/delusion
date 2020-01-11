<?php

namespace app\admin\Controller;
class Goods extends Error
{
    public function listApi()
    {
        $param = input('post.');
        $page = $param['page'] ?? 1;

        $where['is_delete'] = 0;

        if (!empty($param['name'])) {
            $where['name'] = $param['name'];
        }
        if (!empty($param['class_name'])) {
            $class = $this->db('yzm_shop')->field('id')->where('name', $param['name'])->where('is_delete', 0)->find();
            if (!$class) {
                return [200, ['total' => 0, 'data' => []]];
            }
            $where['class_id'] = $class;
        }

        $total = $this->db('yzm_shop')->where($where)->count();
        if ($total == 0) {
            return [200, ['total' => 0, 'data' => []]];
        }

        $data = $this->db('yzm_shop')->where($where)->field('id,name,imgs,stock,shelf,sell_price,class_id')->order('id desc')->page($page, 10)->select();

        $classId = array_unique(array_column($data, 'class_id'));

        $class = $this->db('yzm_shop')->field('id,name')->where('id', 'in', $classId)->select();

        $className = array_column($class, 'name', 'id');

        foreach ($data as &$value) {
            $value['class_name'] = $className[$value['class_id']];
            $value['imags'] = json_decode($value['imgs'], true);
            $value['thumb'] = $value['imags'][0];
        }

        return [200, ['total' => $total, 'data' => $data]];
    }

    public function insertApi()
    {
        $param = input('post.');

        $param['imgs'] = json_decode($param['imgs'], true);

        $error = $this->validate($param, 'Goods.insert');
        if (true !== $error) {
            return [501, $error];
        }

        $goods = $this->db('yzm_shop')->where('name', $param['name'])->where('is_delete', 0)->select();
        if ($goods) {
            return [501, '该商品已存在,请检查核对'];
        }

        $row = $this->db('yzm_shop')->insert([
            'name' => $param['name'],
            'imgs' => json_encode($param['imgs']),
            'stock' => $param['stock'],
            'sell_price' => $param['sell_price'],
            'class_id' => $param['class_id'],
            'desc' => $param['desc'],
            'shelf' => 0,
            'is_delete' => 0,
        ]);

        if ($row < 0) {
            return [501, '添加失败'];
        }

        return [200, '添加成功'];
    }

    public function detaiApi()
    {
        $id = input('post.id');

        $info = $this->db('yzm_shop')->where('id', $id)->where('is_delete', 0)->find();
        if (!$info) {
            return [501, '数据错误'];
        }

        $info['imgs'] = json_decode($info['imgs'], true);

        $class = $this->db('yzm_class')->field('name')->where('id', $info['class_id'])->find();

        $info['class_name'] = $class['name'];

        return [200, $info];
    }

    public function updateApi()
    {
        $param = input('post.');

        $param['imgs'] = json_decode($param['imgs'], true);

        $error = $this->validate($param, 'Goods.update');
        if (true !== $error) {
            return [501, $error];
        }

        $goods = $this->db('yzm_shop')->where('name', $param['name'])->where('id', '<>', $param['id'])->where('is_delete', 0)->select();
        if ($goods) {
            return [501, '该商品已存在,请检查核对'];
        }

        $row = $this->db('yzm_shop')->where('id', $param['id'])->update([
            'name' => $param['name'],
            'imgs' => json_encode($param['imgs']),
            'stock' => $param['stock'],
            'sell_price' => $param['sell_price'],
            'class_id' => $param['class_id'],
            'desc' => $param['desc'],
            'shelf' => 0,
            'is_delete' => 0,
        ]);

        if ($row < 0) {
            return [501, '操作失败'];
        }

        return [200, '操作成功'];
    }

    public function deleteApi()
    {
        $id = input('post.id');

        $info = $this->db('yzm_shop')->where('id', $id)->where('is_delete', 0)->find();
        if (!$info) {
            return [501, '数据错误'];
        }

        $row = $this->db('yzm_shop')->where('id', $id)->update(['is_delete' => 1]);

        if ($row < 1) {
            return [501, '删除失败'];
        }

        return [200, '删除成功'];
    }

    public function changeStatusApi()
    {
        $id = input('post.id');

        $info = $this->db('yzm_shop')->where('id', $id)->where('is_delete', 0)->find();
        if (!$info) {
            return [501, '数据错误'];
        }

        $status = $info['status'] == 1 ? 0 : 1;

        $row = $this->db('yzm_shop')->where('id', $id)->update(['shelf' => $status]);

        if ($row < 1) {
            return [501, '修改失败'];
        }

        return [200, true];
    }
}
