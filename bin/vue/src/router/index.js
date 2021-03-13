import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '../views/Home.vue';
import QnA from '@/views/QnA.vue';
import detail from '@/views/detail.vue';
import QnAUpdate from '@/views/QnAUpdate.vue';
Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/happyhouse/qna',
    name: 'QnA',
    component: QnA,
  },
  {
    path: '/happyhouse/detail',
    name: 'detail',
    component: detail,
  },
  {
    path: '/happyhouse/QnAUpdate',
    name: 'QnAUpdate',
    component: QnAUpdate,
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
