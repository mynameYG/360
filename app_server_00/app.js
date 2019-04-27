// app_server_00/app.js
//0:下载mysql express模块
//1:引入两个模块mysql express
const mysql = require('mysql');
const express = require('express');
const cors = require("cors");
//2:创建连接池
var pool=mysql.createPool({
    host:'127.0.0.1',
    user:'root',
    password:'',
    database:'aaa'
});

//3:创建express对象 创建web服务器
var server = express();
server.use(express.static("public"))
//4:为express对象绑定监听端口 3000
server.listen(3000,()=>{console.log('服务器创建成功')});
// 跨域
server.use(cors({
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  credentials:true
 }))
 
//3.11:加载模块 express-session
//并且对其配置  顺序问题
const session = require("express-session");
server.use(session({
  secret:"128位随机字符串",
  resave:false,
  saveUninitialized:true,
  cookie:{
    maxAge:1000*60*60
  }
}))



 //：配置第三方中间件
const bodyParser = require("body-parser");
//: 配置json是否是自动转换 
server.use(bodyParser.urlencoded({extended:false}))
//功能一：用户登录
//1:用户get 请求路径/login
server.get("/login",(req,res)=>{
   var  u=req.query.uname
   var  p=req.query.upwd;
   var sql="SELECT id FROM login WHERE uname = ? AND upwd = md5(?)"
   pool.query(sql,[u,p],(err,result)=>{ 
     if(err) throw err;     //result 查询的结果 是个数组
     //获取数据库返回的信息 
     if(result.length==0){
       res.send({code:-1,msg:"用户名或密码错误"})
     }else{
       //获取用户id 
        var uid =result[0].id;
       //保存session对象中
        req.session.uid=uid
       res.send({code:1,msg:"登陆成功"})
     }
   })
})

//  首页轮播图
server.get("/imglist",(req,res)=>{
  var rows = [
    {id:1,img_url:"http://127.0.0.1:3000/img/index/banner1.png"},
    {id:2,img_url:"http://127.0.0.1:3000/img/index/banner2.png"},
    {id:3,img_url:"http://127.0.0.1:3000/img/index/banner3.png"},
    {id:4,img_url:"http://127.0.0.1:3000/img/index/banner4.png"},
  ];
  res.send({code:1,data:rows});
});
server.get("/grid",(req,res)=>{
  var  rows=[
    {id:1,title:"最新商品",img_url:"http://127.0.0.1:3000/img/grid/grid6.webp"},
    {id:2,title:"商品列表",img_url:"http://127.0.0.1:3000/img/grid/grid7.webp"},
    {id:3,title:"商品评价",img_url:"http://127.0.0.1:3000/img/grid/grid8.webp"},
    {id:4,title:"每日签到",img_url:"http://127.0.0.1:3000/img/grid/grid9.webp"},
    {id:5,title:"活动中心",img_url:"http://127.0.0.1:3000/img/grid/grid10.webp"},
  ];
  res.send(rows)
})
server.get("/box",(req,res)=>{
  var rows=[
    {id:1,title:"360胎压检测仪",no_pice:299,pice:259,img_url:"http://127.0.0.1:3000/img/box/box1.webp"},
    {id:2,title:"360安全路由器",no_pice:149,pice:139,img_url:"http://127.0.0.1:3000/img/box/box2.webp"},
    {id:3,title:"360智能摄像机",no_pice:299,pice:259,img_url:"http://127.0.0.1:3000/img/box/box3.webp"},
  ];
  res.send(rows)
})

server.get("/pages",(req,res)=>{
  var rows=[{
    id:1,img1:"http://127.0.0.1:3000/img/mp4/m1.webp",
    id:2,img2:"http://127.0.0.1:3000/img/mp4/m2.webp",
    id:3,img3:"http://127.0.0.1:3000/img/mp4/m3.webp",
    id:4,img4:"http://127.0.0.1:3000/img/mp4/mm.mp4" ,
    id:5,img5:"http://127.0.0.1:3000/img/mp4/ee.webp"
  }]
  res.send(rows)
})

