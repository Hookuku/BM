<template>
  <div class="cart" v-if="data">
    <div v-show="show == 1">
      <div class="cart-content">
        <div class="cart-content-nav">
          <div @click="changeType(1)" :class="{ 'nav-active': active == 1 }">
            <img
              :src="active == 1 ? `/cart/cart-in.png` : `/cart/cart-out.png`"
            />
            <p>1.加入购物车</p>
          </div>
          <div @click="changeType(2)" :class="{ 'nav-active': active == 2 }">
            <img
              :src="active == 2 ? `/cart/cart-in.png` : `/cart/cart-out.png`"
            />
            <p>2.订单结算</p>
          </div>
          <div @click="changeType(3)" :class="{ 'nav-active': active == 3 }">
            <img
              :src="active == 3 ? `/cart/cart-in.png` : `/cart/cart-out.png`"
            />
            <p>3.订单支付</p>
          </div>
        </div>

        <div class="cart-content-goods">
          <p>购物车里还没有商品,赶紧选购吧!</p>
          <router-link to="/">立即选购</router-link>
        </div>
      </div>
    </div>

    <div v-show="show == 2">
      <div class="cart-content">
        <div class="cart-content-nav">
          <div @click="changeType(1)" :class="{ 'nav-active': active == 1 }">
            <img
              :src="active == 1 ? `/cart/cart-in.png` : `/cart/cart-out.png`"
            />
            <p>1.购物车</p>
          </div>
          <div @click="changeType(2)" :class="{ 'nav-active': active == 2 }">
            <img
              :src="active == 2 ? `/cart/cart-in.png` : `/cart/cart-out.png`"
            />
            <p>2.订单结算</p>
          </div>
          <div @click="changeType(3)" :class="{ 'nav-active': active == 3 }">
            <img
              :src="active == 3 ? `/cart/cart-in.png` : `/cart/cart-out.png`"
            />
            <p>3.订单支付</p>
          </div>
        </div>

        <div class="cart-content-goods">
          <form method="post">
            <table>
              <thead>
                <tr class="cart-content-goods-title">
                  <td style="width:100px ">
                    <input type="checkbox" id="j_cbAll" @click="selectAll" />
                    全选
                    <i
                      @click="delcarts"
                      style="font-style:normal;cursor:pointer"
                      >| 删除</i
                    >
                  </td>
                  <td style="width:350px ">商品</td>
                  <td style="width:127px ">单价</td>
                  <td style="width:200px ">数量</td>
                  <td tyle="width:150px ">小计</td>
                  <td tyle="width:270px ">操作</td>
                </tr>
              </thead>

              <tbody class="tbody1" id="j_tb">
                <tr
                  class="cart-content-goods-item"
                  v-for="(p, i) of data"
                  :key="i"
                >
                  <td>
                    <input @change="isall" type="checkbox" v-model="p.cb" />
                  </td>
                  <td>
                    <div class="goods-item-info">
                      <img :src="p.pic" />
                      <div>
                        <router-link :to="/details/ + p.cid">{{
                          p.title
                        }}</router-link>
                        <div class="spec">{{ p.color }} {{ p.size1 }}</div>
                      </div>
                    </div>
                  </td>
                  <td>
                    <div class="goods-item-price">${{ p.price }}</div>
                  </td>
                  <td>
                    <div class="goods-item-num">
                      <span @click="del" :data-id="i" :data-count="p.count"
                        >-</span
                      >
                      <span>
                        <input type="text" v-model="p.count" />
                      </span>
                      <span @click="add" :data-id="i">+</span>
                    </div>
                  </td>
                  <td>
                    <div class="goods-item-subtotal" style="width:150px">
                      ${{ (p.count * p.price).toFixed(2) }}
                    </div>
                  </td>
                  <td>
                    <div class="goods-item-operation" style="width:270px">
                      <span style="cursor:pointer;">收藏</span>
                      <i style="margin:0 5px">|</i>
                      <span
                        style="cursor:pointer;"
                        @click="deletecart"
                        :data-id="p.id"
                        >移除</span
                      >
                    </div>
                  </td>
                </tr>
              </tbody>

              <tbody class="tbody2">
                <tr style="height:70px">
                  <td colspan="6">
                    <div class="goods-item-total">
                      <span>商品总计:</span>
                      <span>${{ total.toFixed(2) }}</span>
                    </div>
                  </td>
                </tr>
                <tr class="next">
                  <td colspan="6">
                    <div class="next-right">
                      <a href="/">继续购物</a>

                      <button>下单结算</button>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </form>
        </div>

        <div class="page">
          <ul>
            <li><a href="javascript:;" @click="start(0)">首页</a></li>
            <li>
              <a
                href="javascript:;"
                :class="{ disabled: pno == 0 }"
                @click="change(-1, $event)"
                >上一页</a
              >
            </li>
            <li>
              <span>{{ parseInt(this.pno) + 1 }}/{{ this.pcount }}</span>
            </li>
            <li>
              <a
                href="javascript:;"
                :class="{ disabled: pno == pcount - 1 }"
                @click="change(+1, $event)"
                >下一页</a
              >
            </li>
            <li><a href="javascript:;" @click="start(pcount - 1)">尾页</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div v-show="show == 3">
      <div class="cart-content">
        <div class="cart-content-nav">
          <div @click="changeType(1)" :class="{ 'nav-active': active == 1 }">
            <img
              :src="active == 1 ? `/cart/cart-in.png` : `/cart/cart-out.png`"
            />
            <p>1.加入购物车</p>
          </div>
          <div @click="changeType(2)" :class="{ 'nav-active': active == 2 }">
            <img
              :src="active == 2 ? `/cart/cart-in.png` : `/cart/cart-out.png`"
            />
            <p>2.订单结算</p>
          </div>
          <div @click="changeType(3)" :class="{ 'nav-active': active == 3 }">
            <img
              :src="active == 3 ? `/cart/cart-in.png` : `/cart/cart-out.png`"
            />
            <p>3.订单支付</p>
          </div>
        </div>

        <div style="display:flex">
          <div class="cart-content-goods">
            <p>请先登陆再操作哦!</p>
            <router-link to="/login">立即登陆</router-link>
          </div>
          <div class="cart-content-goods">
            <p>没有账号去注册!</p>
            <router-link to="/signup">立即注册</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// import func from "vue-editor-bridge";
