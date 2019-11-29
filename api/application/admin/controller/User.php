<?php
namespace app\admin\controller;

class User extends Error
{
    /**
     * @api {post} /admin/user/list 后台用户列表
     * 
     * @param int page null
     * @param string username null
     * 
     * @return array
     */
    public function listApi()
    {

        $param = input('post.');
        $page = $param['page'] ?? 1;

        $where['is_delete'] = 0;
        $where['admin'] = 0;

        if (!empty($param['username'])) {
            $where['username'] = $param['username'];
        }

        $total = $this->db('yzm_user')->where($where)->count();
        if ($total == 0) {
            return [200, ['total' => 0, 'data' => []]];
        }

        $data = $this->db('yzm_user')->where($where)->field('id,username,head_url,admin,status,time')->page($page, 10)->order('id desc')->select();
        foreach ($data as &$v) {
            $v['time'] = date('Y-m-d H:i:s', $v['time']);
            $v['admin_text'] = $v['admin'] == 1 ? '管理员' : '用户';
        }
        return [200, ['total' => $total, 'data' => $data]];
    }


    public function insertApi()
    {
        $param = input('post.');
        $error = $this->validate($param,'User.insert');
        if(true !== $error){
            return [501,$error];
        }

        $user = $this->db('yzm_user')->where('username', $param['username'])->where('is_delete', 0)->find();
        if ($user) {
            return [501, '该用户已存在，再想一下'];
        }

        $row = $this->db('yzm_user')->insert([
            'username' => $param['username'],
            'password' => md5(123456),
            'head_url' => $param['head_url'],
            'admin' => $param['admin'],
            'status' => $param['status'],
            'time' => time(),
            'is_delete' => 0,
        ]);

        if ($row < 1) {
            return [501, '操作失败'];
        }

        return [200, true];
    }

    public function updateApi()
    {
        $param = input('post.');

        $error = $this->validate($param, 'User.update');
        if (true !== $error) {
            return [501, $error];
        }

        $user = $this->db('yzm_user')->where('username', $param['username'])->where('id', '<>', $param['id'])->where('is_delete', 0)->find();
        if ($user) {
            return [501, '该用户已存在，再想一下'];
        }

        $row = $this->db('yzm_user')->where('id', $param['id'])->update([
            'username' => $param['username'],
            'head_url' => $param['head_url'],
            'admin' => $param['admin'],
            'status' => $param['status'],
            'is_delete' => 0,
        ]);

        if ($row < 0) {
            return [501, '操作失败'];
        }

        return [200, true];
    }

    public function deleteApi()
    {
        $id = input('post.id');

        $info = $this->db('yzm_user')->where('id', $id)->where('is_delete', 0)->find();
        if (!$info) {
            return [501, '数据错误'];
        }

        $row = $this->db('yzm_user')->where('id', $id)->update(['is_delete' => 1]);

        if ($row < 1) {
            return [501, '删除失败'];
        }

        return [200, true];
    }

    public function infoApi()
    {
        $id = input('post.id');

        $info = $this->db('yzm_user')->where('id', $id)->where('is_delete', 0)->field('id,username,head_url,status,admin,time')->find();
        if (!$info) {
            return [501, '数据错误'];
        }

        $info['time'] = date('Y-m-d H:i:s', $info['time']);

        return [200, $info];
    }    

    public function changeStatusApi()
    {
        $id = input('post.id');

        $info = $this->db('yzm_user')->where('id',$id)->where('is_delete',0)->find();
        if (!$info) {
            return [501 ,'数据错误'];
        }

        $status = $info['status'] == 1 ? 2 : 1;

        $row = $this->db('yzm_user')->where('id',$id)->update(['status'=>$status]);

        if ($row < 1) {
            return [501 ,'操作失败'];
        }

        return [200, true];

    }
}