import Vue from 'vue';
import VueRouter, { RouteConfig } from 'vue-router';
import Home from '../views/Home.vue';

Vue.use(VueRouter);

const routes: RouteConfig[] = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/demo/element',
    name: 'ElementDemo',
    component: () => import('../views/demo/ElementDemo.vue')
  },
  {
    path: '/demo/layout',
    name: 'LayoutDemo',
    component: () => import('../views/demo/AppLayout.vue')
  },
  {
    path: '/employee/test',
    name: 'test',
    component: () => import('../views/employee/TestDan.vue')
  }
];

const router = new VueRouter({
  routes
});

export default router;
