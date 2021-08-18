<template>
  <div id="app">
    <my-header></my-header>
    <router-view />
    <my-footer></my-footer>
  </div>
</template>

<script>
export default {
  created() {
    //在页面刷新时将vuex里的信息保存到sessionStorage里
    window.addEventListener("beforeunload", () => {
      console.log("存vuex前的数据");
      console.log(
        this.$store.state,
        JSON.parse(sessionStorage.getItem("store"))
      );

      sessionStorage.setItem("store", JSON.stringify(this.$store.state));

      console.log("存vuex后的数据");
      console.log(
        this.$store.state,
        JSON.parse(sessionStorage.getItem("store"))
      );
    });

    // 在页面加载时读取sessionStorage里的状态信息
    if (sessionStorage.getItem("store")) {
      console.log("读取sessionstorage前的数据");
      console.log(
        this.$store.state,
        JSON.parse(sessionStorage.getItem("store"))
      );

      this.$store.replaceState(
        Object.assign(
          {},
          this.$store.state,
          JSON.parse(sessionStorage.getItem("store"))
        )
      );

      console.log("读取sessionstorage后的数据");
      console.log(
        this.$store.state,
        JSON.parse(sessionStorage.getItem("store"))
      );
    }
  },
};
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
