const express = require("express");
const session = require("express-session");
//引入连接池模块
const pool = require("../pool.js");
//创建路由器对象
const r = express.Router();
var query = require("./query");

//1.登录模块
r.post("/v1/signin", (req, res) => {
  var { phone, upwd } = req.body;
  var sql = "select * from bm_user where phone=? and upwd=?";
  pool.query(sql, [phone, upwd], (err, result) => {
    err && console.log(err);
    if (result.length > 0) {
      // console.log(result[0]);
      req.session.uid = result[0].uid;
      // req.session.phone = result[0].phone;
      // req.session.upwd = result[0].upwd;
      // console.log(result[0]);
      res.write(
        JSON.stringify({
          code: 1000,
          uid: result[0].uid,
        })
      );
    } else {
      res.write(JSON.stringify({ code: 1041, msg: "用户名或密码错误!" }));
    }
    res.end();
  });
});

//2.查询商品列表
r.get("/v1/list", (req, res) => {
  var output = {
    count: 0,
    pageSize: 9,
    pageCount: 0,
    pno: req.query.pno || 0,
    data: [],
  };
  var kw = req.query.kw || "";
  var kws = kw.split(" ");
  kws.forEach((elem, i, arr) => {
    arr[i] = `title like '%${elem}%'`;
  });
  var where = kws.join(" and ");
  var sql = `select *,(select pid from bm_cloth_pic where pid=cid limit 1) as pid from bm_cloth where ${where}`;
  query(sql, [])
    .then((result) => {
      output.count = result.length;
      output.pageCount = Math.ceil(output.count / output.pageSize);
      sql += ` limit ?,?`;
      return query(sql, [output.pageSize * output.pno, output.pageSize]);
    })
    .then((result) => {
      output.data = result;
      res.send(output);
    });
});

//2.1查询用户列表
r.get("/v1/search", (req, res) => {
  var output = {
    count: 0,
    pageSize: 10,
    pageCount: 0,
    pno: req.query.pno || 0,
    data: [],
  };
  var sql = `select * from bm_user`;
  query(sql, [])
    .then((result) => {
      output.count = result.length;
      output.pageCount = Math.ceil(output.count / output.pageSize);
      sql += ` limit ?,?`;
      return query(sql, [output.pageSize * output.pno, output.pageSize]);
    })
    .then((result) => {
      output.data = result;
      res.send(output);
    });
});

//3.根据uid删除用户
r.delete("/v1/delete/:uid", (req, res) => {
  var uid = req.params.uid;
  var sql = "delete from bm_user where uid=?";
  pool.query(sql, [uid], (err, result) => {
    if (err) throw err;
    if (result.affectedRows > 0) {
      res.send();
    } else {
      res.send();
    }
  });
});

//4.根据uid修改用户信息
r.get("/v1/search/:uid", (req, res) => {
  var _uid = req.params.uid;
  var sql = "select * from bm_user where uid=?";
  pool.query(sql, [_uid], (err, result) => {
    if (err) throw err;
    if (result == "") {
      res.send(`没有id为${_uid}的用户`);
    } else {
      res.send(result[0]);
    }
  });
});

//5.根据phone修改用户密码
r.post("/v1/changepwd", (req, res) => {
  var { phone, oldupwd, upwd } = req.body;
  var sql1 = "select * from bm_user where phone=? and upwd=? ";
  pool.query(sql1, [phone, oldupwd], (err, result) => {
    if (err) {
      console.log(err);
      res.write(
        JSON.stringify({
          code: 0,
          msg: "密码修改失败！",
        })
      );
      res.end();
    } else if (result.length == 0) {
      res.write(
        JSON.stringify({
          code: 1,
          msg: "用户名或原密码错误",
        })
      );
      res.end();
    } else {
      var sql2 = "UPDATE `bm_user` SET `upwd`=? WHERE `phone`=?";
      pool.query(sql2, [upwd, phone], (err, result) => {
        err && console.log(err);
        if (err) {
          console.log(err);
          res.write(
            JSON.stringify({
              code: 0,
              msg: "修改密码失败",
            })
          );
        } else {
          res.write(
            JSON.stringify({
              code: 2,
              msg: "密码修改成功",
            })
          );
        }
        res.end();
      });
    }
  });
});

//6.注册用户
r.post("/v1/signup", (req, res) => {
  var { phone, upwd } = req.body;
  var sql1 = "select * from bm_user where phone=?";
  pool.query(sql1, [phone], (err, result) => {
    if (err) {
      // console.log(err);
      res.write(
        JSON.stringify({
          code: 0,
          msg: "注册失败",
        })
      );
      res.end();
    } else if (result.length > 0) {
      res.write(
        JSON.stringify({
          code: 1,
          msg: "用户名已存在",
        })
      );
      res.end();
    } else {
      var sql2 = "INSERT INTO `bm_user`(`phone`, `upwd`) VALUES (?,?)";
      pool.query(sql2, [phone, upwd], (err, result) => {
        if (err) {
          // console.log(err);
          res.write(
            JSON.stringify({
              code: 0,
              msg: "注册失败啦",
            })
          );
        } else if (result != null) {
          res.write(
            JSON.stringify({
              code: 2,
              msg: "注册成功啦",
            })
          );
        }
        res.end();
      });
    }
  });
});

