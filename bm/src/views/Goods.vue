<template>
  <div class="container">
    <div class="dh">
      <div class="dropdown dropdown1">
        <a
          class="btn dropdown-toggle"
          href="#"
          role="button"
          id="dropdownMenuLink"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >
          性别
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
          <a class="dropdown-item" href="#">不限</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">男</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">女</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">幼童</a>
        </div>
      </div>
      <div class="dropdown dropdown">
        <a
          class="btn dropdown-toggle"
          href="#"
          role="button"
          id="dropdownMenuLink"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >
          专业指数
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
          <a class="dropdown-item" href="#">不限</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">男</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">女</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">幼童</a>
        </div>
      </div>
      <div class="dropdown dropdown">
        <a
          class="btn dropdown-toggle"
          href="#"
          role="button"
          id="dropdownMenuLink"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >
          适用场景
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
          <a class="dropdown-item" href="#">不限</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">男</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">女</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">幼童</a>
        </div>
      </div>
      <div class="dropdown dropdown">
        <a
          class="btn dropdown-toggle"
          href="#"
          role="button"
          id="dropdownMenuLink"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >
          科技
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
          <a class="dropdown-item" href="#">不限</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">男</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">女</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">幼童</a>
        </div>
      </div>
      <div class="dropdown dropdown">
        <a
          class="btn dropdown-toggle"
          href="#"
          role="button"
          id="dropdownMenuLink"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >
          颜色
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
          <a class="dropdown-item" href="#">不限</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">男</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">女</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">幼童</a>
        </div>
      </div>
      <div class="dropdown dropdown">
        <a
          class="btn dropdown-toggle"
          href="#"
          role="button"
          id="dropdownMenuLink"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >
          尺寸
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
          <a class="dropdown-item" href="#">不限</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">男</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">女</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">幼童</a>
        </div>
      </div>
      <div class="dropdown dropdown2">
        <a
          class="btn dropdown-toggle"
          href="#"
          role="button"
          id="dropdownMenuLink"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >
          排序
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
          <a class="dropdown-item" href="#">不限</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">男</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">女</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">幼童</a>
        </div>
      </div>
    </div>

    <div class="tu">
      <router-link
        v-for="(p, i) of this.data"
        :key="i"
        :to="`/details/${p.cid}`"
      >
        <div>
          <img :src="p.pic" alt="" />
        </div>
        <p v-text="p.title"></p>
        <div class="price">${{ p.price.toFixed(2) }}</div>
      </router-link>
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
        <li><a href="javascript:;" @click="start(pcount - 1)">末页</a></li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  props: ["kw"],
  data() {
    return {
      pno: 0,
      pcount: 0,
      data: [],
    };
  },
  methods: {
    start(i) {
      console.log(i);
      this.load((this.pno = i));
    },
    change(i, e) {
      console.log(i);
      if (e.target.className.indexOf("disabled") == -1) {
        this.load(parseInt(this.pno) + parseInt(i));
      }
    },
    load(pno = 0) {
      this.axios
        .get("/pro/v1/goods", {
          params: {
            kw: this.kw,
            pno,
          },
        })
        .then((result) => {
          console.log(result);
          this.data = result.data.data;
          this.pcount = result.data.pageCount;
          this.pno = result.data.pno;
          console.log(this.products);
        });
    },
  },
  created() {
    this.load();
  },
  watch: {
    kw() {
      this.load();
    },
  },
};
</script>

<style lang="scss">
.container {
  height: 1400px;
  margin-top: 50px;
  .dh {
    display: inline-flex;
  }
  .dropdown {
    z-index: 97;
    height: 47px;
    width: 171px;
    border: 1px solid black;
    a {
      color: black;
      box-shadow: none;
    }
    .dropdown-menu {
      height: 47px;
      width: 171px;
      transform: translate3d(0px, 44px, 0px) !important;
      text-align: center;
    }
  }
  .dropdown1 {
    border-left: 0;
  }
  .dropdown2 {
    border-right: 0;
  }
  .tu {
    margin-top: 10px;
    height: 1200px;
    text-align: center;
    display: flex;
    justify-content: space-between;
    flex-flow: row wrap;
    a {
      width: 30%;
      text-decoration: none;
    }
    img {
      width: 200px;
      height: 200px;
    }
    p {
      font-size: 16px;
      color: black;
    }
    .price {
      font-size: 16px;
      float: left;
      color: red;
      font-weight: bold;
      margin-left: 40px;
    }
  }

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
}
</style>
