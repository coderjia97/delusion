<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

namespace think\response;

use think\Response;
use think\facade\Config;

class Json extends Response
{
    // 输出参数
    protected $options = [
        'json_encode_param' => JSON_UNESCAPED_UNICODE,
    ];

    protected $contentType = 'application/json';

    /**
     * 处理数据
     * @access protected
     * @param  mixed $data 要处理的数据
     * @return mixed
     * @throws \Exception
     */
    protected function output($data)
    {   
        try {
            if(config('app.api_return_standard')){
                $data = $this->seandard($data);
                if(!$data){
                    return ;
                }
            }
            // 返回JSON数据格式到客户端 包含状态信息
            $data = json_encode($data, $this->options['json_encode_param']);

            if (false === $data) {
                throw new \InvalidArgumentException(json_last_error_msg());
            }

            return $data;
        } catch (\Exception $e) {
            if ($e->getPrevious()) {
                throw $e->getPrevious();
            }
            throw $e;
        }
    }

    private function seandard($data)
    {
        if (!isset($data[0]) || !is_int($data[0]) || !isset($data[1])) {
            echo '数据格式错误<pre>';
            print_r($data);
            echo '</pre>';
            return false;
        }

        if (200 === $data[0]) {
            return ['ret' => 200, 'data' => $data[1], 'msg' => ''];
        }

        return ['ret' => $data[0], 'data' => [], 'msg' => $data[1]];
    }
}
