<template>
  <div id="main-content">
    <section id="section-input" class="main-theme">
      <h3 id="sub-title">
        살고 싶은 <span style="color : lightpink;">동네</span>를 검색해보세요
      </h3>
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
        <button
          @click="getHouseList"
          id="btnSubmit"
          class="btn btn-primary btn-sm"
        >
          검색
        </button>
        <button
          @click="getHospitalList"
          id="btnHospital"
          class="btn btn-primary btn-sm"
        >
          안전병원
        </button>
        <button
          @click="getCoronaList"
          id="btnCorona"
          class="btn btn-primary btn-sm"
        >
          코로나진료소
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
                type="b-button"
              />
            </GmapMap>
          </td>
          <td id="sort-nav">
            <div id="sort" v-if="resultBody.length != 0">
              <select
                name="sortType"
                id="sortType"
                class="form-control"
                v-model="sortType"
              >
                <option value="0" selected disabled>정렬 기준</option>
                <option value="1">매물 번호</option>
                <option value="2">아파트 이름</option>
                <option value="3">실거래가</option>
              </select>
              <select
                name="sortOrder"
                id="sortOrder"
                class="form-control"
                v-model="sortOrder"
                @change="sortHouse()"
              >
                <option value="0" selected disabled>정렬 순서</option>
                <option value="1" v-if="sortType != 0">오름차순</option>
                <option value="2" v-if="sortType != 0">내림차순</option>
              </select>
            </div>
          </td>
        </tr>
        <td>
          <table id="houseResult">
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
                @click="showDetailHouse(body.houseId)"
                :class="{ detail: isHouse }"
              >
                <template v-for="(value, index) in body">
                  <td v-if="value != null && value != 0" :key="index">
                    {{ value }}
                  </td>
                </template>
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

    <!-- </aside> -->
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
            <tr v-if="getAccessToken">
              <td id="td-right" colspan="2">
                <button
                  class="btn btn-warning brn-sm"
                  @click="pickHouse(detailInfo.houseId)"
                >
                  찜하기
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
    <!-- <b-button v-b-modal.modal-1>해당 마커 정보 보기</b-button> -->
    <b-modal id="modal-2" size="xl" hide-footer>
      <template #modal-title>
        건물 매매 정보
      </template>
      <div class="d-block text-center">
        <table>
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
            v-for="(body, index) in detailBody"
            :key="index"
            id="searchResult"
          >
            <tr>
              <td v-for="(value, index) in body" :key="index">
                {{ value }}
              </td>
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
      resultType: '',
      aptName: '',
      hospitalName: '',
      coronaName: '',
      isHouse: false,
      //정렬
      sortType: 0,
      sortOrder: 0,
      pageResult: [],
      page: 0,
      pageCnt: 0,
      pageIdx: 0,
      pageLen: 0,
      totalPage: 0,
      //추가된 부분
      detailInfo: {},
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
  computed: {
    ...mapGetters(['getAccessToken', 'getUserId', 'getUserName']),
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
      if (this.resultType == 'houseList') {
        this.isHouse = true;
      } else {
        this.isHouse = false;
      }
    },
    sortType: function() {
      this.sortOrder = 0;
    },
    page: function(newVal) {
      this.pageLen = this.getPageLen(newVal);
    },
  },
  created() {
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
    if (this.$route.params.dong != null) {
      let dong = this.$route.params.dong;
      axios
        .get('http://localhost:7777/house/sidogugun', {
          params: { dong: dong },
        })
        .then(({ data }) => {
          this.sidoCode = data.sidoCode;
          this.getGugunList();
          data.sidoCode = null;
          data.sidoName = null;
          this.gugun = data;
          this.getDongList();
          this.dongName = dong;
          this.getHouseList();
        })
        .catch((error) => {
          alert(error);
        });
    }
  },
  methods: {
    pickHouse(houseId) {
      axios
        .get('http://localhost:7777/house/pick', {
          params: { userId: this.getUserId, houseId: houseId },
        })
        .then(({ data }) => {
          alert(data);
        })
        .catch((error) => {
          alert(error);
        });
    },
    showDetailHouse(houseId) {
      if (this.resultType == 'houseList') {
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
        this.$bvModal.show('modal-1');
      }
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
          // console.log(${response.data[0]['gugunName']});
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
    getHouseList: function() {
      this.resultType = 'houseList';
      axios
        .get('http://localhost:7777/house/apt', {
          params: { dongName: this.dongName },
        })
        .then((response) => {
          this.resultHead = [
            '번호',
            '아파트 이름',
            '매매 가격',
            '법정동',
            '지번',
          ];
          this.resultBody = response.data;
          this.sortType = 0;
          this.geocode();
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getHospitalList: function() {
      this.resultType = 'hospitalList';
      if (this.gugun.gugunCode == null && this.gugun.gugunName == null) {
        this.gugun.gugunCode = 'all';
        this.gugun.gugunName = 'all';
      }
      axios
        .get('http://localhost:7777/house2/hospital', {
          params: {
            gugunName: this.gugun.gugunName,
            gugun: this.gugun.gugunCode,
          },
        })
        .then((response) => {
          this.resultHead = ['병원이름', '시/도', '군/구', '동'];
          this.resultBody = response.data;
          // this.resultBody.hospitalList = response.data;
          this.geocode();
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getCoronaList: function() {
      this.resultType = 'coronaList';
      if (this.gugun.gugunCode == null && this.gugun.gugunName == null) {
        this.gugun.gugunCode = 'all';
        this.gugun.gugunName = 'all';
      }
      axios
        .get('http://localhost:7777/house2/corona', {
          params: {
            gugunName: this.gugun.gugunName,
            gugun: this.gugun.gugunCode,
          },
        })
        .then((response) => {
          this.resultHead = [
            '검사가능여부',
            '진료소 이름',
            '시/도',
            '군/구',
            '동',
          ];
          this.resultBody = response.data;
          // this.resultBody.coronaList = response.data;
          this.geocode();
        })
        .catch((error) => {
          console.log(error);
        });
    },
    geocode() {
      this.markers = [];
      let idx = 0;
      // let tmplat = 0;
      // let tmplng = 0;
      this.resultBody.forEach((element) => {
        axios
          // https://maps.googleapis.com/maps/api/geocode/json?address=%EB%AA%85%EB%A5%9C1%EA%B0%80+(5-89)+5-89&key=AIzaSyDcc74Gpy-fPJWEqX7OYHWOQoXq6ATSRDY
          .get(
            'https://maps.googleapis.com/maps/api/geocode/json?address=' +
              element.dong +
              '+' +
              element.aptName +
              '+' +
              element.jibun +
              '&key=' +
              'AIzaSyDcc74Gpy-fPJWEqX7OYHWOQoXq6ATSRDY'
          )
          .then((response) => {
            // tmplat += Number(response.data.results[0].geometry.location.lat);
            // tmplng += Number(response.data.results[0].geometry.location.lng);
            // console.log(tmplat);
            // console.log(tmplng);
            this.center.lat = response.data.results[0].geometry.location.lat;
            this.center.lng = response.data.results[0].geometry.location.lng;
            this.zoom = 20;
            if (this.resultType == 'houseList') {
              this.markers.push({
                position: {
                  lat: response.data.results[0].geometry.location.lat,
                  lng: response.data.results[0].geometry.location.lng,
                  aptName: this.resultBody[idx++].aptName,
                },
              });
            } else if (this.resultType == 'hospitalList') {
              this.markers.push({
                position: {
                  lat: response.data.results[0].geometry.location.lat,
                  lng: response.data.results[0].geometry.location.lng,
                  hospitalName: this.resultBody[idx++].hospital_name,
                },
              });
            } else if (this.resultType == 'coronaList') {
              this.markers.push({
                position: {
                  lat: response.data.results[0].geometry.location.lat,
                  lng: response.data.results[0].geometry.location.lng,
                  coronaName: this.resultBody[idx++].corona_name,
                },
              });
            }
            // console.log(response.data);
            // console.log(response.data.results[0].geometry.location.lat);
            // console.log(response.data.results[0].geometry.location.lng);
            if (response.data.status == 'OK') {
              this.markers.push({
                position: {
                  lat: response.data.results[0].geometry.location.lat,
                  lng: response.data.results[0].geometry.location.lng,
                  aptName: this.resultBody[idx++].aptName,
                },
              });
            }
            // console.log(this.aptName);
          })
          .catch((error) => {
            console.log(error);
          });
      });
      // tmplat = tmplat / idx;
      // tmplng = tmplng / idx;
      // this.center.lat = tmplat;
      // this.center.lng = tmplng;
    },

    clickMarker(event) {
      // 마커 위치 주고 zoom
      this.center.lat = event.lat;
      this.center.lng = event.lng;
      this.center.zoom = 17;
      if (this.resultType == 'houseList') {
        this.aptName = event.aptName;
        this.getHouseInfo();
      } else if (this.resultType == 'hospitalList') {
        this.hospitalName = event.hospitalName;
        this.getHospitalInfo();
      } else if (this.resultType == 'coronaList') {
        this.coronaName = event.coronaName;
        this.getCoronaInfo();
      }
      this.$bvModal.show('modal-2');
    },
    setLocation(lat, lng) {
      this.center.lat = lat;
      this.center.lng = lng;
      this.center.zoom = 17;
      this.getHouseInfo();
    },
    getHouseInfo() {
      axios
        .get('http://localhost:7777/house/aptDetail', {
          params: { aptName: this.aptName },
        })
        .then((response) => {
          console.log(response.data);
          this.detailHead = [
            '번호',
            '아파트 이름',
            '매매 가격',
            '법정동',
            '지번',
            '건축년도',
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
    getHospitalInfo() {
      axios
        .get('http://localhost:7777/house2/hospitalDetail', {
          params: { hospital_name: this.hospitalName },
        })
        .then((response) => {
          console.log(response.data);
          this.detailHead = [
            '병원이름',
            '시/도',
            '군/구',
            '동',
            '외래/입원',
            '대표 번호',
          ];
          this.detailBody = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
      this.isShow = true;
    },
    getCoronaInfo() {
      axios
        .get('http://localhost:7777/house2/coronaDetail', {
          params: { corona_name: this.coronaName },
        })
        .then((response) => {
          console.log(response.data);
          this.detailHead = [
            '진료소 이름',
            '시/도',
            '군/구',
            '동',
            '검사가능여부',
            '월-금 이용시간',
            '토요일 이용시간',
            '일요일 이용시간',
            '대표 번호',
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
    sortHouse() {
      if (this.sortType == 1) {
        //매물번호 정렬
        if (this.sortOrder == 1) {
          //오름차순
          this.resultBody.sort((a, b) => a.houseId - b.houseId);
        } else {
          //내림차순
          this.resultBody.sort((a, b) => b.houseId - a.houseId);
        }
      } else if (this.sortType == 2) {
        //아파트 이름
        if (this.sortOrder == 1) {
          //오름차순
          this.resultBody.sort(function(a, b) {
            if (a.aptName < b.aptName) {
              return -1;
            } else {
              if (a.aptName == b.aptName) {
                return a.houseId - b.houseId;
              } else {
                return 1;
              }
            }
          });
        } else {
          //내림차순
          this.resultBody.sort(function(a, b) {
            if (a.aptName > b.aptName) {
              return -1;
            } else {
              if (a.aptName == b.aptName) {
                return a.houseId - b.houseId;
              } else {
                return 1;
              }
            }
          });
        }
      } else {
        //실거래가
        if (this.sortOrder == 1) {
          //오름차순
          this.resultBody.sort(function(a, b) {
            if (a.dealAmount < b.dealAmount) {
              return -1;
            } else {
              if (a.dealAmount == b.dealAmount) {
                return a.houseId - b.houseId;
              } else {
                return 1;
              }
            }
          });
        } else {
          //내림차순
          this.resultBody.sort(function(a, b) {
            if (a.dealAmount > b.dealAmount) {
              return -1;
            } else {
              if (a.dealAmount == b.dealAmount) {
                return a.houseId - b.houseId;
              } else {
                return 1;
              }
            }
          });
        }
      }
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
  width: 800px;
  text-align: center;
  border-collapse: unset;
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
table td#page-nav {
  height: 50px;
}
table td#sort-nav {
  height: 70px;
  text-align: right;
}
table#houseResult tr.detail:hover {
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
table td#td-left {
  text-align: left;
}
table td#td-right {
  text-align: right;
}
</style>