// 7.分页查询
r.get("/v1/goods", (req, res) => {
  var output = {
    count: 0,
    pageSize: 9,
    pageCount: 0,
    pno: req.query.pno || 0,
    data: [],
  };
  var kw = req.query.kw || "";
  var kws = kw.split(" ");
  kws.forEach((elem, i, arr) => {
    arr[i] = `title like '%${elem}%'`;
  });
  var where = kws.join(" and ");
  var sql = `select *,(select pid from bm_cloth_pic where pid=cid limit 1) as pid from bm_cloth where ${where}`;
  query(sql, [])
    .then((result) => {
      output.count = result.length;
      output.pageCount = Math.ceil(output.count / output.pageSize);
      sql += ` limit ?,?`;
      return query(sql, [output.pageSize * output.pno, output.pageSize]);
    })
    .then((result) => {
      output.data = result;
      res.send(output);
    });
});

//8.详情页
r.get("/v1/details", (req, res) => {
  var cid = req.query.cid || "";
  var output = {};
  var sql = "SELECT * FROM `bm_cloth` where cid=?";
  query(sql, [cid])
    //open(result)->then(result=>{...})
    .then((result) => {
      output.product = result[0];
      var fid = output.product.family_id;
      var sql = "SELECT color,size1,pic FROM `bm_cloth` where family_id=?";
      //要想继续用then，必须返回Promise对象
      return query(sql, [fid]); //return Promise
    })
    //open(result)->then(result=>{...})
    .then((result) => {
      output.specs = result;
      var sql = "SELECT * FROM `bm_cloth_pic` where cloth_id=?";
      return query(sql, [cid]);
    })
    //open(result)->then(result=>{...})
    .then((result) => {
      output.pics = result;
      res.send(output);
    })
    //err(error)->catch(error=>{...})
    .catch((error) => console.log(error));
});

// 9.添加购物车
r.get("/v1/addcart", (req, res) => {
  var uid = req.session.uid;
  console.log(req.session);
  console.log(uid);
  if (!uid) {
    res.send({ code: -1, msg: "请先登录" });
    return;
  }
  var cid = req.query.cid * 1;
  var price = req.query.price;
  var _count = req.query.count;
  var title = req.query.title;
  var color = req.query.color;
  var size1 = req.query.size1;
  var pic = req.query.pic;
  var sql = `select id from bm_cart `;
  sql += `where uid = ? and cid = ?`;
  pool.query(sql, [uid, cid], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      var sql = `insert into bm_cart values(null,${cid},${price},${_count},'${title}','${color}','${size1}','${pic}',${uid})`;
    } else {
      var sql = `update bm_cart set count=(count+${_count}) where uid=${uid} and cid = ${cid}`;
    }
    pool.query(sql, (err, result) => {
      if (err) throw err;
      if (result.affectedRows > 0) {
        res.send({ code: 1, msg: "商品添加成功" });
      } else {
        res.send({ code: -2, msg: "商品添加失败" });
      }
    });
  });
});

// 10.退出登录
r.get("/v1/logout", (req, res) => {
  req.session.uid = null;
  res.send();
}),
  // 11.操作购物车
  r.get("/v1/carts", (req, res) => {
    var uid = req.session.uid;
    var output = {
      count: 0,
      pageSize: 5,
      pageCount: 0,
      pno: req.query.pno || 0,
      data: [],
    };
    if (!uid) {
      res.send({ code: -1, msg: "请登录再操作" });
      return;
    }
    var sql = `select id,cid,price,count,title,color,size1,pic from bm_cart where uid = ${uid} `;
    query(sql, [])
      .then((result) => {
        output.count = result.length;
        output.pageCount = Math.ceil(output.count / output.pageSize);
        sql += ` limit ?,?`;
        return query(sql, [output.pageSize * output.pno, output.pageSize]);
      })
      .then((result) => {
        output.data = result;
        res.send({ code: 1, output });
      });
  });

// 12.删除购物车商品
r.get("/v1/deletecart", (req, res) => {
  var uid = req.session.uid;
  if (!uid) {
    res.send({ code: -2, msg: "请先登录" });
    return;
  }
  var id = req.query.id;
  var sql = "delete from bm_cart where id = ? ";
  pool.query(sql, [id], (err, result) => {
    if (err) throw err;
    if (result.affectedRows > 0) {
      res.send({ code: 1, msg: "删除成功" });
    } else {
      res.send({ code: -1, msg: "删除失败" });
    }
  });
});

//13.删除购物车多个商品
r.get("/v1/delcarts", (req, res) => {
  var uid = req.session.uid;
  if (!uid) {
    res.send({ code: -2, msg: "请先登录" });
    return;
  }
  var id = req.query.id;
  var sql = `delete from bm_cart where id IN (${id})`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    if (result.affectedRows > 0) {
      res.send({ code: 1, msg: "删除成功" });
    } else {
      res.send({ code: -1, msg: "删除失败" });
    }
  });
});

// // 12.更新购物车商品数量
// r.get("/v1/changecount", (req, res) => {
//   var uid = req.session.uid;
//   if (!uid) {
//     res.send({ code: -2, msg: "请先登录" });
//     return;
//   }
//   var id = req.query.id;
//   var _count = req.query.count;
//   var sql = `update bm_cart set count=(count+${_count}) where uid=${uid} and id = ${id}`;
//   pool.query(sql, [id], (err, result) => {
//     if (err) throw err;
//     if (result.affectedRows > 0) {
//       res.send({ code: 1, msg: "更新成功" });
//     } else {
//       res.send({ code: -1, msg: "更新失败" });
//     }
//   });
// });
//导出路由器对象
module.exports = r;
