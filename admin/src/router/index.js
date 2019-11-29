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
      }
    ],
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
