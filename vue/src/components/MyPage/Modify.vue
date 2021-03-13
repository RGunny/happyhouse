<template>
  <div class="main-theme">
    <h1 id="sub-title">회원정보 수정</h1>
    <hr style="width :80%;" />
    <table>
      <tr>
        <th>아이디</th>
        <td>
          <input
            type="text"
            v-model="user.userId"
            disabled
            class="form-control"
          />
        </td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td>
          <input type="password" v-model="user.userPw" class="form-control" />
        </td>
      </tr>
      <tr>
        <th>비밀번호 확인</th>
        <td>
          <input type="password" v-model="userPwCheck" class="form-control" />
        </td>
      </tr>
      <tr>
        <th>이름</th>
        <td>
          <input type="text" v-model="user.userName" class="form-control" />
        </td>
      </tr>
      <tr>
        <th>이메일</th>
        <td>
          <input type="text" v-model="user.userEmail" class="form-control" />
        </td>
      </tr>
      <tr>
        <th>생일</th>
        <td>
          <input type="date" v-model="user.userBirthday" class="form-control" />
        </td>
      </tr>
      <tr>
        <th>핸드폰 번호</th>
        <td>
          <input type="text" v-model="user.userPhone" class="form-control" />
        </td>
      </tr>
      <tr>
        <th>주소</th>
        <td>
          <input type="text" v-model="user.userAddress" class="form-control" />
        </td>
      </tr>
    </table>

    <button @click="modify">수정</button>
    <button @click="goUserInfo">취소</button>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      userPwCheck: '',
      user: {
        userId: '',
        userPw: '',
        userName: '',
        userEmail: '',
        userBirthday: '',
        userPhone: '',
        userAddress: '',
      },
    };
  },
  created() {
    this.user = this.$route.params.user;
  },
  methods: {
    goUserInfo() {
      this.$router.push({
        name: 'UserInfo',
        params: { userId: this.user.userId },
      });
    },
    modify() {
      if (this.userPwCheck != this.user.userPw) {
        alert('비밀번호를 다시 확인해주세요');
        this.userPwCheck = '';
      } else {
        axios
          .post('http://localhost:7777/mypage/modify', this.user)
          .then(({ data }) => {
            alert(data);
            this.goUserInfo();
          })
          .catch((error) => {
            console.log(error);
            alert('회원 정보 수정 오류!');
          });
      }
    },
  },
};
</script>

<style scoped>
table {
  margin: auto;
  width: 600px;
  text-align: center;
  border-style: solid;
  border-color: white;
  border-collapse: collapse;
}
table th {
  background-color: skyblue;
  color: white;
  width: 150px;
  border: 1px solid white;
}
table td {
  border: 2px solid white;
}
table td#td-add {
  text-align: left;
}
table td#td-search {
  text-align: right;
}
button {
  height: 25px;
  font-size: 15px;
  text-align: center;
  color: gray;
  background-color: lightgray;
  border-style: solid;
  border-radius: 5px;
  border-color: lightgray;
  margin: 10px 5px;
}
</style>
