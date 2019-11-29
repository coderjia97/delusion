import ajax from './axios';

let api = {

    user: {
        list : param => {
            return ajax.post('user/list',param);
        },
        info: id => {
            return ajax.post('user/info', id);
        },
        insert: param => {
            return ajax.post('user/insert', param);
        },
        delete: id => {
            return ajax.post('user/delete', id);
        },
        update: param => {
            return ajax.post('user/update', param);
        },
        changeStatus: id => {
            return ajax.post('user/changeStatus', id);
        },
    },
    
};

//声明为vue全局变量 无需每次加载  prototype私有属性
export default {
    install : Vue => {
        Vue.api = api,
        Vue.prototype.$api = api;
    }
}
