<template>
  <div class="main-theme">
    <h1>새 글 작성</h1>
    <hr style="width : 80%;" />
    <table>
      <tr>
        <th>글 제목</th>
        <td>
          <input type="text" v-model="newBoard.btitle" class="form-control" />
        </td>
      </tr>
      <tr>
        <th>글 내용</th>
        <td>
          <textarea
            name=""
            id=""
            cols="50"
            rows="10"
            v-model="newBoard.bcontent"
            class="form-control"
          ></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <button @click="insert">작성</button>
          <button @click="goList">취소</button>
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
      newBoard: {
        bno: 0,
        btitle: '',
        bcontent: '',
        bwriter: '',
      },
      page: '',
    };
  },
  created() {
    if (this.$route.params.userId == '') this.newBoard.bwriter = '비회원';
    else this.newBoard.bwriter = this.$route.params.userId;

    this.page = this.$route.params.page;
  },
  methods: {
    insert() {
      let url = 'http://localhost:7777/' + this.page + '/insert';
      axios
        .post(url, this.newBoard)
        .then((response) => {
          alert(response.data);
          this.goList();
        })
        .catch((error) => {
          alert(error);
        });
    },
    goList() {
      this.$router.push(`/${this.page}`);
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
table th {
  background-color: skyblue;
  color: white;
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
