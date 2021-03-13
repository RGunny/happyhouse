<template>
  <div class="main-theme">
    <h1 id="sub-title">찜 목록</h1>
    <hr style="width : 80%" />
    <div id="searchResult">
      <table id="houseResult">
        <tr>
          <td id="td-left" colspan="5">
            <button @click="goUserInfo">뒤로가기</button>
          </td>
        </tr>
        <tr>
          <th>번호</th>
          <th>아파트 이름</th>
          <th>매매 가격</th>
          <th>법정동</th>
          <th>지번</th>
        </tr>
        <tbody v-if="pickList.length != 0" v-cloak>
          <tr
            v-for="(house, index) in pageResult"
            :key="index"
            @click="showDetailHouse(house.houseId)"
            type="b-buttion"
            v-b-modal.modal-1
            class="house"
          >
            <td>{{ house.houseId }}</td>
            <td>{{ house.aptName }}</td>
            <td>{{ house.dealAmount }}</td>
            <td>{{ house.dong }}</td>
            <td>{{ house.jibun }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div id="paging" v-if="pickList.length != 0">
      <div class="div-page" v-show="1 < page" v-on:click="clickPrev">
        이전
      </div>
      <div
        v-for="i in pageLen"
        :key="i"
        class="div-page"
        @click="changePage((page - 1) * 10 + i)"
        v-b-modal.modal-1
      >
        {{ (page - 1) * 10 + i }}
      </div>
      <div class="div-page" v-show="page < totalPage" v-on:click="clickNext">
        다음
      </div>
    </div>
    <div>
      <b-modal id="modal-1" hide-footer size="xl">
        <template #modal-title>
          매매 정보
        </template>
        <div class="d-block text-center">
          <table>
            <tr>
              <td rowspan="11">
                <img src="@/img/house1.jpg" width="350px" height="350px" />
              </td>
            </tr>
            <tr>
              <th>번호</th>
              <td>{{ detailInfo.houseId }}</td>
            </tr>
            <tr>
              <th>아파트 이름</th>
              <td>{{ detailInfo.aptName }}</td>
            </tr>
            <tr>
              <th>법정동</th>
              <td>{{ detailInfo.dong }}</td>
            </tr>
            <tr>
              <th>지번</th>
              <td>{{ detailInfo.jibun }}</td>
            </tr>
            <tr>
              <th>매매 가격</th>
              <td>{{ detailInfo.dealAmount }}</td>
            </tr>
            <tr>
              <th>준공년도</th>
              <td>{{ detailInfo.buildYear }}</td>
            </tr>
            <tr>
              <th>평 수</th>
              <td>{{ detailInfo.area }}</td>
            </tr>
            <tr>
              <th>층 수</th>
              <td>{{ detailInfo.floor }}</td>
            </tr>
            <tr>
              <th>건물 타입</th>
              <td>{{ detailInfo.typeName }}</td>
            </tr>
            <tr>
              <td colspan="2" id="td-right">
                <button @click="deletePick" class="btn btn-warning btn-sm">
                  찜 목록에서 삭제
                </button>
              </td>
            </tr>
          </table>
        </div>
        <b-button class="mt-3" block @click="$bvModal.hide('modal-1')"
          >close</b-button
        >
      </b-modal>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex';
export default {
  data() {
    return {
      pickList: [],
      detailInfo: {},
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
    pickList: function(newVal) {
      //매물 찾으면 변화
      this.pageCnt = Math.ceil(newVal.length / 10); //총 페이지 버튼 수
      this.totalPage = Math.ceil(this.pageCnt / 10); //10개 단위로 보여질 페이지 버튼의 수
      this.pageIdx = 1; //처음 보여지는 매물들
      this.page = 1; //10개 단위로 페이지 버튼이 보여짐
      this.pageLen = this.getPageLen(this.page);
      this.changePage(this.pageIdx);
    },
    sortType: function() {
      this.sortOrder = 0;
    },
    page: function(newVal) {
      this.pageLen = this.getPageLen(newVal);
    },
  },
  created() {
    this.getPickList();
  },
  methods: {
    getPickList() {
      axios
        .get('http://localhost:7777/house/picklist', {
          params: { userId: this.getUserId },
        })
        .then(({ data }) => {
          this.pickList = data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    deletePick() {
      axios
        .get('http://localhost:7777/house/deletepick', {
          params: { userId: this.getUserId, houseId: this.detailInfo.houseId },
        })
        .then(({ data }) => {
          alert(data);
          this.$bvModal.hide('modal-1');
          this.getPickList();
        })
        .catch((error) => {
          alert(error);
        });
    },
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
      let end = Math.min(this.pageIdx * 10, this.pickList.length);
      this.pageResult = this.pickList.slice(start, end);
    },
    getPageLen(page) {
      if (page * 10 <= this.pageCnt) {
        return 10;
      } else {
        return this.pageCnt - (page - 1) * 10;
      }
    },
    showDetailHouse(houseId) {
      axios
        .get('http://localhost:7777/house/houseDetail', {
          params: { houseId: houseId },
        })
        .then(({ data }) => {
          console.log(data);
          this.detailInfo = data;
        })
        .catch((error) => {
          alert(error);
        });
    },
    goUserInfo() {
      this.$router.push({
        name: 'UserInfo',
        params: { userId: this.getUserId },
      });
    },
  },
};
</script>

<style scoped>
table {
  width: 800px;
  text-align: center;
  border-collapse: unset;
  margin: auto;
}
#searchResult {
  width: 1000px;
  height: 600px;
  margin: auto;
}
table th,
td {
  padding: 10px 5px;
}
table th {
  background-color: skyblue;
  color: white;
}
table#houseResult tr.house:hover {
  background-color: aliceblue;
  cursor: pointer;
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
table#houseResult button {
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
[v-clock] {
  display: none;
}
</style>
