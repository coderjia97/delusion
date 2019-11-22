<?php
namespace app\index\controller;

use think\Controller;
use think\Request;

class Error extends Controller
{
    public function index(Request $request)
    {
        return [404,'no found'.$request->controller().'controller'];return [404,'no found'.$request->controller().'controller'];
    }

    public function _empty($name){
        return [404,'no such service as'.$name];
    }
}