//功能二:商品分页显示
server.get("/product",(req,res)=>{
  //1:参数
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  //2允许使用默认值
  if(!pno){pno=1}
  if(!pageSize){pageSize=6}
  //3SQL
  var sql="SELECT Iid,title,price,pic FROM products_img GROUP BY Iid LIMIT ?,?"
  //4.json
  var offset=(pno-1)*pageSize;
  var ps=parseInt(pageSize)
  pool.query(sql,[offset,ps],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result})
  })
})

//新闻的分页显示
//功能五:新闻分页显示
server.get("/news",(req,res)=>{
  //*参数    pno 页码 pageSize 页大小
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  //*默认值  1   7
  if(!pno){pno=1}
  if(!pageSize){pageSize=7}
  var sql = " SELECT id,title,ctime,";
      sql +=" point,img_url";
      sql +=" FROM xz_news";
      sql +=" LIMIT ?,?";
  var offset = (pno-1)*pageSize;
  pageSize = parseInt(pageSize);
  pool.query(sql,[offset,pageSize],(err,result)=>{
       if(err)throw err;
       res.send({code:1,data:result});
  });    
  //*json   {code:1,data:[]}
});


//功能六:新闻详细信息
server.get("/newsInfo",(req,res)=>{
  //1:获取客户参数 nid
  var nid = req.query.nid;
  //2:拦载用户非法参数
  var reg = /^[0-9]{1,}$/;
  if(!reg.test(nid)){
     res.send({code:-1,msg:"参数格式不正确"});
     return;
  }
  var sql = "SELECT id,content,ctime";
  sql +=" ,img_url";
  sql +=" FROM xz_news WHERE id = ?";
  nid = parseInt(nid);
  pool.query(sql,[nid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result});
  })
  //3:{code:1,data:[]}  发送出去的是uid
})


//功能七:发送评论

server.post("/addcomment",(req,res)=>{
  //1:获取参数 nid 新闻编号 content评论内容
  var nid = req.body.nid;
  var content = req.body.content;
  //2:sql
  var sql = "INSERT INTO xz_conmment VALUES(null,?,?,now())";
  pool.query(sql,[nid,content],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"添加成功"})    
  })
  //3:json
});


// 评论表
server.get("/getComment",(req,res)=>{
  //1:参数 
  var nid = req.query.nid;
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 5;
  }
  //2:sql
  var sql = " SELECT id,nid,content,ctime";
  sql+=" FROM xz_conmment";
  sql+=" WHERE nid = ?";
  sql+=" LIMIT ?,?";
  var offset = (pno-1)*pageSize;
  pageSize = parseInt(pageSize);
  pool.query(sql,[nid,offset,pageSize],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result});
  })
  //3:result
});

// 查询购物车列表
server.get("/getShopCart",(req,res)=>{
  // 用户没登录 查询购物车列表
  if(!req.session.uid){
    res.send({code:-1,data:[],msg:"请登录"});
    return;
  }
   var  uid=req.session.uid;
   var sql="SELECT id,pid,price,uid,pname FROM xz_cart WHERE uid=?";
   pool.query(sql,[uid],(err,result)=>{
     if(err)throw err;
     res.send({code:1,data:result})
   })
})

//删除购物车中某个商品 
server.post("/removeItem",(req,res)=>{
  var id=req.body.id;
  var sql="DELETE FROM xz_cart WHERE id=?"
  id=parseInt(id);
  pool.query(sql,[id],(err,result)=>{
     if(err)throw err;
     if(result.affectedRows>0){ // 影响行数
       res.send({code:1,msg:"删除成功"})
     }else{
       res.send({code:-1,msg:"删除失败"})
     }
  })
})

