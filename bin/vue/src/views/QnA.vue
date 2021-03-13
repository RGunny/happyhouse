<template>
  <div>
    <table>
      <tr>
        <td colspan="2" id="td-add">
          <router-link type="button" id="btnAdd" to="/insert"
            >글 작성</router-link
          >
          <!--<input type="button" id="btnAdd" value="글 작성">-->
        </td>
        <td colspan="2" id="td-search">
          <select v-model="option">
            <option value="none">검색 항목</option>
            <option value="bno">글 번호</option>
            <option value="title">제목</option>
            <option value="writer">글쓴이</option>
          </select>
          <input type="text" v-model="inputData" />
          <input type="button" id="btnSearch" value="조회" @click="search" />
        </td>
      </tr>
      <tr>
        <th>글 번호</th>
        <th>글 제목</th>
        <th>글쓴이</th>
        <th>조회수</th>
      </tr>
      <tr v-for="board in boardList" :key="board.bno">
        <td>{{ board.bno }}</td>
        <td @click="detail(board.bno)">{{ board.btitle }}</td>
        <td>{{ board.bwriter }}</td>
        <td>{{ board.breadCnt }}</td>
      </tr>
    </table>

    <router-view></router-view>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      option: '',
      inputData: '',
      boardList: [],
      // bno: 0,
    };
  },
  created() {
    axios
      .get('http://localhost:7777/happyhouse/qna/list')
      .then((response) => {
        this.boardList = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    search() {
      let url = '';
      if (this.option == 'bno') {
        url =
          'http://localhost:7777/happyhouse/qna/search/bno?option=' +
          this.inputData;
      } else if (this.option == 'title') {
        url =
          'http://localhost:7777/happyhouse/qna/search/title?option=' +
          this.inputData;
      } else if (this.option == 'writer') {
        url =
          'http://localhost:7777/happyhouse/qna/search/writer?option=' +
          this.inputData;
      } else {
        url = 'http://localhost:7777/happyhouse/qna/list';
      }
      axios
        .get(url)
        .then((response) => {
          this.boardList = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    detail(bno) {
      alert(bno + '번 게시글 정보입니다.');
      // this.$router.go(this.$router.currentRoute);
      this.$router.push('/happyhouse/detail?bno=' + bno);
    },
  },
};
</script>

<style>
table {
  margin: auto;
  width: 800px;
  text-align: center;
}
table th {
  background-color: skyblue;
  color: white;
}
table td#td-add {
  text-align: left;
}
table td#td-search {
  text-align: right;
}
input[type='text'] {
  width: 200px;
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
#btnAdd {
  height: 25px;
  font-size: 15px;
  padding: 2px 5px;
  text-align: center;
  color: gray;
  background-color: lightgray;
  border-style: solid;
  border-radius: 5px;
  border-color: lightgray;
  text-decoration: none;
}
select {
  border-style: solid;
  border-radius: 5px;
  border-color: gray;
}
</style>
