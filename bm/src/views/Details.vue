<template>
  <div class="all">
    <div class="top">
      <div class="lt">全部商品>服装</div>

      <div class="left">
        <div class="one" v-for="(p, i) in pics" :key="i">
          <img @click="hid(i)" :src="p.md" alt="" />
        </div>
        <img
          class="position-absolute"
          :class="{ 'd-none': hide }"
          style="left: 745px;width: 610px;height: 620px;z-index: 88;"
          :src="pics[f].lg"
          alt=""
        />
        <div
          id="mask"
          class="position-absolute"
          :class="{ 'd-none': hidden }"
          :style="maskStyle"
          style="border-radius:50%; z-index:88;background-color:lightYellow; opacity:1; width:200px; height:200px"
        >
          <div
            style="border-radius:50%;z-index:88;background-color:lightYellow; width:200px; height:200px;"
            :style="{
              'background-image': `url(${pics[f].lg})`,
              'background-position': `-${parseInt(maskStyle.left) *
                1.16}px -${parseInt(maskStyle.top) * 0.98}px`,
            }"
          ></div>
        </div>

        <div
          id="super-mask"
          class="position-absolute"
          @mouseover="toggle"
          @mouseout="toggle"
          @mousemove="move"
          :class="{ 'd-none': hide }"
          style="left: 745px;width: 610px;height: 620px; z-index:89"
        ></div>
        <!-- <div
          class="position-absolute"
          :class="{ 'd-none': hidden }"
          style="right:200px; width: 176px;height: 176px;z-index: 88;"
        ></div> -->
      </div>

      <div class="right">
        <div class="title">
          <div class="onet">
            {{ product.title }}
          </div>

          <div class="twot">{{ product.subtitle }}</div>

          <div class="pricet">￥{{ product.price.toFixed(2) }}</div>

          <div class="tstlogo">
            <div><img src="/tstlogo/logov.png" alt="" /> 加入探索通</div>
          </div>
          <div class="spc">
            <div class="col">收藏该商品</div>
            <div class="share">
              分享至:
              <img src="/微信.png" alt="" />
              <img src="/微博.png" alt="" />
              <img src="/qq.png" alt="" />
              <img src="QQ空间.png" alt="" />
            </div>
          </div>

          <div class="spec">
            <div class="tit">
              颜色
              <span class="color" v-for="(p, i2) of specs" :key="i2">{{
                p.color
              }}</span>
            </div>

            <div class="pic">
              <img v-for="(p, i1) of specs" :key="i1" :src="p.pic" alt="" />
            </div>
          </div>

          <div class="size">
            <div class="chicun">
              尺寸
              <span>{{ product.size1 }}</span>
            </div>
            <div class="chima">
              <span>S</span>
              <span>M</span>
              <span>L</span>
              <span>XL</span>
              <span>XXL</span>
            </div>
          </div>

          <div class="spec_line">
            <div class="spec_title">
              数量
              <div class="num_value">
                <span @click="changecount(true)">-</span>
                <span>
                  <input value="count" v-model="count" type="text" v-text="1" />
                </span>
                <span @click="changecount(false)">+</span>
              </div>
            </div>
          </div>

          <div class="btnn">
            <button
              @click="addcart"
              :data-cid="product.cid"
              :data-price="product.price"
              :data-count="this.count"
              :data-title="product.title"
              :data-color="product.color"
              :data-size1="product.size1"
              :data-pic="product.pic"
              class="car"
            >
              加入购物车
            </button>
            <button class="buy" @click="tocart">立即购买</button>
          </div>
        </div>
      </div>
    </div>

    <div class="down">
      <div>商品详情</div>
      <div>
        <img :src="product.parameter" alt="" />
        <img :src="product.science1" alt="" />
        <img :src="product.science2" alt="" />
        <img :src="product.func" alt="" />
        <img :src="product.product1" alt="" />
        <img :src="product.product2" alt="" />
        <img :src="product.details1" alt="" />
        <img :src="product.details2" alt="" />
        <img :src="product.color1" alt="" />
        <img :src="product.color2" alt="" />
        <img :src="product.applied" alt="" />
        <img :src="product.size" alt="" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["cid"],
  data() {
    return {
      count: 1,
      product: { price: 0 },
      pics: [{ lg: "" }],
      specs: [],
      i: 0,
      f: 0,
      g: 0,
      hide: true,
      hidden: true,
      maskStyle: {
        left: "0",
        top: "0",
      },
    };
  },

  methods: {
    tocart() {
      this.$router.push("/cart");
    },
    addcart(event) {
      var cid = event.target.dataset.cid;
      var price = event.target.dataset.price;
      var count = event.target.dataset.count;
      var title = event.target.dataset.title;
      var color = event.target.dataset.color;
      var size1 = event.target.dataset.size1;
      var pic = event.target.dataset.pic;
      var obj = { cid, price, count, title, color, size1, pic };
      this.axios.get("/pro/v1/addcart", { params: obj }).then((res) => {
        if (res.data.code == -1) {
          alert("请先登录");
          this.$router.push("/login");
        } else if (res.data.code == -2) {
          alert("添加失败");
        } else {
          alert("添加成功");
        }
      });
    },
    changecount(e) {
      if (this.count > 0) {
        if (!e) {
          this.count++;
        } else {
          if (this.count < 2) return;
          this.count--;
        }
      }
    },
    move(e) {
      console.log(e.offsetX);
      console.log(e.offsetY);
      var left = e.offsetX - 100 + 745;
      var top = e.offsetY - 100 + 149;
      if (left < 745) left = 745;
      else if (left > 1155) left = 1155;
      if (top < 149) top = 149;
      else if (top > 569) top = 569;
      this.maskStyle = {
        left: left + "px",
        top: top + "px",
      };
    },
    hid(i) {
      this.f = i;
      this.hide = !this.hide;
    },
    toggle() {
      this.hidden = !this.hidden;
      this.g = this.f;
    },
    // changei(i) {
    //   e = i;
    //   console.log(this.e);
    // },
    load() {
      this.axios
        .get("/pro/v1/details", {
          params: {
            cid: this.cid,
          },
        })
        .then((result) => {
          // console.log(result.data);
          this.product = result.data.product;
          this.pics = result.data.pics;
          this.specs = result.data.specs;
          // console.log(this.product);
          // console.log(this.pics);
          // console.log(this.specs);
        });
    },
  },

  created() {
    this.load();
    console.log(this.cid);
  },
  watch: {
    cid() {
      this.load();
    },
  },
};
</script>

