import Vue from "vue";
import Vuex from "vuex";
Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    phone: "",
    upwd: "",
    sfdl: "",
    uid: "",
  },
  mutations: {
    setPhone(state, val) {
      state.phone = val;
      sessionStorage.setItem("phone", val);
    },
    setSfdl(state, val) {
      state.sfdl = val;
      sessionStorage.setItem("sfdl", val);
    },
    setupwd(state, val) {
      state.upwd = val;
      sessionStorage.setItem("upwd", val);
    },
    setuid(state, val) {
      state.uid = val;
      sessionStorage.setItem("uid", val);
    },
  },
  actions: {},
  modules: {},
});

export default store;