export default {
  data() {
    return {
      active: 1,
      show: 1,
      data: [],
      pno: 0,
      pcount: 0,
    };
  },
  created() {
    this.loadMore();
  },
  computed: {
    total() {
      // var total = 0;
      // for (var item of this.data) {
      //   if (item.cb == true) {
      //     total += item.price * item.count;
      //   }
      // }
      // return total;
      return this.data
        .filter((item) => item.cb)
        .reduce((prev, item) => prev + item.price * item.count, 0);
    },
  },
  methods: {
    isall() {
      let ckAll = document.querySelector("#j_cbAll"); //全选按钮
      // let flag = true;
      // for (let i = 0; i < this.data.length; i++) {
      //   if (!this.data[i].cb) {
      //     flag = false;
      //     break;
      //   }
      //   flag = true;
      // }
      // ckAll.checked = flag;
      //
      var res = this.data.every((cb, 当前下标i, 当前数组) => {
        return 当前数组[当前下标i].cb == true;
      });
      console.log(res);
      ckAll.checked = res;
    },
    selectAll(event) {
      var cb = event.target.checked;
      for (var p of this.data) {
        p.cb = cb;
      }
    },
    delcarts() {
      var id = "";
      for (var p of this.data) {
        if (p.cb) {
          id += p.id + ",";
        }
      }
      id = id.slice(0, -1);
      if (id == "") {
        alert("请选择需要删除的商品");
        return;
      }
      var obj = { id };
      this.axios.get("/pro/v1/delcarts", { params: obj }).then((res) => {
        if (res.data.code == -1) {
          alert("删除失败咯");
        } else if (res.data.code == 1) {
          alert("删除成功咯");
          this.loadMore();
        } else {
          alert("你先去登录哈");
        }
      });
    },
    del(event) {
      var i = event.target.dataset.id;
      var count = event.target.dataset.count;
      if (count == 1) {
        alert("买一个吧");
      }
      if (count <= 1) return;
      this.data[i].count--;
    },
    add(event) {
      var i = event.target.dataset.id;
      this.data[i].count++;
    },
    deletecart(event) {
      var id = event.target.dataset.id;
      var obj = { id };
      this.axios.get("/pro/v1/deletecart", { params: obj }).then((res) => {
        if (res.status == 200) {
          alert("删除成功");
          this.loadMore();
        }
      });
    },
    start(i) {
      console.log(i);
      this.loadMore((this.pno = i));
    },
    change(i, e) {
      console.log(i);
      if (e.target.className.indexOf("disabled") == -1) {
        this.loadMore(parseInt(this.pno) + parseInt(i));
      }
    },
    loadMore(pno = 0) {
      this.axios
        .get("/pro/v1/carts", {
          params: {
            pno,
          },
        })
        .then((res) => {
          if (res.data.code == -1) {
            alert("请登录再操作");
            this.$router.push("/login");
          } else if (res.data.code == 1 && res.data.output.data.length != 0) {
            this.show = 2;
            // this.data = res.data.output.data;
            // 遍历返回的3res.data.output.data 为其添加属性cb 初始值为false 再赋值给本地data
            var rows = res.data.output.data;
            for (var item of rows) {
              item.cb = false;
            }
            this.data = rows;
            console.log(this.data);
            this.pcount = res.data.output.pageCount;
            this.pno = res.data.output.pno;
            console.log(res);
          } else {
            this.show = 1;
          }
        });
    },
    changeType(type) {
      this.active = type;
    },
  },
};
</script>

