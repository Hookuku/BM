set names utf8;
drop database if exists bm;
create database bm charset=utf8;
use bm;

-- 商品分类
create table bm_cloth_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname varchar(32)
);
insert INTO bm_cloth_family values
(NULL,"男衣"),
(NULL,"男裤"),
(NULL,"女衣"),
(NULL,"女裤"),
(NULL,"童男"),
(NULL,"童女"),
(NULL,"装备"),
(NULL,"全部");



-- 商品详情
create table bm_cloth(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  family_id int,              #所属类型家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  color VARCHAR(64),          #颜色
  size1 VARCHAR(64),          #尺寸

  parameter VARCHAR(1030),    #产品参数
  science1 VARCHAR(1030),     #科技展示
  science2 VARCHAR(1030),     #科技展示
  func VARCHAR(1030),         #功能展示
  product1 VARCHAR(1030),     #产品展示
  product2 VARCHAR(1030),     #产品展示
  details1 VARCHAR(1030),     #细节展示
  details2 VARCHAR(1030),     #细节展示
  color1 VARCHAR(1030),       #颜色展示
  color2 VARCHAR(1030),       #颜色展示
  applied VARCHAR(1030),      #适用环境
  size VARCHAR(1030),         #尺码表
  pic varchar(1030),
  foreign key(family_id) references bm_cloth_family(fid)
); 
INSERT INTO bm_cloth VALUES
(NULL,1,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","248.00","黑色","S","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,1,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","248.00","蓝色","M","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,1,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","248.00","灰色","L","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,1,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","248.00","红色","S","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,2,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","248.00","红色","S","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,2,"TheNorthFace北面短袖T恤男户外吸湿排汗上新|4UB8","服装-T恤","248.00","蓝色","S","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,2,"TheNorthFace北面短袖T恤男户外吸湿排汗上新|4UB8","服装-T恤","248.00","黑色","S","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,2,"TheNorthFace北面短袖T恤男户外吸湿排汗上新|4UB8","服装-T恤","248.00","红色","S","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,3,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","348.00","绿色","M","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,3,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","348.00","黑色","M","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,3,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","348.00","灰色","M","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,3,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","348.00","粉色","M","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,4,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","348.00","蓝色","L","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,4,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","348.00","黑色","L","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,4,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","348.00","紫色","L","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,4,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","348.00","绿色","L","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,5,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","448.00","黑色","XL","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,5,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","448.00","黑色","XL","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,5,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","448.00","黑色","XL","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,5,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","448.00","黑色","XL","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,6,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","448.00","黑色","XXL","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,6,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","448.00","黑色","XXL","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,6,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","448.00","黑色","XXL","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,6,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","448.00","黑色","XXL","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,7,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","548.00","紫色","M","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,7,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","548.00","紫色","M","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,7,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","548.00","紫色","M","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,7,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","548.00","紫色","M","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,8,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","548.00","紫色","L","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,8,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","548.00","紫色","L","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,8,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","548.00","紫色","L","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg"),
(NULL,8,"TheNorthFace北面短袖T恤女户外吸湿排汗上新|4UB8","服装-T恤","548.00","紫色","L","/details_img/parameter.jpg","/details_img/kejizhanshi.jpg","/details_img/science.gif","/details_img/func.jpg","/details_img/chanpinzhanshi.jpg","/details_img/product.jpg","/details_img/details.jpg","/details_img/xijiezhanshi.jpg","/details_img/yansezhanshi.jpg","/details_img/color.jpg","/details_img/applied.jpg","/details_img/size.jpg","/cloth_pic/sm_1.jpg");

