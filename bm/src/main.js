import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import MyHeader from "./components/MyHeader";
import MyFooter from "./components/MyFooter";
import axios from "axios";
import qs from "qs";
// import { MessageBox } from "element-ui";

// 配置请求时保存session对象
axios.defaults.withCredentials = true;
// axios.defaults.baseURL = "http://127.0.0.1:3000";
Vue.prototype.axios = axios;
Vue.prototype.qs = qs;
Vue.config.productionTip = false;
// Vue.prototype.$confirm = MessageBox.confirm;

Vue.component("my-header", MyHeader);
Vue.component("my-footer", MyFooter);
Vue.filter("date", function(value) {
  if (!value) return "七月份的尾巴";
  else if (value) {
    value = value.substring(0, 10);
    return value;
  }
});
new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
