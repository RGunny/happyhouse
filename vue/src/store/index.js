import Vue from 'vue';
import Vuex from 'vuex';
import createPersistedState from 'vuex-persistedstate';
import axios from 'axios';

Vue.use(Vuex);

const SERVER_URL = 'http://localhost:7777';

export default new Vuex.Store({
  plugins: [
    createPersistedState({
      storage: window.sessionStorage,
    }),
  ],
  state: {
    accessToken: null,
    userId: '',
    userName: '',
  },
  getters: {
    getAccessToken(state) {
      return state.accessToken;
    },
    getUserId(state) {
      return state.userId;
    },
    getUserName(state) {
      return state.userName;
    },
  },
  mutations: {
    LOGIN(state, payload) {
      state.accessToken = payload['auth-token'];
      state.userId = payload['user-id'];
      state.userName = payload['user-name'];
    },
    LOGOUT(state) {
      state.accessToken = null;
      state.userId = '';
      state.userName = '';
    },
  },
  actions: {
    LOGIN(context, user) {
      return axios.post(`${SERVER_URL}/user/login`, user).then((response) => {
        context.commit('LOGIN', response.data);
        axios.defaults.headers.common[
          'auth-token'
        ] = `${response.data['auth-token']}`;
      });
    },
    LOGOUT(context) {
      context.commit('LOGOUT');
      axios.defaults.headers.common['auth-token'] = undefined;
    },
  },
  modules: {},
});
