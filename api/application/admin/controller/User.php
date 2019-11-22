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

    /**
     * @api {post} /admin/user/insert 后台用户列表
     * 
     * @param int page null
     * @param string username null
     * 
     * @return array
     */
    public function insertApi()
    {

    }

    public function updateApi()
    {

    }

    public function deleteApi()
    {

    }

    public function infoApi()
    {

    }    
}