<style lang="scss">
.all {
  width: 1200px;
  .top {
    width: 100%;
    height: 900px;
    .lt {
      width: 1200px;
      height: 30px;
      text-align: left;
      font-size: 12px;
      line-height: 30px;
    }
    .lt::after {
      display: block;
      content: "";
      clear: both;
    }
    .left {
      width: 580px;
      height: 870px;
      float: left;
      display: flex;
      flex-wrap: wrap;
      .one {
        width: 275px;
        height: 275px;
        margin-right: 15px;
        margin-bottom: 15px;
        img {
          width: 275px;
          height: 275px;
        }
      }
    }
    .left::after {
      display: block;
      content: "";
      clear: both;
    }
    .right {
      width: 620px;
      height: 680px;
      padding: 10px;
      float: right;
      .title {
        .onet {
          font-size: 24px;
          height: 35.2px;
          line-height: 35.2px;
          font-weight: bold;
          text-align: left;
          white-space: nowrap;
        }
        .twot {
          height: 23.5px;
          text-align: left;
          line-height: 23.5px;
          font-size: 16px;
          color: #8c8c8c;
          margin-top: 16px;
        }
        .pricet {
          margin-top: 20px;
          background-color: #f8f8f8;
          border-bottom: 1px solid #eeeeee;
          padding: 15px 25px;
          box-sizing: border-box;
          height: 76px;
          text-align: left;
          line-height: 46px;
          font-size: 30px;
          color: #de2910;
        }
        .tstlogo {
          width: 600px;
          height: 60px;
          padding: 15px 25px;
          background-color: #f8f8f8;
          text-align: left;
          margin-bottom: 5px;
          img {
            margin-right: 10px;
          }
        }
        .spc {
          width: 600px;
          height: 72px;
          padding: 10px 0;
          div {
            position: relative;
            top: 50%; /*偏移*/
            transform: translateY(-50%);
          }
          .col {
            line-height: 30px;
            float: left;
            width: 120px;
            height: 32px;
            background: #f5f5f5;
            border: 1px solid #ddd;
            font-size: 12px;
            margin: 0 auto;
          }
          .share {
            width: 200px;
            height: 64px;
            float: right;
            line-height: 64px;
            font-size: 12px;
            img {
              margin-right: 3px;
            }
          }
        }
        .spec {
          height: 106.5px;
          width: 600px;
          font-size: 12px;
          margin-bottom: 15px;
          .tit {
            height: 35px;
            color: #c4c4c4;
            line-height: 35px;
            text-align: left;
            .color {
              color: #de2910;
              margin-left: 5px;
            }
          }
          .pic {
            width: 600px;
            display: flex;
            img {
              margin-right: 5px;
              border: 1px solid #c4c4c4;
              width: 70px;
              height: 70px;
            }
          }
        }
        .size {
          width: 600px;
          height: 77px;
          margin-bottom: 15px;
          .chicun {
            height: 34.5px;
            font-size: 12px;
            text-align: left;
            line-height: 34.5px;
            span {
              color: #de2910;
              margin: 10px 10px 0 0;
            }
          }
          .chima {
            margin-top: -10px;
            width: 600px;
            height: 52px;
            text-align: left;
            font-size: 12px;
            line-height: 52px;
            span {
              margin-right: 5px;
              border: 1px solid #c4c4c4;
              width: 72px;
              height: 42px;
              text-align: center;
              line-height: 42px;
              display: inline-block;
              margin-top: 10px;
              margin-right: 10px;
              cursor: pointer;
              vertical-align: top;
            }
          }
        }
        .spec_line {
          margin-bottom: 15px;
          width: 600px;
          height: 79.2px;
          .spec_title {
            color: #c4c4c4;
            line-height: 35px;
            font-size: 12px;
            height: 34.8px;
            width: 600px;
            text-align: left;
            line-height: 34.8px;
          }
          .num_value {
            width: 600px;
            height: 44.4px;
            display: flex;
            flex: 1;
            font-size: 0;
            span {
              display: block;
              border: 1px solid #e8e8e8;
              text-align: center;
              min-width: 50px;
              width: 50px;
              height: 42px;
              line-height: 42px;
              font-size: 16px;
              cursor: pointer;
              input {
                display: block;
                border: none;
                height: 100%;
                width: 100%;
                text-align: center;
                outline: none;
              }
            }
          }
        }
        .btnn {
          width: 350px;
          height: 42px;
          text-align: left;
          .car {
            width: 124px;
            height: 42px;
            margin-right: 8px;
          }
          .buy {
            width: 124px;
            height: 42px;
            background-color: #de2910;
            color: white;
          }
        }
      }
    }

    .right::after {
      display: block;
      content: "";
      clear: both;
    }
  }
}
</style>
