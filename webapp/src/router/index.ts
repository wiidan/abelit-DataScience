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
    path: '/demo',
    name: 'DemoRoot',
    redirect: '/demo/layout',
    component: () => import('../views/demo/AppLayout.vue'),
    children: [
      {
        path: 'layout',
        name: 'ElementDemo',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "Element Demo" */ '../views/demo/ElementDemo.vue')
      },
      {
        path: 'helloworld',
        name: 'HelloWorld',
        component: () => import('../views/demo/HelloWorld.vue')
      }
    ]
  }
];

const router = new VueRouter({
  routes
});

export default router;
