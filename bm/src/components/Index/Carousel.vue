<template>
  <div class="xz-banner">
    <div class="container">
      <div class="carousel slide" data-ride="carousel" id="banner">
        <!-- 展示图  在这个inner里面要放好几张图，因为有了overflow：hidden所以你放几张图，只展示一张在界面上，其它都藏起来了-->
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="../../../public/shouye_pic/lunbo1.jpg" alt="" class="d-block w-100">
          </div>
          <div class="carousel-item">
            <img src="../../../public/shouye_pic/lunbo2.jpg" alt="" class="d-block w-100">
          </div>
          <div class="carousel-item">
            <img src="../../../public/shouye_pic/lunbo3.jpg" alt="" class="d-block w-100">
          </div>
          <div class="carousel-item">
            <img src="../../../public/shouye_pic/lunbo4.jpg" alt="" class="d-block w-100">
          </div>
        </div>
        <!-- 左右控制 -->
        <a href="#banner" class="carousel-control-prev" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a href="#banner" class="carousel-control-next" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
        <!-- 指示符用列表 -->
        <ul class="carousel-indicators xz-ind">
          <li class="active" data-slide-to="0" data-target="#banner"></li>
          <li data-slide-to="1" data-target="#banner"></li>
          <li data-slide-to="2" data-target="#banner"></li>
          <li data-slide-to="3" data-target="#banner"></li>
        </ul>
      </div>
    </div>
  </div>
</template>


  <style lang="scss">
    .xz-ind li {
      width: 10px;
      height: 10px;
      background-color: #999;
      border-radius: 50%;
    }
    .xz-ind .active {
      background-color: white;
    }
  </style>
</head>