//:用户点击添加购物车按钮
server.get("/addcart",(req,res)=>{
  //0:向数据表 xz_cart 添加一列count INT
  //ALTER TABLE xz_cart ADD count INT;
  //UPDATE xz_cart SET count = 1;
  //1:获取参数 uid pid pname price
  var uid = 1;
  var pid =    req.query.pid;
  var pname =  req.query.pname;
  var price =  req.query.price;
  //2:判断用户是否登录
  //3:如果当前用户未登录 程序停止
  //  返回出错信息  请登录
  //4:创建sql语句查询当前用户是否添加过此商品
  var sql = "SELECT id FROM xz_cart";
  sql+=" WHERE uid = ? AND pid = ?";
  pool.query(sql,[uid,pid],(err,result)=>{
     if(err)throw err;
     //回调函数:什么时候执行函数
     //sql语句执行完毕并且返回结果
     if(result.length==0){
       var sql = `INSERT INTO xz_cart`;
       sql+=` VALUES(null,${uid},${pid},${price},'${pname}',1)`;
     }else{
       var sql = `UPDATE xz_cart SET`;
       sql+=` count=count+1`;
       sql+=` WHERE uid = ${uid} AND pid=${pid}`;
     }
     pool.query(sql,(err,result)=>{
       if(err)throw err;
       res.send({code:1,msg:"添加成功"})
     }); 
  })
  });

  //功能十一:删除用户选中(多个)商品
server.get("/removeMItem",(req,res)=>{
  //1:参数 5,10
  var ids = req.query.ids;
  //2:sql
  var sql = "DELETE FROM xz_cart";
  sql+=" WHERE id IN ("+ids+")";
  //3:json
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"成功删除多个商品"})
    }else{
      res.send({code:-1,msg:"删除失败"});
    }
  })
}); 

//功能十二:用户点击添加购物车按钮
server.get("/addcart",(req,res)=>{
  //0:向数据表 xz_cart 添加一列count INT
  //ALTER TABLE xz_cart ADD count INT;
  //UPDATE xz_cart SET count = 1;
  //1:获取参数 uid pid pname price
  var uid = 1;
  var pid =    req.query.pid;
  var pname =  req.query.pname;
  var price =  req.query.price;
  //2:判断用户是否登录
  //3:如果当前用户未登录 程序停止
  //  返回出错信息  请登录
  //4:创建sql语句查询当前用户是否添加过此商品
  var sql = "SELECT id FROM xz_cart";
  sql+=" WHERE uid = ? AND pid = ?";
  pool.query(sql,[uid,pid],(err,result)=>{
     if(err)throw err;
     //回调函数:什么时候执行函数
     //sql语句执行完毕并且返回结果
     if(result.length==0){
       var sql = `INSERT INTO xz_cart`;
       sql+=` VALUES(null,${uid},${pid},${price},'${pname}',1)`;
     }else{
       var sql = `UPDATE xz_cart SET`;
       sql+=` count=count+1`;
       sql+=` WHERE uid = ${uid} AND pid=${pid}`;
     }
     pool.query(sql,(err,result)=>{
       if(err)throw err;
       res.send({code:1,msg:"添加成功"})
     }); 
  })
  });

//功能十三:用户点击商品列表显示商品详细信息
//http://127.0.0.1:3000/findProduct?Iid=9
server.get("/findProduct",(req,res)=>{
 //1:参数 lid 商品编号
 var Iid = req.query.Iid;
 //2:sql  select
 var sql = "SELECT Iid, price,title, pic FROM products_img WHERE Iid = ?"; 
 //3:json {code:1,data:[]}
 pool.query(sql,[Iid],(err,result)=>{
   if(err)throw err;
   res.send({code:1,data:result})
 })
})

//#功能十四:微信小程序返回美食列表
//分页
server.get("/shoplist",(req,res)=>{
  //1:获取二个参数 pno pageSize
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  //2:设置默认值   1   4
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 6;
  }
  //3:创建sql 查询当前页内容
  var sql = "SELECT id,dname,img_url,";
  sql+=" ctime,point,addr";
  sql+=" FROM xz_shoplist";
  sql+=" LIMIT ?,?";
  //4:发送sql 获取结果
  var offset = (pno-1)*pageSize;
  pageSize = parseInt(pageSize);
  pool.query(sql,[offset,pageSize],(err,result)=>{
     if(err)throw err;
     res.send({code:1,data:result});
  })
  //5:将查询结果发送客户端
});