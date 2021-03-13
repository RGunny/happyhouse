<template>
  <div>
    <table>
      <tr>
        <td colspan="2" id="td-add">
          <button name="수정" @click="modifyboard()">수정</button>
          <button name="삭제" @click="deleteboard()">삭제</button>
        </td>
      </tr>

      <tr>
        <th>글 번호</th>
        <th>글 내용</th>
        <th>글 제목</th>
        <th>글쓴이</th>
        <th>조회수</th>
      </tr>
      <tr v-for="board in boardList" :key="board.bno">
        <td>{{ board.bno }}</td>
        <td>{{ board.bcontent }}</td>
        <td>{{ board.btitle }}</td>
        <td>{{ board.bwriter }}</td>
        <td>{{ board.breadCnt }}</td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'bno',
  // props: ['bno'],
  data() {
    return {
      boardList: [],
      bno: '',
    };
  },

  created() {
    this.bno = this.$route.query.bno;
    console.log(this.bno);
    axios
      .get('http://localhost:7777/happyhouse/qna/detail?option=' + this.bno)
      .then((response) => {
        console.log(response);
        this.boardList = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },

  methods: {
    modifyboard() {
      alert(this.bno + '번 글을 수정하겠습니다.');
      this.$router.push('/happyhouse/QnAUpdate?bno=' + this.bno);
    },

    deleteboard() {
      alert(this.bno + '번 글을 삭제하겠습니다.');
      axios
        .get('http://localhost:7777/happyhouse/qna/delete?bno=' + this.bno)
        .then((response) => {
          console.log(response);
          this.$router.push('/happyhouse/qna');
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style></style>
