<template>
  <div class="login">
    <div class="top">
      <img src="/loginbg.jpg" alt="" />
    </div>
    <div class="down">
      <div class="left">
        <div class="title"><p>用户信息</p></div>
        <table style="border:1px solid black">
          <thead>
            <tr>
              <td>uid</td>
              <td>phone</td>
              <td>uname</td>
              <td>upwd</td>
              <td>sex</td>
              <td>birthday</td>
              <td>province</td>
              <td>city</td>
              <td>county</td>
              <td>操作</td>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(p, i) of data" :key="i">
              <td>{{ p.uid }}</td>
              <td>{{ p.phone }}</td>
              <td>{{ p.uname }}</td>
              <td>{{ p.upwd }}</td>
              <td>{{ p.sex }}</td>
              <td>{{ p.birthday | date }}</td>
              <td>{{ p.province }}</td>
              <td>{{ p.city }}</td>
              <td>{{ p.county }}</td>
              <td class="caozuo">
                <tr>
                  <td colspan="3" @click="updata(p.uid)">修改</td>
                  <i>|</i>
                  <td colspan="3" @click="del(p.uid)">移除</td>
                </tr>
              </td>
            </tr>
          </tbody>
        </table>

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

        <ul>
          <li class="clearfix mima"><a href="/#/user">用户信息</a></li>
          <li class="anniu" style="border: 0">
            <button class="btn1" @click="search"><span>立即查询</span></button>
          </li>
        </ul>
        <div class="zhuce">
          <router-link to="/changepwd">修改密码</router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      pno: 0,
      pcount: 0,
      data: [],
    };
  },
  methods: {
    del(uid) {
      this.axios.delete(`/pro/v1/delete/${uid}`).then((result) => {
        console.log(result);
        if (result.status == 200) {
          alert("删除成功");
          this.search();
        } else {
          alert("删除失败");
        }
      });
    },
    start(i) {
      console.log(i);
      this.search((this.pno = i));
    },
    change(i, e) {
      console.log(i);
      if (e.target.className.indexOf("disabled") == -1) {
        this.search(parseInt(this.pno) + parseInt(i));
      }
    },
    search(pno = 0) {
      this.axios
        .get("/pro/v1/search", {
          params: {
            pno,
          },
        })
        .then((result) => {
          console.log(result);
          this.data = result.data.data;
          this.pcount = result.data.pageCount;
          this.pno = result.data.pno;
        });
    },
  },
  created() {
    this.search();
  },
  // watch: {
  //   data() {
  //     this.search();
  //   },
  // },
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
    height: 800px;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    box-sizing: border-box;
    .left {
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
      padding: 0 40px 0 0;
      width: 1200px;
      height: 423px;
      text-align: center;
      .title {
        width: 470px;
        p {
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
      table {
        width: 1200px;
        tbody {
          .caozuo {
            float: right;
            position: relative;
            right: 38px;
          }
        }
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
  }
}
</style>
