<template>
  <div class="home">
    <div class="main-theme">
      <h1 id="title">Happy House</h1>
      <br />
      <h3 id="sub-title">
        <span style="color : lightpink;">어떤 동네</span>에서 살고 싶으신가요?
      </h3>
      <br />
      <div class="input-form">
        <input
          type="text"
          placeholder="동 이름을 입력해주세요."
          class="form-control"
          v-model="dong"
          v-on:keyup.enter="search"
        />
        <button class="btn btn-primary btn-sm" @click="search">
          검색
        </button>
      </div>
    </div>
    <br />
    <hr style="width : 80%;" />
    <br />
    <div id="recommends">
      <table id="table-recommend">
        <tr>
          <td colspan="3">
            <h4 id="sub-title">Best House</h4>
          </td>
        </tr>
        <tr>
          <td v-for="(house, index) in recoms" :key="index">
            <div class="recommend">
              <table class="table-house">
                <tr>
                  <td colspan="2">
                    <img src="@/img/house3.jpg" width="180px" height="180px" />
                  </td>
                </tr>
                <tr>
                  <th>아파트 이름</th>
                  <td>
                    {{ house.aptName }}
                  </td>
                </tr>
                <tr>
                  <th>법정동</th>
                  <td>
                    {{ house.dong }}
                  </td>
                </tr>
                <tr>
                  <th>실거래가</th>
                  <td>{{ house.dealAmount }} 만원</td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import axios from 'axios';
export default {
  data() {
    return {
      dong: '',
      recoms: [],
    };
  },
  created() {
    axios.get('http://localhost:7777/house/besthouse').then(({ data }) => {
      this.recoms = data;
    });
  },
  methods: {
    search() {
      this.$router.push({ name: 'House', params: { dong: this.dong } });
    },
  },
};
</script>
<style scoped>
#title {
  font-size: 50px;
  font-weight: bold;
}
div.input-form {
  text-align: center;
  width: 600px;
  margin: auto;
}
input.form-control {
  width: 500px;
  display: inline-block;
}
.btn {
  margin: 3px;
}
#recommends {
  height: 400px;
  width: 80%;
  margin: auto;
  text-align: center;
}
#table-recommend {
  height: 400px;
  width: 80%;
  margin: auto;
}
.table-house {
  width: 300px;
  height: 300px;
  margin: auto;
  font-size: 20px;
  font-weight: bold;
}
.table-house th {
  font-size: 15px;
  color: dimgray;
}
.table-house td {
  color: steelblue;
}
.recommend {
  background-color: whitesmoke;
  height: 300px;
  width: 300px;
  margin: auto 10px;
  display: inline-block;
}
</style>
