<template>
  <div>
    <table>
      <tr>
        <th>글 제목</th>
        <td><input type="text" v-model="updateBoard.btitle" /></td>
      </tr>
      <tr>
        <th>글 내용</th>
        <td>
          <textarea
            name=""
            id=""
            cols="50"
            rows="10"
            v-model="updateBoard.bcontent"
          ></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <button @click="update">수정</button>
          <button @click="goDetail">취소</button>
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
      page: '',
      updateBoard: {
        bno: 0,
        btitle: '',
        bcontent: '',
        bwriter: '',
        bwriteDate: '',
      },
    };
  },
  created() {
    this.updateBoard = this.$route.params.board;
    this.page = this.$route.params.page;
  },
  methods: {
    update() {
      axios
        .post(`http://localhost:7777/${this.page}/modify`, this.updateBoard)
        .then((response) => {
          alert(response.data);
          this.goDetail();
        })
        .catch((error) => {
          alert(error);
        });
    },
    goDetail() {
      this.$router.push({
        name: 'DetailForm',
        params: { bno: this.updateBoard.bno, page: this.page },
      });
    },
  },
};
</script>

<style scoped>
table {
  width: 500px;
  margin: auto;
  text-align: center;
}
table th {
  background-color: skyblue;
  color: white;
}
input[type='text'] {
  width: 100%;
  height: 20px;
  margin: 3px;
  border-style: solid;
  border-radius: 5px;
  border-color: lightgray;
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
  margin: 5px 5px;
}
textarea {
  width: 100%;
  border-style: solid;
  border-radius: 5px;
  border-color: lightgray;
  resize: none;
}
</style>
