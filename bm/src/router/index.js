import Vue from "vue";
import VueRouter from "vue-router";
import Index from "../views/Index.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    component: Index,
  },
  // {
  //   path:"/details",
  //   component:Details
  // },
  {
    path: "/login",
    component: () =>
      import(
        /* webpackChunkName: "login" */

        "../views/Login.vue"
      ),
    props: true,
  },
  {
    path: "/signup",
    component: () =>
      import(
        /* webpackChunkName: "signup" */

        "../views/Signup.vue"
      ),
    props: true,
  },
  {
    path: "/changepwd",
    component: () =>
      import(
        /* webpackChunkName: "changepwd" */

        "../views/Changepwd.vue"
      ),
    props: true,
  },
  {
    path: "/list",
    component: () =>
      import(
        /* webpackChunkName: "list" */

        "../views/List.vue"
      ),
    props: true,
  },
  {
    path: "/goods:kw",
    component: () =>
      import(
        /* webpackChunkName: "goods" */

        "../views/Goods.vue"
      ),
    props: true,
  },
  {
    path: "/details/:cid",
    component: () =>
      import(
        /* webpackChunkName: "details" */

        "../views/Details.vue"
      ),
    props: true,
  },
  {
    path: "/cart",
    component: () =>
      import(
        /* webpackChunkName: "cart" */

        "../views/Cart.vue"
      ),
    props: true,
  },
  {
    path: "/user",
    component: () =>
      import(
        /* webpackChunkName: "user" */

        "../views/User.vue"
      ),
    props: true,
  },
];

const router = new VueRouter({
  routes,
});
router.beforeEach((to, from, next) => {
  // 让页面回到顶部
  document.documentElement.scrollTop = 0;
  // 调用 next()，一定要调用 next 方法，否则钩子就不会被销毁
  next();
});

export default router;
