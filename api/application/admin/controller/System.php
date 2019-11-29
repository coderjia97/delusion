<?php
namespace app\admin\controller;

class System extends Error
{
    public function uploadApi()
    {
        $file = request()->file('file');

        if (!$file) {
            return [501, '文件不存在，上传失败'];
        }

        $info = $file->move('uploads');
        if (!$info) {
            return [501, $file->getError()];
        }

        $name = $info->getSaveName();

        return [200, 'http://uploads.myvue.com/' . $name];
    }

   
}