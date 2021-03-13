<template>
  <div>
    <h1>회원가입</h1>
    <table>
      <tr>
        <th>아이디</th>
        <td id="td-left">
          <input
            type="text"
            v-model="user.userId"
            class="form-control"
            placeholder="아이디를 입력해주세요."
          />
          <button @click="checkDuplicateId">중복확인</button>
        </td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td>
          <input
            type="password"
            v-model="user.userPw"
            class="form-control"
            placeholder="비밀번호를 입력해주세요."
          />
        </td>
      </tr>
      <tr>
        <th>비밀번호 확인</th>
        <td>
          <input
            type="password"
            v-model="userPwCheck"
            class="form-control"
            placeholder="비밀번호를 한번 더 입력해주세요."
          />
        </td>
      </tr>
      <tr>
        <th>이름</th>
        <td>
          <input
            type="text"
            v-model="user.userName"
            class="form-control"
            placeholder="이름을 입력해주세요."
          />
        </td>
      </tr>
      <tr>
        <th>이메일</th>
        <td>
          <input
            type="text"
            v-model="user.userEmail"
            class="form-control"
            placeholder="이메일을 입력해주세요."
          />
        </td>
      </tr>
      <tr>
        <th>생년월일</th>
        <td>
          <input type="date" v-model="user.userBirthday" class="form-control" />
        </td>
      </tr>
      <tr>
        <th>연락처</th>
        <td>
          <input
            type="text"
            v-model="user.userPhone"
            class="form-control"
            placeholder="연락처를 입력해주세요."
          />
        </td>
      </tr>
      <tr>
        <th>주소</th>
        <td>
          <input
            type="text"
            v-model="user.userAddress"
            class="form-control"
            placeholder="주소를 입력해주세요."
          />
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <button @click="join">가입</button>
          <button @click="goLoginForm">취소</button>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      userIdCheck: false,
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
  watch: {
    userId: function() {
      this.userIdCheck = false;
    },
  },
  methods: {
    checkDuplicateId() {
      axios
        .get('http://localhost:7777/mypage/userinfo', {
          params: { userId: this.user.userId },
        })
        .then(({ data }) => {
          console.log(data);
          if (data == null || data == '') {
            alert('사용 사능한 아이디입니다.');
            this.userIdCheck = true;
          } else {
            alert('이미 존재하는 아이디입니다.');
            this.user.userId = '';
            this.userIdCheck = false;
          }
        })
        .catch((error) => {
          alert(error);
        });
    },
    join() {
      if (this.user.userId == '') {
        alert('아이디를 입력해주세요.');
      } else if (this.user.userPw == '') {
        alert('비밀번호 입력해주세요.');
      } else if (!this.userIdCheck) {
        alert('아이디 중복체크를 해주세요.');
      } else if (this.userPwCheck != this.user.userPw) {
        alert('비밀번호를 다시 확인해주세요.');
        this.userPwCheck = '';
      } else if (this.userName == '') {
        alert('이름을 입력해주세요.');
      } else {
        axios
          .post('http://localhost:7777/mypage/join', this.user)
          .then(({ data }) => {
            alert(data);
            this.goHome();
          })
          .catch((error) => {
            alert(error);
          });
      }
    },
    goHome() {
      this.$router.push('/');
    },
    goLoginForm() {
      this.$router.push('/mypage/login');
    },
  },
};
</script>

<style scoped>
table {
  width: 600px;
  margin: auto;
  text-align: center;
  border-collapse: unset;
}
table th,
td {
  padding: 5px 5px;
}
table th {
  background-color: skyblue;
  color: white;
  width: 150px;
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
table td#td-left {
  text-align: left;
}
table td#td-right {
  text-align: right;
}
</style>
