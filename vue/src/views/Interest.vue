<template>
  <div id="main-content">
    <section id="section-input" class="main-theme">
      <h5 id="sub-title">
        <span style="color : lightpink;">관심있는 동네</span>를 입력하면
        <span style="color : lightpink;">주변 상가</span> 정보를 알 수 있습니다.
      </h5>
      <br />
      <div>
        시, 도 :
        <select
          v-model="sidoCode"
          @change="getGugunList()"
          class="form-control option-control"
        >
          <option value="0" selected disabled>선택</option>
          <option
            v-for="(sido, index) in sidoList"
            :value="sido.sidoCode"
            :key="index"
          >
            {{ sido.sidoName }}
          </option>
        </select>
        구, 군 :
        <select
          v-model="gugun"
          @change="getDongList()"
          class="form-control option-control"
        >
          <option value="0" selected disabled>선택</option>
          <option
            v-for="(value, index) in gugunList"
            :value="value"
            :key="index"
          >
            {{ value.gugunName }}
          </option>
        </select>
        읍, 면, 동 :
        <select
          v-model="dongName"
          id="dong"
          class="form-control option-control"
        >
          <option value="0" selected disabled>선택</option>
          <option
            v-for="(dong, index) in dongList"
            :value="dong.dong"
            :key="index"
          >
            {{ dong.dong }}
          </option>
        </select>
        <select v-model="largeCate" class="form-control option-control">
          <option value="0" selected disabled>선택</option>
          <option
            v-for="(value, index) in largeCateList"
            :value="value"
            :key="index"
          >
            {{ value }}
          </option>
        </select>
        <button
          @click="getShopList"
          id="btnSubmit"
          class="btn btn-primary btn-sm"
        >
          검색
        </button>
      </div>
    </section>
    <hr style="width : 80%;" />
    <!-- <aside id="result-map"> -->
    <!-- <googlemap :maplist="resultBody" :key="mapComponentKey" /> -->
    <section>
      <table id="searchResult">
        <tr>
          <td rowspan="3">
            <GmapMap
              :center="{
                lat: center.lat,
                lng: center.lng,
              }"
              :zoom="center.zoom"
              class="mapstyle"
            >
              <GmapMarker
                :key="index"
                v-for="(m, index) in markers"
                :position="m.position"
                :clickable="true"
                :draggable="false"
                @click="clickMarker(m.position)"
              />
            </GmapMap>
            <!-- </aside> -->
          </td>
          <td id="sort-nav"></td>
        </tr>
        <td>
          <table>
            <thead>
              <!-- <tr> -->
              <th
                v-for="(head, index) in resultHead"
                :key="index"
                id="columnName"
              >
                {{ head }}
              </th>
              <!-- </tr> -->
            </thead>
            <tbody>
              <tr
                v-for="(body, index) in pageResult"
                :key="index"
                id="searchResult"
              >
                <td>{{ body.no }}</td>
                <td>{{ body.name }}</td>
                <td>{{ body.largeCateName }}</td>
                <td>{{ body.address }}</td>
                <!-- <td v-for="(value, index) in body" :key="index">
            {{ value }}
          </td> -->
              </tr>
            </tbody>
          </table>
        </td>
        <tr>
          <td id="page-nav">
            <div id="paging" v-if="resultBody.length != 0">
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
              <div
                class="div-page"
                v-show="page < totalPage"
                v-on:click="clickNext"
              >
                다음
              </div>
            </div>
          </td>
        </tr>
      </table>
    </section>
    <b-modal id="modal-1" size="xl" hide-footer>
      <template #modal-title>
        상가 정보
      </template>
      <div class="d-block text-center">
        <table id="detailStore">
          <thead>
            <tr>
              <th
                v-for="(head, index) in detailHead"
                :key="index"
                id="columnName"
              >
                {{ head }}
              </th>
            </tr>
          </thead>
          <tbody
            v-for="(value, index) in detailBody"
            :key="index"
            id="searchResult"
          >
            <tr>
              <td>{{ value.no }}</td>
              <td>{{ value.name }}</td>
              <td>{{ value.largeCateName }}</td>
              <td>{{ value.middleCateName }}</td>
              <td>{{ value.address }}</td>
              <td>{{ value.postcode }}</td>
              <td>{{ value.jibun }}</td>
              <td>{{ value.lat }}</td>
              <td>{{ value.lng }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex';
// import googlemap from '@/components/House/Map.vue';

export default {
  // components: {
  //   googlemap,
  // },

  // props: {
  //   mapConfig: Object,
  //   apiKey: String,
  // },
  props: {
    userId: String,
  },
  data() {
    // let colorArr = ['table-primary','table-success','table-danger'];
    return {
      resultHead: [],
      resultBody: [],
      detailHead: [],
      detailBody: [],
      sidoList: [],
      gugunList: [],
      dongList: [],
      sidoCode: 0,
      dongCode: '',
      sidoName: '',
      dongName: 0,
      gugun: 0,
      name: '',
      largeCate: 0,
      largeCateList: [
        '관광/여가/오락',
        '부동산',
        '생활서비스',
        '소매',
        '숙박',
        '스포츠',
        '음식',
        '의료',
        '학문/교육',
      ],
      resultType: '',
      aptName: '',
      isShow: false,
      //추가
      pageResult: [],
      page: 0,
      pageCnt: 0,
      pageIdx: 0,
      pageLen: 0,
      totalPage: 0,
      // map data
      lat: '',
      lng: '',
      markers: [],
      center: {
        lat: 37.5665734,
        lng: 126.978179,
        zoom: 12,
      },
    };
  },
  watch: {
    resultBody: function(newVal) {
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
  computed: {
    ...mapGetters(['getAccessToken', 'getUserId', 'getUserName']),
  },
  created() {
    if (this.getAccessToken == null) {
      alert('로그인 해주세요.');
      this.$router.push('/mypage/login');
    } else {
      console.log('create.....................................');
      // 페이지 시작과 동시에 sido 코드/이름 리스트 받기
      axios
        .get('http://localhost:7777/house/sido')
        .then((response) => {
          this.sidoList = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    }
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
      let end = Math.min(this.pageIdx * 10, this.resultBody.length);
      this.pageResult = this.resultBody.slice(start, end);
    },
    getPageLen(page) {
      if (page * 10 <= this.pageCnt) {
        return 10;
      } else {
        return this.pageCnt - (page - 1) * 10;
      }
    },
    getGugunList: function() {
      axios
        .get('http://localhost:7777/house/gugun', {
          params: { sidoCode: this.sidoCode },
        })
        .then((response) => {
          // console.log(response);
          // console.log(`${response.data[0]['gugunName']}`);
          this.gugunList = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getDongList: function() {
      axios
        .get('http://localhost:7777/house/dong', {
          params: { gugunCode: this.gugun.gugunCode },
        })
        .then((response) => {
          this.dongList = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getShopList: function() {
      this.resultType = 'houseList';
      axios
        .get('http://localhost:7777/house2/nearshop', {
          params: { dongName: this.dongName, largeCate: this.largeCate },
        })
        .then((response) => {
          this.resultHead = ['상가번호', '상가이름', '대분류', '도로명 주소'];
          this.resultBody = response.data;
          this.geocode();
        })
        .catch((error) => {
          console.log(error);
        });
    },

    geocode() {
      this.markers = [];
      let idx = 0;
      // this.resultBody.houseList.forEach((element) => {
      // this.resultBody.hospitalList.forEach((element) => {
      this.resultBody.forEach((value, index) => {
        this.markers.push({
          idx: index,
          name: value.name,
          position: {
            lat: Number(value.lat),
            lng: Number(value.lng),
            name: this.resultBody[idx++].name,
          },
        });
      });
    },

    clickMarker(event) {
      // 마커 위치 주고 zoom
      this.center.lat = event.lat;
      this.center.lng = event.lng;
      this.center.zoom = 17;
      this.name = event.name;
      this.getShopInfo();
      this.$bvModal.show('modal-1');
    },
    getShopInfo() {
      axios
        .get('http://localhost:7777/house2/nearshopDetail', {
          params: {
            lat: this.center.lat,
            lng: this.center.lng,
            name: this.name,
          },
        })
        .then((response) => {
          this.detailHead = [
            '상가번호',
            '상가 이름',
            '대분류',
            '중분류',
            '도로명 주소',
            '우편번호',
            '지번',
            '위도',
            '경도',
          ];
          this.detailBody = response.data;
        })
        .catch((error) => {
          console.log(error);
        });

      this.isShow = true;
    },
    handle_toggle() {
      this.isShow = !this.isShow;
    },
  },
};
</script>

<style scoped>
select.form-control {
  width: 150px;
  display: inline-block;
  margin: 5px;
}
.btn {
  margin: 3px;
}
table#searchResult {
  width: 1000px;
  height: 650px;
  margin: auto;
}
.mapstyle {
  width: 450px;
  height: 450px;
}
table {
  width: 850px;
  text-align: center;
  border-collapse: unset;
  margin: auto;
}
table#detailStore {
  width: 1000px;
}
table th,
td {
  padding: 10px 5px;
}
table th {
  background-color: skyblue;
  color: white;
}
table td#page-nav {
  height: 50px;
}
table td#sort-nav {
  height: 70px;
  text-align: right;
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
