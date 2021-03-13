<template>
  <div>
    <div class="main-theme">
      <h1 id="sub-title">공지사항</h1>
    </div>
    <hr style="width : 80%;" />
    <div id="menu">
      <table>
        <tr>
          <td colspan="2" id="td-left">
            <button
              @click="insertForm"
              v-if="getAccessToken && getUserId == 'admin'"
            >
              글 작성
            </button>
          </td>
          <td colspan="2" id="td-right">
            <select v-model="option">
              <option value="none" selected disabled>검색 항목</option>
              <option value="bnum">글 번호</option>
              <option value="title">제목</option>
            </select>
            <input type="text" v-model="inputData" />
            <button @click="search">조회</button>
          </td>
        </tr>
      </table>
    </div>
    <div id="div-notice">
      <table>
        <tr>
          <th class="bno">글 번호</th>
          <th class="btitle">글 제목</th>
          <th class="breadCnt">조회수</th>
        </tr>
        <tr v-for="board in pageResult" :key="board.bno">
          <td class="bno">{{ board.bno }}</td>
          <td @click="detail(board.bno)" class="btitle-link">
            {{ board.btitle }}
          </td>
          <td class="breadCnt">{{ board.breadCnt }}</td>
        </tr>
      </table>
    </div>
    <div id="paging" v-if="boardList.length != 0">
      <div class="div-page" v-show="1 < page" v-on:click="clickPrev">
        이전
      </div>
      <div
        v-for="i in pageLen"
        :key="i"
        class="div-page"
        @click="changePage((page - 1) * 10 + i)"
      >
        {{ (page - 1) * 10 + i }}
      </div>
      <div class="div-page" v-show="page < totalPage" v-on:click="clickNext">
        다음
      </div>
    </div>
  </div>
</template>

<script scoped>
import { mapGetters } from 'vuex';
import axios from 'axios';
export default {
  data() {
    return {
      option: 'none',
      inputData: '',
      boardList: [],
      pageResult: [],
      page: 0,
      pageCnt: 0,
      pageIdx: 0,
      pageLen: 0,
      totalPage: 0,
    };
  },
  computed: {
    ...mapGetters(['getAccessToken', 'getUserId', 'getUserName']),
  },
  watch: {
    boardList: function(newVal) {
      //매물 찾으면 변화
      this.pageCnt = Math.ceil(newVal.length / 10); //총 페이지 버튼 수
      this.totalPage = Math.ceil(this.pageCnt / 10); //10개 단위로 보여질 페이지 버튼의 수
      this.pageIdx = 1; //처음 보여지는 매물들
      this.page = 1; //10개 단위로 페이지 버튼이 보여짐
      this.pageLen = this.getPageLen(this.page);
      this.changePage(this.pageIdx);
    },
    page: function(newVal) {
      this.pageLen = this.getPageLen(newVal);
    },
  },
  created() {
    axios
      .get('http://localhost:7777/notice/list')
      .then((response) => {
        this.boardList = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    clickNext() {
      this.page += 1;
      this.changePage((this.page - 1) * 10 + 1);
    },
    clickPrev() {
      this.page -= 1;
      this.changePage(this.page * 10);
    },
    changePage(val) {
      this.pageIdx = val;
      let start = (this.pageIdx - 1) * 10;
      let end = Math.min(this.pageIdx * 10, this.boardList.length);
      this.pageResult = this.boardList.slice(start, end);
    },
    getPageLen(page) {
      if (page * 10 <= this.pageCnt) {
        return 10;
      } else {
        return this.pageCnt - (page - 1) * 10;
      }
    },
    insertForm() {
      this.$router.push({
        name: 'InsertForm',
        params: { userId: this.getUserName, page: 'notice' },
      });
    },
    search() {
      let url = '';
      if (this.inputData == '') {
        url = 'http://localhost:7777/notice/list';
      } else if (this.option == 'bnum') {
        url =
          'http://localhost:7777/notice/search/bnum?option=' + this.inputData;
      } else if (this.option == 'title') {
        url =
          'http://localhost:7777/notice/search/title?option=' + this.inputData;
      } else {
        url = 'http://localhost:7777/notice/list';
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
    detail(bnum) {
      this.$router.push({
        name: 'DetailForm',
        params: { bno: bnum, page: 'notice' },
      });
    },
  },
};
</script>

<style scoped>
table {
  margin: auto;
  width: 800px;
  text-align: center;
  border-collapse: unset;
}
div#div-notice {
  height: 500px;
}
table th,
td {
  padding: 10px 5px;
}
table th {
  background-color: skyblue;
  color: white;
}
table td#td-left {
  text-align: left;
}
table td#td-right {
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
  cursor: pointer;
}
select {
  border-style: solid;
  border-radius: 5px;
  border-color: gray;
}
.bno,
.breadCnt {
  width: 80px;
}
.bwriter {
  width: 100px;
}
.btitle-link {
  cursor: pointer;
  font-weight: bold;
  color: royalblue;
}
div.div-page {
  height: 30px;
  display: inline-block;
  margin: 2px;
  padding: 2px;
  text-align: center;
  background-color: skyblue;
  color: white;
  border-style: solid;
  border-color: skyblue;
  border-radius: 5px;
  cursor: pointer;
}
</style>
