import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'layout',
    component: () => import('../layout/admin.vue'),
    children: [
      {
        path: "/",
        name: "首页",
        component: () => import('../views/index.vue'),
      },
      {
        path: "/user",
        name: "用户模块",
        component: () => import('../views/user/index.vue'),
      },
      {
        path: "/category",
        name: "分类模块",
        component: () => import('../views/category/index.vue'),
      },
      {
        path: "/category/tree",
        name: "分类树状图",
        component: () => import('../views/category/tree.vue'),
      },
    ],
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
