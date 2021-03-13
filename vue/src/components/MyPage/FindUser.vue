<template>
  <div class="main-theme">
    <h1 id="sub-title">아이디 / 비밀번호 찾기</h1>
    <br />
    <hr style="width : 80%;" />
    <div>
      <div class="form-find">
        <h4 class="findType">아이디 찾기</h4>
        <input
          type="text"
          v-model="userEmail"
          placeholder="이메일을 입력해주세요."
          class="form-control"
        />
        <button @click="findUserId">찾기</button>
        <div calss="result" v-show="resultUserId != ''">
          <div>검색 결과</div>
          <div v-for="(id, index) in resultUserId" :key="index">
            {{ id.userId }}
          </div>
        </div>
      </div>
      <div class="form-find">
        <h4 class="findType">비밀번호 찾기</h4>
        <input
          type="text"
          v-model="userId"
          placeholder="아이디를 입력해주세요."
          class="form-control"
        />
        <button @click="findUserPw">찾기</button>
        <div calss="result" v-show="resultUserPw != ''">
          <div>검색 결과</div>
          <div>{{ resultUserPw }}</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      userEmail: '',
      userId: '',
      resultUserId: '',
      resultUserPw: '',
    };
  },
  methods: {
    findUserId() {
      axios
        .get('http://localhost:7777/mypage/findid', {
          params: { userEmail: this.userEmail },
        })
        .then(({ data }) => {
          this.resultUserId = data;
        });
    },
    findUserPw() {
      axios
        .get('http://localhost:7777/mypage/findpw', {
          params: { userId: this.userId },
        })
        .then(({ data }) => {
          this.resultUserPw = data;
        });
    },
  },
};
</script>

<style scoped>
div.form-find {
  margin: 10px auto;
  width: 800px;
  height: 200px;
  text-align: center;
  padding: 20px;
  border-style: solid;
  border-color: lightgray;
  border-radius: 5px;
  border-width: 3px;
}
.form-find h4 {
  height: 50px;
  font-weight: bold;
  color: dimgray;
}
button {
  width: 8%;
  height: 30px;
  background-color: skyblue;
  color: white;
  border-style: solid;
  border-radius: 5px;
  border-color: skyblue;
  cursor: pointer;
  margin: 5px;
}
.form-control {
  width: 90%;
  display: inline;
}
.findType {
  text-align: left;
}
</style>