-- 商品图片
create table bm_cloth_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  cloth_id int,                #商品编号
  sm VARCHAR(1030),            #小图片路径
  md VARCHAR(1030),            #中图片路径
  lg VARCHAR(1030),             #大图片路径
  foreign key(cloth_id) references bm_cloth(cid)
);
INSERT INTO bm_cloth_pic VALUES
(NULL,1,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_1.jpg","/cloth_pic/lg_1.jpg"),
(NULL,1,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_2.jpg","/cloth_pic/lg_2.jpg"),
(NULL,1,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_3.jpg","/cloth_pic/lg_3.jpg"),
(NULL,1,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_4.jpg","/cloth_pic/lg_4.jpg"),
(NULL,1,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_5.jpg","/cloth_pic/lg_5.jpg"),
(NULL,2,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_1.jpg","/cloth_pic/lg_1.jpg"),
(NULL,2,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_2.jpg","/cloth_pic/lg_2.jpg"),
(NULL,2,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_3.jpg","/cloth_pic/lg_3.jpg"),
(NULL,2,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_4.jpg","/cloth_pic/lg_4.jpg"),
(NULL,2,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_5.jpg","/cloth_pic/lg_5.jpg"),
(NULL,3,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_1.jpg","/cloth_pic/lg_1.jpg"),
(NULL,3,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_2.jpg","/cloth_pic/lg_2.jpg"),
(NULL,3,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_3.jpg","/cloth_pic/lg_3.jpg"),
(NULL,3,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_4.jpg","/cloth_pic/lg_4.jpg"),
(NULL,3,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_5.jpg","/cloth_pic/lg_5.jpg"),
(NULL,4,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_1.jpg","/cloth_pic/lg_1.jpg"),
(NULL,4,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_2.jpg","/cloth_pic/lg_2.jpg"),
(NULL,4,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_3.jpg","/cloth_pic/lg_3.jpg"),
(NULL,4,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_4.jpg","/cloth_pic/lg_4.jpg"),
(NULL,4,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_5.jpg","/cloth_pic/lg_5.jpg"),
(NULL,5,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_1.jpg","/cloth_pic/lg_1.jpg"),
(NULL,5,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_2.jpg","/cloth_pic/lg_2.jpg"),
(NULL,5,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_3.jpg","/cloth_pic/lg_3.jpg"),
(NULL,5,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_4.jpg","/cloth_pic/lg_4.jpg"),
(NULL,5,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_5.jpg","/cloth_pic/lg_5.jpg"),
(NULL,6,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_1.jpg","/cloth_pic/lg_1.jpg"),
(NULL,6,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_2.jpg","/cloth_pic/lg_2.jpg"),
(NULL,6,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_3.jpg","/cloth_pic/lg_3.jpg"),
(NULL,6,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_4.jpg","/cloth_pic/lg_4.jpg"),
(NULL,6,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_5.jpg","/cloth_pic/lg_5.jpg"),
(NULL,7,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_1.jpg","/cloth_pic/lg_1.jpg"),
(NULL,7,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_2.jpg","/cloth_pic/lg_2.jpg"),
(NULL,7,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_3.jpg","/cloth_pic/lg_3.jpg"),
(NULL,7,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_4.jpg","/cloth_pic/lg_4.jpg"),
(NULL,7,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_5.jpg","/cloth_pic/lg_5.jpg"),
(NULL,8,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_1.jpg","/cloth_pic/lg_1.jpg"),
(NULL,8,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_2.jpg","/cloth_pic/lg_2.jpg"),
(NULL,8,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_3.jpg","/cloth_pic/lg_3.jpg"),
(NULL,8,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_4.jpg","/cloth_pic/lg_4.jpg"),
(NULL,8,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_5.jpg","/cloth_pic/lg_5.jpg"),
(NULL,9,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_1.jpg","/cloth_pic/lg_1.jpg"),
(NULL,9,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_2.jpg","/cloth_pic/lg_2.jpg"),
(NULL,9,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_3.jpg","/cloth_pic/lg_3.jpg"),
(NULL,9,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_4.jpg","/cloth_pic/lg_4.jpg"),
(NULL,9,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_5.jpg","/cloth_pic/lg_5.jpg"),
(NULL,10,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_1.jpg","/cloth_pic/lg_1.jpg"),
(NULL,10,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_2.jpg","/cloth_pic/lg_2.jpg"),
(NULL,10,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_3.jpg","/cloth_pic/lg_3.jpg"),
(NULL,10,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_4.jpg","/cloth_pic/lg_4.jpg"),
(NULL,10,"/cloth_pic/sm_1.jpg","/cloth_pic/mb_5.jpg","/cloth_pic/lg_5.jpg");


-- 用户信息
create table bm_user(
  uid int primary key auto_increment,
  phone varchar(16),  
  uname varchar(32),
  upwd varchar(20),
  sex boolean default 1,
  birthday date,
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16)         #区
);
INSERT INTO bm_user VALUES
(NULL,"1","Tom","123456",default,"1990-5-5","四川省","成都市","锦江区"),
(NULL,"2","Jerry","123456",default,"1990-5-5","四川省","成都市","锦江区"),
(NULL,"3","Timi","123456",default,"1990-5-5","四川省","成都市","锦江区"),
(NULL,"4","Rose","123456",default,"1990-5-5","四川省","成都市","锦江区");

-- 用户购物车信息
create table bm_cart(
  id int primary key auto_increment,
  cid   int,            #商品id  
  price DECIMAL(10,2),  #商品价格
  count int,            #商品数量
  title varchar(100),   #商品标题名称
  color VARCHAR(64),   #商品颜色
  size1  VARCHAR(64),  #商品尺寸 
  pic   varchar(1030),  #商品小图
  uid   int             #用户id
);

-- 用户收货详细地址
CREATE TABLE bm_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  cellphone VARCHAR(16),      #手机
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #区
  address VARCHAR(128),       #详细地址
  postcode CHAR(6),           #邮编

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);
INSERT INTO bm_receiver_address VALUES
(NULL,"1","Tom","1","四川省","成都市","锦江区","金融街明宇金融大厦","001001",true),
(NULL,"2","Jerry","2","四川省","成都市","锦江区","金融街明宇金融大厦","001001",true),
(NULL,"3","Timi","3","四川省","成都市","锦江区","金融街明宇金融大厦","001001",true),
(NULL,"4","Rose","4","四川省","成都市","锦江区","金融街明宇金融大厦","001001",true);

/**购物车条目**/
-- CREATE TABLE bm_shoppingcart_item(
--   iid INT PRIMARY KEY AUTO_INCREMENT,
--   user_id INT,      #用户编号
--   product_id INT,   #商品编号
--   count INT,        #购买数量
--   is_checked BOOLEAN #是否已勾选，确定购买
-- );

/**用户订单**/
CREATE TABLE bm_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
);

/**用户订单**/
CREATE TABLE bm_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页商品****/
CREATE TABLE bm_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(1030),
  title VARCHAR(64),
  price DECIMAL(10,2)
);
INSERT INTO bm_index_product VALUES
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","2098"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","2098.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","2098.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","2098.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","2098.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","2098.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","2098.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","2098.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","2098.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","3333.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","3333.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","3333.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","3333.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","3333.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","3333.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","3333.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","3333.00"),
(NULL,"/shouye_pic/1.jpg","TheNorthFace北面夹棉外套女户外保暖防泼水上新|5GAX","3333.00");