<?php
namespace app\admin\validate;

use think\Validate;

class User extends Validate
{
    protected $rule = [
        'id' => 'require|number',
        'username' => 'require|chsDash',
        'oldpassword' => 'require',
        'password' => 'require|alphaDash|confirm:repassword',
        'repassword' => 'require|alphaDash',
        'head_url' => 'require|checkImg',
        'admin' => 'require|number|in:0,1',
        'status' => 'require|number|in:1,2',
    ];

    protected $scene = [
        'insert' => ['username', 'head_url', 'admin', 'status'],
        'update' => ['id', 'username', 'head_url', 'admin', 'status'],
        'changePass' => ['id', 'oldpassword', 'password', 'repassword'],
    ];

    protected function checkImg($img)
    {
        if (!in_array(pathinfo($img, PATHINFO_EXTENSION), ['jpeg', 'jpg', 'png'])) {
            return '请上传jpeg、jpg、png格式的图片';
        }

        return true;
    }
}