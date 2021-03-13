<template>
  <div id="app">
    <div id="nav">
      <div id="nav-collapse">
        <div v-if="getAccessToken || isLogin">
          <div style="display : inline-block;">
            {{ getUserName }}({{ getUserId }})님 환영합니다.
            <div @click="goUserInfo" class="btnUser">내정보보기</div>
            <div @click.prevent="onClickLogout" class="btnUser">로그아웃</div>
          </div>
        </div>
        <div v-else>
          <div>
            <router-link to="/mypage/login" class="btnUser">로그인</router-link>
          </div>
        </div>
      </div>
      <ul class="main-menu">
        <li><router-link to="/">홈</router-link></li>
        <li><router-link to="/house">집찾기</router-link></li>
        <!-- <li v-if="getAccessToken"> -->
        <li>
          <router-link to="/interest">관심지역</router-link>
        </li>
        <!-- </li> -->
        <li><router-link to="/notice">공지사항</router-link></li>
        <li><router-link to="/qna">게시판</router-link></li>
      </ul>
    </div>
    <router-view />
  </div>
</template>
<script>
import { mapGetters } from 'vuex';
export default {
  data() {
    return {
      isLogin: false,
      userId: '',
    };
  },
  computed: {
    ...mapGetters(['getAccessToken', 'getUserId', 'getUserName']),
  },
  methods: {
    loginCheck() {
      if (this.userId == null) {
        alert('로그인 해주세요.');
        this.$router.push('/mypage/login');
      }
    },
    onClickLogout() {
      this.$store
        .dispatch('LOGOUT')
        .then(() => this.$router.replace('/').catch(() => {}));
    },
    goUserInfo() {
      this.$router.push({
        name: 'UserInfo',
        params: { userId: this.getUserId },
      });
    },
  },
};
</script>
<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
#nav a {
  color: #2c3e50;
  font-weight: bold;
}
#nav {
  padding: 10px 100px 20px;
  margin: 0px 0px 10px 0px;
  border-bottom: 1px solid lightgray;
}
#nav a.router-link-exact-active {
  color: skyblue;
}
#nav a:-webkit-any-link {
  cursor: pointer;
  text-decoration: none;
}
#nav .btnUser {
  display: inline-block;
  padding: 3px 5px;
  font-size: 15px;
  border: solid;
  border-radius: 5px;
  border-color: skyblue;
  background-color: skyblue;
  color: white;
  margin: 2px;
  font-weight: bold;
  cursor: pointer;
}
#nav a.btnUser.router-link-exact-active {
  color: white;
}
#nav .main-menu,
.sub-menu {
  margin: 0;
  padding: 0;
  list-style: none;
  display: inline;
}
#nav .main-menu > ul {
  display: inline;
}
#nav .main-menu > li {
  display: inline;
  padding: 30px;
}
#nav .main-menu > li:hover .sub-menu {
  opacity: 1;
  visibility: visible;
}
#nav .main-menu > li > a {
  padding: 8px 16px;
  font-size: 25px;
  text-align: center;
}
#nav .sub-menu {
  position: absolute;
  opacity: 0;
  visibility: hidden;
}
#nav .sub-menu > li {
  padding: 16px 28px;
}
#nav-collapse {
  display: inline;
  text-align: right;
}
table {
  border-collapse: unset;
}
#sub-title {
  color: dimgray;
  font-weight: bold;
}
.main-theme {
  padding-top: 30px;
}
</style>
