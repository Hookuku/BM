<template>
  <div class="all">
    <div class="head">
      <div class="logo">
        <a href="/">
          <img src="/bmlogo.png" alt="" />
        </a>
      </div>
      <div class="text">
        <div class="tit">
          <div><a href="#">探索通</a></div>
          <div>
            <router-link v-if="sfdl == false" to="/login">登录/</router-link>
            <router-link v-if="sfdl == false" to="/signup">注册</router-link>
            <span v-if="sfdl" @click="zx" style="cursor:pointer;">注销</span
            ><img v-if="sfdl" src="/logo.png" alt="" />
          </div>
          <div>
            <router-link to="/cart">购物车</router-link>
          </div>
        </div>
        <ul>
          <li><router-link to="/list">全部商品</router-link></li>
          <li><a href="#">男士</a></li>
          <li><a href="#">女士</a></li>
          <li><a href="#">鞋类</a></li>
          <li><a href="#">装备配件</a></li>
          <li><a href="#">童装</a></li>
          <li><a href="#">场景</a></li>
          <li><a href="#">关于北面</a></li>
          <li><a href="#">探索故事</a></li>
        </ul>
        <div class="bor">
          <input
            type="text"
            placeholder="搜索商品"
            v-model="kw"
            @keydown.13="search(kw)"
          />
          <img @click="search(kw)" src="/icon.png" alt="" />
        </div>
      </div>
    </div>
    <p><a href="#">★官网商城购物订单满300元，即可享快递免费运送到家。</a></p>
  </div>
</template>
<script>
export default {
  data() {
    return {
      sfdl: "",
      kw: "",
    };
  },
  watch: {
    $route() {
      this.kw = this.$route.params.kw;
    },
    "$store.state.sfdl"(val) {
      this.sfdl = val;
    },
  },
  created() {
    this.kw = this.$route.params.kw;
  },
  mounted() {
    if (this.$store.state.sfdl == undefined) {
      this.$store.commit("setSfdl", false);
      this.sfdl = false;
    } else {
      this.sfdl = this.$store.state.sfdl;
    }
  },
  methods: {
    search(kw) {
      if (!kw) return;
      this.$router.push("/goods" + this.kw);
      console.log(`${this.kw}`);
    },

    zx() {
      this.$store.commit("setSfdl", false);
      this.sfdl = false;

      this.axios.get("/pro/v1/logout", (err, res) => {
        if (res) {
          window.sessionStorage.clear();
          alert("注销成功!");
        }
      });
    },
  },
};
</script>
<style lang="scss">
.all {
  width: 100vw;
  .head {
    z-index: 99;
    position: fixed;
    left: 50%;
    transform: translateX(-50%);
    top: 0;
    width: 100%;
    height: 20px;
    background-color: white;
    text-align: center;
    justify-content: center;
    align-content: center;
    flex-wrap: wrap;
    display: flex;
    height: 87px;
    .logo {
      width: 100px;
      height: 87px;
      img {
        width: 100px;
        height: 80px;
      }
    }
    .text {
      .text::after {
        clear: both;
        content: " ";
        display: block;
        height: 0;
        overflow: hidden;
        visibility: hidden;
        width: 1100px;
        height: 87px;
      }
      .tit {
        width: 1100px;
        height: 40px;
        display: flex;
        justify-content: flex-end;
        line-height: 40px;
        div {
          width: 70px;
          height: 40px;
          span {
            font-size: 12px;
            margin-right: 2px;
          }
          img {
            width: 20px;
            height: 20px;
            display: inline-block;
          }
          a {
            color: black;
            text-decoration: none;
            font-size: 12px;
          }
        }
      }
      ul {
        box-sizing: content-box;
        padding: 0;
        margin: 0;
        position: absolute;
        padding-left: 0;
        top: 45px;
        left: 100;
        display: flex;
        white-space: nowrap;
        li {
          list-style: none;
          color: #000;
          text-align: center;
          padding: 0 21px;
          height: 42px;
          a {
            min-width: 30px;
            max-width: 44.75px;
            height: 24px;
            color: #000000;
            text-decoration: none;
          }
        }
      }
      .bor {
        position: relative;
        width: 300px;
        float: right;
        display: flex;
        align-items: center;
        > input {
          margin: 0;
          display: flex;
          float: right;
          width: 300px;
          height: 35px;
          padding: 0 30px 0 20px;
          background-color: #fff;
          border: 1px solid black;
        }
        > img {
          width: 20px;
          height: 20px;
          position: relative;
          left: -30px;
        }
      }
    }
  }
  p {
    width: 100%;
    height: 32px;
    display: flex;
    background-color: black;
    justify-content: center;
    margin-top: 87px;
    margin-bottom: 0;
    a {
      font-size: 12px;
      color: white;
      text-align: center;
      line-height: 32px;
      text-decoration: none;
    }
  }
}
</style>
