<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\Db;
class Error extends Controller
{
    public function index(Request $request)
    {
        return [404,'no found'.$request->controller().'controller'];return [404,'no found'.$request->controller().'controller'];
    }

    public function _empty($name)
    {
        return [404,'no such service as'.$name];
    }

    protected function db($table='')
    {
        if(!$table){
            return null;
        }

        return Db::table($table);
    }

    public function initialize()
    {
        header("Access-Control-Allow-Origin:*");
    }
}