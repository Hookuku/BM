<template>
  <div class="login">
    <div class="top">
      <img src="/loginbg.jpg" alt="" />
    </div>
    <div class="down">
      <div class="left">
        <div class="title"><p>账号登录</p></div>
        <ul>
          <li>
            <input
              type="text"
              autocomplete="off"
              name="uname"
              value="phone"
              placeholder="手机号"
              vtype="required"
              data-caution="请填写登录帐号"
              autofocus="autofocus"
              v-model="phone"
            />
          </li>
          <li>
            <input
              type="password"
              name="password"
              value="upwd"
              placeholder="登录密码"
              vtype="required"
              data-caution="请填写密码"
              oncontextmenu="return false;"
              onpaste="return false;"
              v-model="upwd"
            />
          </li>
          <li class="clearfix mima"><a href="/#/user">用户信息</a></li>
          <li class="anniu" style="border: 0">
            <button class="btn1" @click="login"><span>立即登录</span></button>
          </li>
        </ul>
        <div class="zhuce">
          <router-link to="/changepwd">修改密码</router-link>
        </div>
      </div>

      <div class="right">
        <h2 style="margin: 0 0 40px 0">为什么加入探索通？</h2>
        <span style="color: #666"
          >立即注册The North
          Face会员项目“探索通”，即可获得价值100元入会礼券，可在指定线下店铺与官方商城购买指定商品满500元使用。</span
        >
        <div class="title">
          <dt class="wenzi">另有更多会员专享权益，助力您探索永不停止。</dt>
          <dd>
            <a onclick="shop_max(this)" href="JavaScript:;" class="item-1"
              >购物享积分</a
            ><a onclick="shop_max(this)" href="JavaScript:;" class="item-2"
              >最高价值388元生日礼券</a
            ><a onclick="shop_max(this)" href="JavaScript:;" class="item-3"
              >会员专享预售与限量抽签活动</a
            ><a onclick="shop_max(this)" href="JavaScript:;" class="item-4"
              >新品与活动通知</a
            >
          </dd>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  // created() {
  //   //在页面刷新时将vuex里的信息保存到localStorage里
  //   window.addEventListener("beforeunload", () => {
  //     localStorage.setItem("messageStore", JSON.stringify(this.$store.state));
  //   });

  //   //在页面加载时读取localStorage里的状态信息
  //   localStorage.getItem("messageStore") &&
  //     this.$store.replaceState(
  //       Object.assign(
  //         this.$store.state,
  //         JSON.parse(localStorage.getItem("messageStore"))
  //       )
  //     );
  // },
  data() {
    return {
      phone: "",
      upwd: "",
      sfdl: this.$store.state.sfdl,
    };
  },
  methods: {
    login() {
      let obj = {
        phone: this.phone,
        upwd: this.upwd,
        sfdl: this.sfdl,
      };
      this.axios
        .post("/pro/v1/signin", this.qs.stringify(obj))
        .then((res) => {
          console.log(res);
          if (res.data.code == 1000) {
            alert("登录成功！");
            console.log(this.phone, this.upwd);
            this.$store.commit("setSfdl", true);
            this.$store.commit("setPhone", this.phone);
            this.$store.commit("setupwd", this.upwd);
            this.$store.commit("setuid", res.data.uid);
            this.$router.push("/");
            window.location.reload();
          } else {
            alert(res.data.msg);
          }
        })
        .catch((msg) => {
          console.log(`登录失败:${msg}`);
        });
    },
  },
};
</script>

<style lang="scss" scoped>
.login {
  width: 100%;
  .top {
    margin: 0 auto;
    img {
      width: 1200px;
      height: 239px;
    }
  }
  .down {
    padding: 50px 90px;
    width: 1200px;
    height: 548px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    box-sizing: border-box;
    .left {
      padding: 0 40px 0 0;
      width: 510px;
      height: 423px;
      .title {
        width: 470px;
        p {
          float: left;
          height: 20px;
          font-size: 30px;
          font-weight: bold;
          margin: 0 0 50px 0;
          color: #000;
        }
      }
      .title::after {
        content: "";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
      }
      ul {
        padding: 0;
        .mima {
          border: 0;
          a {
            font-size: 14px;
            float: right;
            color: black;
            text-decoration: none;
          }
        }
        .anniu {
          .btn1 {
            background-color: black;
            border: 0;
            height: 48px;
            width: 160px;
            float: right;
            span {
              padding: 0 20px;
              font-size: 16px;
              background: none;
              color: white;
            }
          }
        }
        li {
          list-style: none;
          border: 1px solid #333;
          height: 48px;
          line-height: 48px;
          margin: 0 0 35px 0;
          z-index: 9;
          overflow: visible;
          input {
            width: 100%;
            height: 46px;
            line-height: 46px;
            margin: 0;
            padding: 0 10px;
            font-size: 14px;
            color: #333;
            border: none;
            vertical-align: text-bottom;
            text-decoration: none;
          }
        }
      }
      .zhuce {
        float: right;
        a {
          color: black;
          font-size: 14px;
          text-decoration: none;
        }
      }
    }
    .right {
      padding: 0 0 0 30px;
      height: 448px;
      text-decoration: none;
      float: left;
      width: 50%;
      font-size: 16px;
      line-height: 20px;
      text-align: left;
      h2 {
        padding: 8px 0 0 0;
        line-height: 100%;
        font-size: 30px;
        margin: 0 0 30px 0;
        font-weight: bold;
        color: #333;
      }
      .title {
        width: 480px;
        height: 320px;
        .wenzi {
          margin: 20px 0;
          font-weight: 600;
          color: #000;
        }
        .dd {
          margin: 0;
          width: 480px;
          height: 280px;
        }
        a {
          display: block;
          font-size: 18px;
          font-weight: bold;
          color: black;
          text-decoration: none;
          font-weight: normal;
        }
        a::before {
          display: inline-block;
          content: "";
          width: 70px;
          height: 70px;
          background: url(/aside/icon-p4.png) no-repeat center center/100%;
          overflow: hidden;
          vertical-align: middle;
          margin-right: 30px;
        }
        a.item-2::before {
          background: url(/aside/icon-p2.png) no-repeat center center/100%;
        }
        a.item-3::before {
          background: url(/aside/icon-p5.png) no-repeat center center/100%;
        }
        a.item-4::before {
          background: url(/aside/icon-p7.png) no-repeat center center/100%;
        }
      }
    }
    .right:after {
      content: "";
      display: block;
      height: 0;
      clear: both;
      visibility: hidden;
    }
  }
}
</style>
