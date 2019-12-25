<template>
  <div>
    <Head title="分类列表">
      <span slot="head-left">
        <Button type="primary" style="margin:0 5px" @click="add">添加</Button>
        <Button type="primary" style="margin:0 5px" @click="$router.push('/category/tree')">查看树状图</Button>
        <Button type="info" v-if="isChild" style="margin:0 5px" @click="$router.go(-1)">返回</Button>
      </span>
      <Form inline slot="head-right">
        <FormItem>
          <Input v-model="search.value" style="width:260px;">
            <Select v-model="search.type" slot="prepend" style="width:100px">
              <Option
                :value="item.value"
                v-for="(item, index) of searchList"
                :key="index"
              >{{item.title}}</Option>
            </Select>
          </Input>
        </FormItem>
        <FormItem>
          <Button type="info" @click="list">搜索</Button>
        </FormItem>
      </Form>
    </Head>
    <Table border :data="data.data" :columns="columns" :loading="loading"></Table>
    <Modal :title="info.title" v-model="info.is_show" @on-ok="ok">
      <Form :model="form" :label-width="100">
         <FormItem label="上级分类">
            <Select placeholder="请选择上级分类(不选择默认顶级分类)" v-model="form.parent_id">
              <Option v-for="(item , index) of category" ::key="index" :value="item.id">
                {{item.name}}
                </Option>
            </Select>
          </Input>
        </FormItem>
        <FormItem label="分类名称">
          <Input v-model="form.name" placeholder="请输入分类名称"></Input>
        </FormItem>
      </Form>
    </Modal>
    <Page class="page" :total="data.total" @on-change="page"></Page>
  </div>
</template>
<script>
import Head from "@/components/head";

export default {
  components: {
    Head
  },
  data() {
    return {
      isChild:false,
      loading: false,
      category : [],
      data: {
        total: 0,
        data: []
      },
      info: {
        is_show: false,
        title: ""
      },
      search: {
        value: "",
        type: "name"
      },
      searchList: [
        {
          title: "分类名称",
          value: "name"
        }
      ],
      form: {
        id:0,
        parent_id: 0,
        name: "",
      },
      columns: [
         {
            title: "ID",
            key: "id",
            align: "center"
         },
         {
            title: "分类名称",
            key: "name",
            align: "center"
         }
         ,
         {
            title: "查看下级",
            align: "center",
            render: (h, param) => {
              return h("div",[
                h("Button",{
                  props:{
                     type:'info',
                     size:'small',
                  },
                  on:{
                    click: () => {
                       this.$router.push({
                         path:"/category",
                         query:{
                           id:param.row.id
                         }
                       })
                    }
                  }
                },"查看下级"),

              ]);
            },
         }
         ,{
          title: "操作",
          align: "center",
          render: (h, param) => {
            return h("div", [
              h(
                "Button",
                {
                  props: {
                    type: "error",
                    size: "small"
                  },
                  style: {
                    margin: "0 5px"
                  },
                  on: {
                    click: () => {
                      this.$Modal.confirm({
                        title: "提示",
                        content: "确定要删除此分类吗",
                        onOk: () => {
                          this.delete(param.row.id);
                        }
                      });
                    }
                  }
                },
                "删除"
              ),
              h(
                "Button",
                {
                  props: {
                    type: "warning",
                    size: "small"
                  },
                  style: {
                    margin: "0 5px"
                  },
                  on: {
                    click: () => {
                      this.info.is_show = true;
                      this.info.title = "修改分类";
                      this.detail(param.row.id);
                      this.htmlList();
                    }
                  }
                },
                "修改"
              )
            ]);
          }
        }
      ]
    };
  },
  mounted() {
    this.list();
  },
  watch: {
    "$route.query"(val){
      console.log(val);
      if(val.id > 0){
        this.isChild = true;
      }else{
        this.isChild = false;
      }
      this.list();
    }
  },
  methods: {
    page(num) {
      this.list(num);
    },
    add() {
      this.info.is_show = true;
      this.info.title = "添加分类";
      this.htmlList();
    },
    clear(){
      this.form = {};
    },
    ok() {
      if (this.form.id > 0) {
        this.update({
           id: this.form.id,
           parent_id: this.form.parent_id,
           name: this.form.name,
        });
      } else {
        this.insert({
          name: this.form.name,
          parent_id: this.form.parent_id,
        });
      }
      this.list();
      this.clear();
    },
    async list(page = 1) {
      this.loading = true;
      let param = {
        page: page
      };
      if (this.$route.query.id > 0){
        param['id'] = this.$route.query.id;
      }
      param[this.search.type] = this.search.value;
      let res = await this.$api.category.list(param);
      if (res) {
        this.data = res;
      }
      this.loading = false;
    },

    async delete(id) {
      let res = await this.$api.category.delete({ id });
      if (res) {
        this.list();
        this.$Message.success("操作成功");
      }
    },

    async htmlList() {
      let res = await this.$api.category.htmlList();
      if (res) {
        this.category = res;
      }
    },

    async insert(form) {
      let res = await this.$api.category.insert(form);
      if (res) {
        this.$Message.success("添加成功");
      }
    },

    async update(form) {
      let res = await this.$api.category.update(form);
      if (res) {
        this.$Message.success("修改成功");
      }
    },

    async delete(id) {
      let res = await this.$api.category.delete({id});
      if (res) {
        this.$Message.success("删除成功");
        this.list();
      }
    },

    async detail(id) {
      this.$Spin.show();
      let res = await this.$api.category.detail({id});
      if (res) {
        this.form = res;
      }
      this.$Spin.hide();
    }
    

  }
};
</script>
<style lang="less">
</style>