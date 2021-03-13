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
          <input type="button" id="btnUpdate" value="수정" @click="update" />
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
      updateBoard: {
        bno: 0,
        btitle: '',
        bcontent: '',
        bwriter: '',
      },
    };
  },
  created() {
    this.updateBoard.bno = this.$route.query.bno;
  },
  methods: {
    update() {
      axios
        .post('http://localhost:7777/happyhouse/qna/modify', this.updateBoard)
        .then((response) => {
          alert(response.data);
          this.$router.push('/happyhouse/qna');
        })
        .catch((error) => {
          alert(error);
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
input[type='button'] {
  height: 25px;
  font-size: 15px;
  text-align: center;
  color: gray;
  background-color: lightgray;
  border-style: solid;
  border-radius: 5px;
  border-color: lightgray;
}
textarea {
  width: 100%;
  border-color: lightgray;
  resize: none;
}
</style>
