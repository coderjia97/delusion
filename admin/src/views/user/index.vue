<template>
    <div>
        <h2 class="admin-title">用户列表</h2>
        <Row>
            <Col :span="6" class="admin-operation">
                <Button type="info">添加</Button>
            </Col>
            <Col :span="18" class="admin-search">
                <Form inline>
                    <FormItem>
                        <Input style="width:260px;">
                        </Input>
                    </FormItem>
                    <FormItem>
                        <Button type="info">搜索</Button>
                    </FormItem>
                </Form>                
            </Col>
        </Row> 
        <Table border :data="data.data" :columns="columns" :loading="loading"></Table>    
        <Page 
            class="page"
        ></Page>
    </div>
</template>

<script>
export default {
    data() {
        return {
            loading:false,
            data:{
                total:0,
                data:[],
            },
            columns:[
                {
                    title:"ID",
                    key:"id",
                    align:"center",
                },
                {
                    title:"用户名",
                    key:"username",
                    align:"center",
                },
                {
                    title:"头像",
                    key:"head_url",
                    align:"center",
                    render:(h,param)=>{
                        return h("img",{
                            attrs:{
                                src:param.row.head_url
                            },
                            style:{
                                width:"100px"
                            }
                        });
                    }
                },
                {
                    title:"状态",
                    key:"status",
                    align:"center",
                    render:(h,param)=>{
                        let btnType = 'primary';
                        if(param.row.status == 2){
                            btnType = 'default';
                        }
                        return h("Button",{
                            props:{
                                type:btnType,
                                size:"small",
                            },
                            on:{
                                click:() => {
                                    let status_text = "启用";
                                    let status = 1;
                                    if(param.row.status == 1){
                                        status_text = "禁用";
                                        status = 2;
                                    }
                                    this.$Modal.confirm({
                                        title:'提示',
                                        content:"确定要"+status_text+"此账户吗",
                                        onOk:() => {
                                            this.changeStatus(param.row.id);
                                        }
                                    })
                                }
                            }
                        },param.row.status ==1 ? '禁用':'启用');
                    }
                },
                {
                    title:"创建时间",
                    key:"time",
                    align:"center",
                },
                {
                    title:"角色",
                    key:"admin_text",
                    align:"center",
                },
                {
                    title:"操作",
                    align:"center",
                    render:(h,param)=>{
                        return h("div",[
                            h("Button",{
                                props:{
                                    type:'error',
                                    size:"small",
                                },
                                style:{
                                    margin:"0 5px",
                                }
                            },'删除'),
                            h("Button",{
                                props:{
                                    type:'warning',
                                    size:"small",
                                },
                                style:{
                                    margin:"0 5px",
                                }
                            },'修改'),
                        ]);
                    },
                },
            ],
        }
    },

    mounted() {
        this.list();
    },

    methods: {
        //声明异步函数 await等待请求完毕后复制变量 目的使异步请求变同步请求
        async list(){
            this.loading = true;
            let res = await this.$api.user.list()
            if(res)
            {
                this.data = res;
            }
            this.loading = false;
        },
        info(){

        },
        async changeStatus(id){
            let res = await this.$api.user.changeStatus({id});
            if(res)
            {
                this.list();
                this.$Message.success('操作成功');
            }
        },
    },
}
</script>

<style lang="less" scoped>
.admin-title{
    padding-bottom: 9px;
    margin: 20px 0 20px;
    border-bottom: 1px solid #eee;
}
.admin-operation{
    text-align: left;
}
.admin-search{
    text-align: right;
}
.page {
    text-align: right;
    margin: 10px;
}
</style>
