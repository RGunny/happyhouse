<template>
  <div class="main-theme">
    <h1 id="sub-title">마이페이지</h1>
    <hr style="width : 80%;" />
    <table>
      <tr>
        <th>아이디</th>
        <td>{{ user.userId }}</td>
      </tr>
      <tr>
        <th>이름</th>
        <td>{{ user.userName }}</td>
      </tr>
      <tr>
        <th>이메일</th>
        <td>{{ user.userEmail }}</td>
      </tr>
      <tr>
        <th>생일</th>
        <td>{{ user.userBirthday }}</td>
      </tr>
      <tr>
        <th>핸드폰 번호</th>
        <td>{{ user.userPhone }}</td>
      </tr>
      <tr>
        <th>주소</th>
        <td>{{ user.userAddress }}</td>
      </tr>
      <tr>
        <th>가입일</th>
        <td>{{ user.userJoinDate }}</td>
      </tr>
    </table>

    <button @click="goModify">회원 정보 수정</button>
    <button @click="deleteUser">회원 탈퇴</button>
    <button @click="goPickHouse">찜 목록</button>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex';
export default {
  data() {
    return {
      user: {
        userId: '',
        userPw: '',
        userName: '',
        userEmail: '',
        userBirthday: '',
        userPhone: '',
        userAddress: '',
        userJoinDate: '',
      },
    };
  },
  computed: {
    ...mapGetters(['getAccessToken', 'getUserId', 'getUserName']),
  },
  created() {
    this.user.userId = this.getUserId;
    axios
      .get('http://localhost:7777/mypage/userinfo?userId=' + this.user.userId)
      .then(({ data }) => {
        this.user = data;
      });
  },
  methods: {
    goModify() {
      this.$router.push({ name: 'Modify', params: { user: this.user } });
    },
    deleteUser() {
      if (confirm('정말 회원 탈퇴를 하시겠습니까?')) {
        axios
          .get('http://localhost:7777/mypage/delete', {
            params: { userId: this.user.userId },
          })
          .then(({ data }) => {
            alert(data);
            this.$router.push('/');
          })
          .catch((error) => {
            console.log(error);
            alert('회원 탈퇴 오류!');
          });
      }
    },
    goPickHouse() {
      this.$router.push({ name: 'PickHouse' });
    },
  },
};
</script>

<style scoped>
table {
  margin: auto;
  width: 600px;
  height: 350px;
  text-align: center;
  border-style: solid;
  border-color: white;
  border-collapse: unset;
}
table th {
  background-color: skyblue;
  color: white;
  width: 150px;
}
table td {
  text-align: left;
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