<style lang="scss" scoped>
.cart {
  .cart-content {
    width: 1200px;
    margin: 0 auto;
    height: 1000px;

    .page {
      width: 100%;
      height: 50px;
      text-align: center;
      margin: 0 auto;
      ul {
        width: 50%;
        list-style: none;
        display: flex;
        clear: both;
        color: #999;
        padding: 5px 0px 5px 0px;
        font-size: 16px;
        width: fit-content;
        margin: auto;
        li {
          float: left;
          display: inline;
          padding: 5px 10px;
          border-radius: 3px;
          -moz-border-radius: 3px;
          -webkit-border-radius: 3px;
          border: 1px solid #333;
          color: #333;
          background-color: #fff;
          margin-right: 5px;
          line-height: 20px;
          height: 30px;
          a {
            color: black;
            text-decoration: none;
          }
        }
      }
    }

    .cart-content-nav {
      display: flex;
      justify-content: space-around;
      text-align: center;
      img {
        width: 400px;
        height: 30px;
        position: relative;
        top: 27px;
        z-index: -1;
      }
      .nav-active {
        color: white;
      }
    }
    .cart-content-goods {
      width: 100%;
      height: 800px;
      text-align: center;
      display: block;
      p {
        height: 150px;
        line-height: 300px;
        margin-bottom: 10px;
        color: #999;
      }
      > a {
        line-height: 100px;
        margin: 30px 30px;
        padding: 10px 30px;
        border: 2px solid #999;
        color: black;
        text-decoration: none;
        font-weight: bold;
      }
    }
  }
  .cart-content-goods {
    form {
      width: 100%;
      font-size: 12px;
      table {
        border: 1px solid #f2f2f2;
        width: 100%;
        thead {
          background: #f2f2f2;
          height: 37px;
          color: #a5a5a5;
          font-size: 14px;
        }
        .tbody1 {
          //   table-layout: fixed;
          //   word-break: break-all;
          .cart-content-goods-item {
            height: 126px;
            border-bottom: 1px solid #f2f2f2;
            td {
              text-align: center;
              .goods-item-num {
                width: 74px;
                margin: 0 auto;
                overflow: hidden;
                display: flex;
                width: 200px;
                justify-content: center;
                > span {
                  float: left;
                  display: block;
                  border: 1px solid #e8e8e8;
                  text-align: center;
                  min-width: 40px;
                  width: 40px;
                  height: 35px;
                  line-height: 35px;
                  font-size: 12px;
                  cursor: pointer;
                  > input {
                    display: block;
                    border: none;
                    height: 100%;
                    width: 100%;
                    text-align: center;
                    outline: none;
                  }
                }
              }
              .goods-item-info {
                display: flex;
                width: 300px;
                img {
                  border: 1px solid #a2a2a2;
                  width: 100px;
                  height: 100px;
                  margin-right: 10px;
                }
                > div {
                  .spec {
                    margin-top: 10px;
                    float: left;
                    background-color: #f2f2f2;
                    padding: 5px 10px;
                  }
                  > a {
                    text-overflow: -o-ellipsis-lastline;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    display: -webkit-box;
                    -webkit-line-clamp: 2;
                    line-clamp: 2;
                    -webkit-box-orient: vertical;
                    text-decoration: none;
                    color: black;
                  }
                }
              }
            }
          }
        }
        .tbody2 {
          tr {
            td {
              .goods-item-total {
                float: right;
                position: relative;
                right: 120px;
              }
              .goods-item-total span:nth-child(1) {
                color: #8c8c8c;
                font-size: 14px;
                margin-right: 10px;
                font-weight: bold;
              }
              .goods-item-total span:nth-child(2) {
                color: #c22014;
                font-size: 20px;
              }
            }
          }
          .next {
            > td {
              .next-right {
                margin-bottom: 10px;
                display: flex;
                align-items: center;
                justify-content: flex-end;
                > a {
                  width: 150px;
                  height: 42px;
                  line-height: 42px;
                  border: 2px solid #999;
                  color: #333;
                  font-size: 16px;
                  text-decoration: none;
                  margin-right: 10px;
                }

                > button {
                  margin-right: 10px;
                  font-size: 16px;
                  color: white;
                  float: right;
                  width: 150px;
                  height: 42px;
                  background-color: #c22014;
                }
              }
            }
          }
        }
      }
    }
  }
}
</style>
