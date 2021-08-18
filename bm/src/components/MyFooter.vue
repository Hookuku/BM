<template>
  <div class="foot">
    <div class="foot_top">
      <div class="left">
        <img src="/kefu.png" alt="" />
        <p>工作时间 : 周一至周日,9:00~22:00</p>
        <div>400-890-7688</div>
      </div>

      <div class="right">
        <img src="/footbm.jpg" alt="" />
      </div>
    </div>
    <div class="foot_main">
      <div class="left">
        <ul>
          <p>官方商城</p>
          <li>全部商品</li>
          <li>男士</li>
          <li>女士</li>
          <li>鞋类</li>
          <li>装备/配件</li>
          <li>童装</li>
          <li>科技</li>
          <li>场景</li>
        </ul>
        <ul>
          <p>探索通</p>
          <li>关于探索通</li>
          <li>会员权益</li>
        </ul>
        <ul>
          <p>探索故事</p>
          <li>关于北面</li>
          <li>探索故事</li>
          <li>查找门店</li>
        </ul>
        <ul>
          <p>客户服务</p>
          <li>购物流程</li>
          <li>购物须知</li>
          <li>退换货</li>
          <li>交付方式</li>
          <li>联系我们</li>
          <li>免责声明</li>
          <li>使用条款</li>
          <li>注册协议</li>
        </ul>
      </div>

      <div class="right">
        <img src="/rwm.png" alt="" />
        <p>扫一扫即刻关注</p>
        <p>北面官方微信</p>
        <div>欢迎关注北面官方微博</div>
      </div>
    </div>
    <div class="bot">
      <p>
        COPYRIGHT BY www.thenorthface.com.cn , ALL RIGHTS RESERVED .
        威富服饰（中国）有限公司上海分公司 沪ICP备08104484号-6 沪公网安备
        31010602000021号
      </p>
    </div>
    <div class="right_aside">
      <div class="kf">
        <a href="#"> <img src="/aside/kf.png" alt="" /></a>
      </div>
      <div class="wx">
        <a href="#"><img src="/aside/wechatgreen.png" alt="" /></a>
        <div class="wxerweima">
          <img src="/aside/ewm-l.png" alt="" />
          <p>扫描二维码</p>
          <p>关注北面官方微信</p>
        </div>
      </div>
      <div class="wb">
        <a href="#"> <img src="/aside/weibo.png" alt="" /></a>
        <div class="wberweima">
          <img src="/aside/Weibo2.png" alt="" />
          <p>扫描二维码</p>
          <p>关注北面官方微博</p>
        </div>
      </div>
      <div class="top_top">
        <a href="javascript:scroll(0,0)"><img src="/aside/top.png" alt="" /></a>
      </div>
    </div>
  </div>
</template>

<style lang="scss">
.foot {
  text-align: center;
  line-height: 1.5;
  width: 100%;
  height: 530px;
  .foot_top {
    z-index: 100;
    padding: 20px;
    margin: 30px 0 0;
    background-color: black;
    width: 100vw;
    height: 165.25px;
    color: white;
    display: flex;
    justify-content: space-around;
    .left {
      width: 182px;
      height: 165.25px;
      margin-left: 150px;
      p {
        font-size: 12px;
        margin: 0;
      }
      div {
        font-size: 24px;
        margin: 0;
      }
      img {
        width: 70px;
        height: 67.5px;
      }
    }
    .right {
      img {
        width: 200px;
        height: 94.64px;
        margin-right: 80px;
      }
    }
  }
  .foot_main {
    height: 244px;
    display: flex;
    padding: 40px 0 0;
    justify-content: space-around;
    width: 100vw;
    .left {
      width: 756px;
      height: 244px;
      padding: 0 0 0 100px;
      display: flex;
      justify-content: space-around;
      ul {
        text-align: left;
        font-size: 16px;
        font-weight: bold;
        color: black;
        margin: 0;
        padding: 0;
        p {
          margin: 0;
          padding: 0 0 20px 0;
        }
        li {
          list-style-type: none;
          text-align: left;
          line-height: 25px;
          font-size: 14px;
          font-weight: normal;
        }
      }
    }
    .right {
      padding-right: 200px;
      width: 432px;
      height: 202px;
      img {
        width: 100px;
        height: 100px;
      }
      p {
        font-size: 12px;
        color: black;
        margin: 0;
      }
      div {
        border: 1px solid #ddd;
        width: 76%;
        line-height: 40px;
        border-radius: 40px;
        margin: 10px auto;
        font-size: 14px;
      }
    }
  }
  .bot {
    width: 1200px;
    margin: 0 auto;
    text-align: center;
    padding: 80px 0 20px 0;
    p {
      font-size: 12px;
      color: #999;
      margin: 0;
      display: block;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0px;
      margin-inline-end: 0px;
    }
  }
  .right_aside {
    width: 60px;
    height: 244px;
    position: fixed;
    top: 50%;
    right: 0;
    width: 60px;
    height: auto;
    z-index: 9;
    margin-top: -5%;
    .wx {
      .wxerweima {
        position: absolute;
        height: 186px;
        width: 156px;
        right: 61px;
        top: -63px;
        background: #333;
        opacity: 0.9;
        display: none;
        img {
          margin: 0 auto;
          text-align: center;
          width: 92px;
          height: 92px;
          margin-top: 15px;
          padding: 6px;
          position: relative;
          z-index: 2;
          box-sizing: border-box;
          display: block;
        }
        p {
          font-size: 14px;
          margin: 0;
          height: 25px;
          line-height: 25px;
          color: #fff;
        }
      }
    }
    .wx:hover .wxerweima {
      display: block;
    }

    .wb {
      .wberweima {
        position: absolute;
        height: 186px;
        width: 156px;
        right: 61px;
        top: -63px;
        background: #333;
        opacity: 0.9;
        display: none;
        img {
          margin: 0 auto;
          text-align: center;
          width: 92px;
          height: 92px;
          margin-top: 15px;
          padding: 6px;
          position: relative;
          z-index: 2;
          box-sizing: border-box;
          display: block;
        }
        p {
          font-size: 14px;
          margin: 0;
          height: 25px;
          line-height: 25px;
          color: #fff;
        }
      }
    }
    .wb:hover .wberweima {
      display: block;
    }


    div {
      height: 60px;
      width: 100%;
      line-height: 60px;
      text-align: center;
      position: relative;
      margin-bottom: 1px;
      background-color: black;
    }
    .top_top {
      img {
        width: 60px;
        height: 60px;
      }
    }
  }
}
</style>