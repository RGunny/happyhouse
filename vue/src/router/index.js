import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '../views/Home.vue';
import QnA from '@/views/QnA.vue';
import DetailForm from '@/views/BoardDetailForm.vue';
import ModifyForm from '@/views/BoardModifyForm.vue';
import InsertForm from '@/views/BoardInsertForm.vue';
import MyPage from '@/views/MyPage.vue';
import Notice from '@/views/Notice.vue';
import House from '@/views/House.vue';
import Interest from '@/views/Interest.vue';

import UserInfo from '@/components/MyPage/UserInfo.vue';
import Login from '@/components/MyPage/Login.vue';
import Modify from '@/components/MyPage/Modify.vue';
import JoinForm from '@/components/MyPage/JoinForm.vue';
import FindUser from '@/components/MyPage/FindUser.vue';
import PickHouse from '@/components/MyPage/PickHouse.vue';
Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/qna',
    name: 'QnA',
    component: QnA,
  },
  {
    path: '/detailForm',
    name: 'DetailForm',
    component: DetailForm,
  },
  {
    path: '/modifyForm',
    name: 'ModifyForm',
    component: ModifyForm,
  },
  {
    path: '/insertFrom',
    name: 'InsertForm',
    component: InsertForm,
  },

  {
    path: '/house',
    name: 'House',
    component: House,
  },
  {
    path: '/interest',
    name: 'Interest',
    component: Interest,
  },

  {
    path: '/mypage',
    name: 'MyPage',
    component: MyPage,
    children: [
      {
        path: '/mypage/login',
        name: 'Login',
        component: Login,
      },
      {
        path: '/mypage/userinfo',
        name: 'UserInfo',
        component: UserInfo,
      },
      {
        path: '/mypage/modify',
        name: 'Modify',
        component: Modify,
      },
      {
        path: '/mypage/joinForm',
        name: 'JoinForm',
        component: JoinForm,
      },
      {
        path: '/mypage/finduser',
        name: 'FindUser',
        component: FindUser,
      },
      {
        path: '/mypage/pick',
        name: 'PickHouse',
        component: PickHouse,
      },
    ],
  },
  {
    path: '/mypage/login/:nextRoute',
    name: 'LoginNextRoute',
    component: MyPage,
  },
  {
    path: '/notice',
    name: 'Notice',
    component: Notice,
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
