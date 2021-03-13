<template>
  <div id="login-form" class="main-theme">
    <h1>Happy House</h1>
    <table>
      <tr>
        <input
          type="text"
          v-model="user.userId"
          placeholder="아이디를 입력해주세요."
          class="form-control"
        />
      </tr>
      <tr>
        <input
          type="password"
          v-model="user.userPw"
          placeholder="비밀번호를 입력해주세요."
          class="form-control"
        />
      </tr>
      <tr>
        <button @click="login">로그인</button>
      </tr>
      <tr>
        <router-link to="/mypage/joinForm">회원가입</router-link>
        |
        <router-link to="/mypage/finduser">아이디/비밀번호 찾기</router-link>
      </tr>
    </table>
  </div>
</template>

<script>
import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

export default {
  name: 'Login',
  data: function() {
    return {
      user: {
        userId: '',
        userPw: '',
      },
      message: '',
    };
  },
  computed: {
    nextRoute() {
      return this.$route.params.nextRoute ? this.$route.params.nextRoute : '/';
    },
  },
  methods: {
    login: function() {
      // LOGIN 액션 실행
      // 서버와 통신(axios)을 해 토큰값을 얻어야 하므로 Actions를 호출.
      this.$store
        .dispatch('LOGIN', this.user)
        .then(() => {
          this.$router.replace('/mypage/userinfo');
        })
        .catch(({ message }) => (this.msg = message));
    },
  },
};
</script>

<style scoped>
table {
  margin: auto;
  width: 300px;
  text-align: center;
}
table tr {
  height: 40px;
}
button {
  width: 100%;
  height: 30px;
  background-color: skyblue;
  color: white;
  border-style: solid;
  border-radius: 5px;
  border-color: skyblue;
  cursor: pointer;
}
#login-form {
  width: 500px;
  margin: auto;
}
</style>
