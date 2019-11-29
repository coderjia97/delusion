<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: 'home',
  components: {
    HelloWorld
  },

  //返回数据
  data(){
    return {

    }
  },

  //钩子函数 与php构造函数相近  vue组件被加载时运行的函数
  mounted(){
   this.list();
  },

  //存储对象方法  then捕捉成功返回  catch捕捉异常
  methods: {
    list() {
      this.$api.user.list().then(res => {
        console.log(res)
      }).catch();
    }
  },
}
</script>
