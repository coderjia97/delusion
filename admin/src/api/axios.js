import axios from 'axios';
import qs from 'qs';
import iview from 'iview';

/*
*配置请求地址-超时时间-请求头信息
*/
axios.defaults.baseURL = "http://api.myvue.com/admin";
axios.defaults.timeout = 50000;
axios.defaults.headers["Content-Type"] = "application/x-www-form-urlencoded;charset=UTF-8";

/*
*请求拦截器配置
*/
// 添加请求拦截器
axios.interceptors.request.use(config => {
    if(config.method == 'post'){
        if(!config.data){
        config.data = {};
        }
        config.data = qs.stringify(config.data); //转换from-data格式
    }else if(config.method == 'get'){
        
    }
    return config;
},error => {
    return Promise.reject(error);  //返回错误信息
});

// 添加响应拦截器
axios.interceptors.response.use(res => {
    if(typeof res.data == 'string'){
        alert(res.data);
        return false;
    }

    switch (res.data.ret) {
        case 200:
            return res.data.data;
            break;
        case 300:
            //重定向处理
            break;
        default:
            iview.Message.error(res.data.msg);
            return false;
            break;
    }
}, error => {
    return Promise.reject(error);  //返回错误信息
});

export default axios;