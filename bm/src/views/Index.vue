<template>
  <div class="all">
    <!-- 轮播 -->
    <carousel></carousel>
    <div class="tansuo">
      <ul>
        <li
          class="text"
          style="
            width: 100%;
            text-align: center;
            position: absolute;
            top: 0;
            left: 0;
          "
        >
          <span style="font-size: 26px; font-weight: bold">探索最新装备</span>
        </li>
        <li class="man">
          <a href="#"><img src="/index/man.jpg" alt="" /><span>男士</span></a>
        </li>
        <li class="shoe">
          <a href="#"><img src="/index/shoe.jpg" alt="" /><span>鞋类</span></a>
        </li>
        <li class="new">
          <a href="#"
            ><img src="/index/new.jpg" alt="" /><span>新品上市</span></a
          >
        </li>
        <li class="women">
          <a href="#"><img src="/index/women.jpg" alt="" /><span>女士</span></a>
        </li>
        <li class="equip">
          <a href="#"><img src="/index/equip.jpg" alt="" /><span>装备</span></a>
        </li>
      </ul>
    </div>

    <div class="keceng">
      <ul class="over">
        <li class="wenzi">
          <div class="nike">你可曾</div>
          <div class="dili">砥砺前行?</div>
        </li>
        <li class="big">
          <a href="#"
            ><img src="/index/keceng/big.jpg" alt="" /> <span>发现更多</span></a
          >
        </li>
        <li class="show">
          <ul class="box">
            <li class="zuoshang">
              <a href="#">
                <img src="/index/keceng/zuoshang.jpg" alt="" />
                <div class="zeg">
                  <a class="zeg-tx">查看搭配</a>
                </div>
              </a>
            </li>
            <li class="youshang">
              <a href="#">
                <img src="/index/keceng/youshang.jpg" alt="" />
                <div class="zeg">
                  <a class="zeg-tx">查看搭配</a>
                </div>
              </a>
            </li>
            <li class="zuoxia">
              <a href="#">
                <img src="/index/keceng/zuoxia.jpg" alt="" />
                <div class="zeg">
                  <a class="zeg-tx">查看搭配</a>
                </div>
              </a>
            </li>
            <li class="youxia">
              <a href="#">
                <img src="/index/keceng/youxia.jpg" alt="" />
                <div class="zeg">
                  <a class="zeg-tx">查看搭配</a>
                </div>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </div>

    <div class="more">
      <ul>
        <li>
          <a href="#">
            <div><img src="/index/more/morel.jpg" alt=" " /></div>
            <div class="te">
              <div class="te1">OFF MOUNTAIN</div>
              <div class="te2">探索更多</div>
            </div>
          </a>
        </li>
        <li>
          <a href="#">
            <div><img src="/index/more/morer.jpg" alt=" " /></div>
            <div class="te">
              <div class="te1">OFF MOUNTAIN</div>
              <div class="te2">探索更多</div>
            </div>
          </a>
        </li>
      </ul>
    </div>

    <div class="gushi">
      <div class="title">探索故事</div>
      <ul class="main">
        <li>
          <a href="#"
            ><img src="/index/gushi/1.jpg" alt="" />
            <div>#你可曾#探索之旅</div></a
          >
        </li>
        <li>
          <a href="#"
            ><img src="/index/gushi/2.jpg" alt="" />
            <div>城市蔓延</div></a
          >
        </li>
        <li>
          <a href="#"
            ><img src="/index/gushi/3.jpg" alt="" />
            <div>山夏节</div></a
          >
        </li>
        <li>
          <a href="#"
            ><img src="/index/gushi/4.jpg" alt="" />
            <div>#她们野行</div></a
          >
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import carousel from "../components/Index/Carousel.vue";
// import createPersistedState from "vuex-persistedstate";
export default {
  components: { carousel },
  //   created() {
  //     //在页面加载时读取sessionStorage里的状态信息
  //     if (sessionStorage.getItem("store")) {
  //       this.$store.replaceState(
  //         Object.assign(
  //           {},
  //           this.$store.state,
  //           JSON.parse(sessionStorage.getItem("store"))
  //         )
  //       );
  //     }

  //     //在页面刷新时将vuex里的信息保存到sessionStorage里
  //     window.addEventListener("beforeunload", () => {
  //       sessionStorage.setItem("store", JSON.stringify(this.$store.state));
  //     });
  //   },
  // };
  // created() {
  //   this.reurl();
  // },
  // methods: {
  //   reurl() {
  //     url = location.href; //把当前页面的地址赋给变量 url
  //     var times = url.split("/"); //分切变量 url 分隔符号为 "?"
  //     if (times[1] != 1) {
  //       //如果?后的值不等于1表示没有刷新
  //       url += "?1"; //把变量 url 的值加入 ?1
  //       self.location.replace(url); //刷新页面
  //     }
  //   },
};
</script>
<style lang="scss">
.all {
  margin: 0 auto;
  .tansuo {
    padding: 80px 70px 80px 70px;
    clear: both;
    width: 1200px;
    margin: 0 auto;
    background: #fafafa;
    ul {
      width: 1060px;
      height: 582px;
      list-style-type: none;
      margin: 0;
      padding: 100px 0 0 0;
      position: relative;
      .man {
        position: absolute;
        top: 100;
        left: 0;
      }
      .shoe {
        position: absolute;
        bottom: 0;
        left: 0;
      }
      .new {
        position: absolute;
        width: 49%;
        margin: 0 0 0 25.6%;
      }
      .women {
        position: absolute;
        top: 100;
        right: 0;
      }
      .equip {
        position: absolute;
        width: 24%;
        bottom: 0;
        right: 0;
      }
      .man,
      .shoe,
      .women,
      .equip,
      .new {
        span {
          position: absolute;
          top: 60%;
          color: #fff;
          left: 50%;
          transform: translateX(-50%);
          width: 124px;
          background-color: #000;
          font-size: 20px;
          line-height: 45px;
        }
      }
    }
  }
  .keceng {
    width: 1200px;
    height: 883px;
    margin: 0 auto;
    .over {
      width: 100%;
      height: 100%;
      margin-top: 80px;
      margin-bottom: 0;
      padding: 100px 70px 80px 70px;
      position: relative;
      list-style: none;
      .wenzi {
        width: 100%;
        text-align: center;
        position: absolute;
        top: 0;
        left: 0;
        .nike {
          color: #000;
          font-size: 26px;
          font-weight: bold;
        }
        .dili {
          font-size: 20px;
        }
      }
      .big {
        width: 515px;
        height: 675px;
        position: absolute;
        left: 70;
        span {
          position: absolute;
          bottom: 10%;
          left: 137.5px;
          width: 100%;
          background: #000;
          color: #fff;
          margin: 0 auto;
          width: 200px;
          text-align: center;
          line-height: 40px;
          font-size: 18px;
        }
      }
      .show {
        width: 545px;
        height: 703px;
        margin-right: 70px;
        position: absolute;
        right: 0;
        .box {
          width: 100%;
          height: 100%;
          padding: 0;
          list-style: none;
          display: flex;
          justify-content: space-around;
          flex-wrap: wrap;
          li {
            .zeg {
              position: relative;
              height: 100%;
              width: 100%;
              cursor: pointer;
              display: none;
              .zeg-tx {
                text-align: center;
                position: absolute;
                width: 150px;
                color: #fff;
                display: block;
                background: #222;
                left: 50%;
                transform: translate(-50%, -300%);
                line-height: 46px;
                font-size: 18px;
                border-radius: 4px;
                display: none;
              }
            }
          }
          li:hover .zeg {
            display: block;
          }
          li:hover .zeg .zeg-tx {
            display: block;
          }
          .zuoshang {
            width: 44.6%;
            margin: 0 0 5.4% 5.4%;
          }
          .youshang {
            width: 44.6%;
            margin: 0 0 5.4% 5.4%;
          }
          .zuoxia {
            width: 44.6%;
            margin: 0 0 5.4% 5.4%;
          }
          .youxia {
            width: 44.6%;
            margin: 0 0 5.4% 5.4%;
          }
        }
      }
    }
  }
  .more {
    margin: 0 auto;
    ul {
      padding: 0;
      margin: 0 247px 80px;
      display: flex;
      justify-content: center;
      li {
        list-style: none;
        position: relative;
        .te {
          position: absolute;
          top: 60%;
          left: 50%;
          transform: translate(-50%, -50%);
          color: #fff;
          width: 80%;
          text-align: center;
          .te1 {
            font-size: 46px;
            font-weight: bold;
            padding-bottom: 10px;
          }
          .te2 {
            width: 124px;
            background: #000;
            margin: 107px auto 0 auto;
            line-height: 45px;
            font-size: 20px;
          }
        }
      }
    }
  }
  .gushi {
    height: 429px;
    background: none;
    width: 1200px;
    margin: 0 auto 50px;
    padding: 0 70px;
    .title {
      width: 1060px;
      height: 39px;
      text-align: center;
      font-size: 26px;
      font-weight: bold;
      line-height: 39px;
      margin-bottom: 30px;
    }
    .main {
      width: 100%;
      height: 100%;
      list-style: none;
      display: flex;
      margin: 0;
      justify-content: space-between;
      padding: 0;
      a {
        text-decoration: none;
        color: black;
        img {
          margin-bottom: 10px;
        }
      }
    }
  }
}
</style>
