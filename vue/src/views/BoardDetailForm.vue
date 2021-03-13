<template>
  <div>
    <div>
      <table>
        <tr>
          <td colspan="2" id="td-left">
            <button name="목록으로" @click="goList()" id="btnList">
              목록으로
            </button>
          </td>
          <td colspan="2" id="td-right">
            <template v-if="getAccessToken && getUserName == board.bwriter">
              <button name="수정" @click="modifyboard()">
                수정
              </button>
              <button name="삭제" @click="deleteboard()">
                삭제
              </button>
            </template>
          </td>
        </tr>
      </table>
    </div>
    <table>
      <tr>
        <th>글 제목</th>
        <td colspan="7" id="btitle">{{ board.btitle }}</td>
      </tr>
      <tr>
        <th>글 번호</th>
        <td id="bno">{{ board.bno }}</td>
        <th>글 작성시간</th>
        <td id="bwriteDate">{{ board.bwriteDate }}</td>
        <th>글쓴이</th>
        <td id="bwriter">{{ board.bwriter }}</td>
        <th>조회수</th>
        <td id="breadCnt">{{ board.breadCnt }}</td>
      </tr>
      <tr>
        <th>글 내용</th>
        <td colspan="7" id="bcontent">{{ board.bcontent }}</td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex';
export default {
  name: 'bno',
  data() {
    return {
      board: {},
      bno: '',
      page: '',
    };
  },
  computed: {
    ...mapGetters(['getAccessToken', 'getUserId', 'getUserName']),
  },
  created() {
    this.bno = this.$route.params.bno;
    this.page = this.$route.params.page;
    axios
      .get(`http://localhost:7777/${this.page}/detail?option=${this.bno}`)
      .then((response) => {
        this.board = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    modifyboard() {
      this.$router.push({
        name: 'ModifyForm',
        params: { board: this.board, page: this.page },
      });
    },
    goList() {
      this.$router.push(`/${this.page}`);
    },
    deleteboard() {
      if (confirm('글을 삭제하시겠습니까?')) {
        axios
          .get(`http://localhost:7777/${this.page}/delete?bno=${this.bno}`)
          .then(({ data }) => {
            alert(data);
            this.goList();
          })
          .catch((error) => {
            console.log(error);
          });
      }
    },
  },
};
</script>

<style scoped>
table {
  width: 800px;
  margin: auto;
  text-align: center;
  border-collapse: unset;
}
table th,
td {
  padding: 10px 5px;
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
  margin: 10px 5px;
}
#bcontent {
  text-align: left;
}
#btitle {
  text-align: left;
}
#bno,
#breadCnt {
  width: 50px;
}
#bwriter {
  width: 130px;
}
table td#td-left {
  text-align: left;
}
table td#td-right {
  text-align: right;
}
</style>
