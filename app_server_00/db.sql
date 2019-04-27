#创建数据库
SET NAMES UTF8;
DROP DATABASE IF EXISTS aaa;
CREATE DATABASE aaa CHARSET=UTF8;
USE aaa;

#创建用户登录表
#用户登录密码需要加密保存使用  mysql自带函数md5()
CREATE TABLE login(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25),
  upwd  VARCHAR(32)
);
INSERT INTO login VALUES(null,'tom',md5('123'));
INSERT INTO login VALUES(null,'jerry',md5('123'));
#理解:用户输入123对用户输入内容加密
#加密后与数据密码比较
#SELECT id FROM xz_login
#WHERE uname = ? AND upwd = md5(?)

#创建商品表
CREATE TABLE products_img(
  Iid  INT PRIMARY KEY AUTO_INCREMENT,
  title  VARCHAR(64),
  price DECIMAL(10,2),
  pic  VARCHAR(128)
);
INSERT INTO products_img VALUES(null,'360智能摄像机警戒版',299,'img/product/a1.webp');
INSERT INTO products_img VALUES(null,'360安全路由器2 V2',299,'img/product/a2.webp');
INSERT INTO products_img VALUES(null,'360智能摄像机云台版',199,'img/product/a3.webp');
INSERT INTO products_img VALUES(null,'360儿童手表7X 粉色',199,'img/product/a4.webp');
INSERT INTO products_img VALUES(null,'360安全路由2 P4',99,'img/product/a5.webp');
INSERT INTO products_img VALUES(null,'360可视门铃',2799,'img/product/a6.webp');
INSERT INTO products_img VALUES(null,'360儿童手表SE3',99,'img/product/a7.webp');
INSERT INTO products_img VALUES(null,'360行车记录仪G300',199,'img/product/a8.webp');
INSERT INTO products_img VALUES(null,'【独家】360新品AI智能音箱开箱测评！',299,'img/product/a9.webp');
INSERT INTO products_img VALUES(null,'【猛料】能洗能拖，还有特殊黑科技的扫地机器人！',199,'img/product/a10.webp');
INSERT INTO products_img VALUES(null,'【家庭守门员】不一样的智能门铃体验！',99,'img/product/a11.webp');
INSERT INTO products_img VALUES(null,'【爆款评测】360红色警戒 让危险无所遁形！',299,'img/product/a12.webp');
INSERT INTO products_img VALUES(null,'360智能摄像机警戒版',299,'img/product/a1.webp');
INSERT INTO products_img VALUES(null,'360安全路由器2 V2',299,'img/product/a2.webp');
INSERT INTO products_img VALUES(null,'360智能摄像机云台版',199,'img/product/a3.webp');
INSERT INTO products_img VALUES(null,'360儿童手表7X 粉色',199,'img/product/a4.webp');
INSERT INTO products_img VALUES(null,'360安全路由2 P4',99,'img/product/a5.webp');
INSERT INTO products_img VALUES(null,'360可视门铃 ',2799,'img/product/a6.webp');
INSERT INTO products_img VALUES(null,'360儿童手表SE3 ',99,'img/product/a7.webp');
INSERT INTO products_img VALUES(null,'360行车记录仪G300',199,'img/product/a8.webp');
INSERT INTO products_img VALUES(null,'【独家】360新品AI智能音箱开箱测评！',299,'img/product/a9.webp');
INSERT INTO products_img VALUES(null,'【猛料】能洗能拖，还有特殊黑科技的扫地机器人！',199,'img/product/a10.webp');
INSERT INTO products_img VALUES(null,'【家庭守门员】不一样的智能门铃体验！',99,'img/product/a11.webp');
INSERT INTO products_img VALUES(null,'【爆款评测】360红色警戒 让危险无所遁形！',299,'img/product/a12.webp');
INSERT INTO products_img VALUES(null,'360智能摄像红色警戒版',299,'img/product/a1.webp');
INSERT INTO products_img VALUES(null,'360安全路由器2 V2',299,'img/product/a2.webp');
INSERT INTO products_img VALUES(null,'360智能摄像机云台版',199,'img/product/a3.webp');
INSERT INTO products_img VALUES(null,'360儿童手表7X 粉色',199,'img/product/a4.webp');
INSERT INTO products_img VALUES(null,'360安全路由2 P4',99,'img/product/a5.webp');
INSERT INTO products_img VALUES(null,'360可视门铃',2799,'img/product/a6.webp');
INSERT INTO products_img VALUES(null,'360儿童手表SE3 天空蓝',99,'img/product/a7.webp');
INSERT INTO products_img VALUES(null,'360行车记录仪G300',199,'img/product/a8.webp');
INSERT INTO products_img VALUES(null,'【独家】360新品AI智能音箱开箱测评！',299,'img/product/a9.webp');
INSERT INTO products_img VALUES(null,'【猛料】能洗能拖，还有特殊黑科技的扫地机器人！',199,'img/product/a10.webp');
INSERT INTO products_img VALUES(null,'【家庭守门员】不一样的智能门铃体验！',99,'img/product/a11.webp');
INSERT INTO products_img VALUES(null,'【爆款评测】360红色警戒 让危险无所遁形！',299,'img/product/a12.webp');
INSERT INTO products_img VALUES(null,'360智能摄像红色警戒版',299,'img/product/a1.webp');
INSERT INTO products_img VALUES(null,'360安全路由器2 V2',299,'img/product/a2.webp');
INSERT INTO products_img VALUES(null,'360智能摄像机云台版',199,'img/product/a3.webp');
INSERT INTO products_img VALUES(null,'360儿童手表7X 粉色',199,'img/product/a4.webp');
INSERT INTO products_img VALUES(null,'360安全路由2 P4',99,'img/product/a5.webp');
INSERT INTO products_img VALUES(null,'360可视门铃',2799,'img/product/a6.webp');
INSERT INTO products_img VALUES(null,'360儿童手表SE3 天空蓝',99,'img/product/a7.webp');
INSERT INTO products_img VALUES(null,'360行车记录仪G300',199,'img/product/a8.webp');
INSERT INTO products_img VALUES(null,'【独家】360新品AI智能音箱开箱测评！',299,'img/product/a9.webp');
INSERT INTO products_img VALUES(null,'【猛料】能洗能拖，还有特殊黑科技的扫地机器人！',199,'img/product/a10.webp');
INSERT INTO products_img VALUES(null,'【家庭守门员】不一样的智能门铃体验！',99,'img/product/a11.webp');
INSERT INTO products_img VALUES(null,'【爆款评测】360红色警戒 让危险无所遁形！',299,'img/product/a12.webp');


#创建新闻表
CREATE TABLE xz_news(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255),
  title VARCHAR(255),
  ctime DATETIME,
  point INT,
  content VARCHAR(2000)
);

INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","01",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","02",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","03",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","04",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","05",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","06",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","07",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","08",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","09",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","10",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","11",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","12",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","13",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","14",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","15",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","16",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","17",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","18",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","19",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","20",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","21",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","22",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","23",now(),0,"111");
INSERT INTO xz_news VALUES(null,"http://127.0.0.1:3000/img/1.png","24",now(),0,"111");

#创建新闻评论表
CREATE TABLE xz_conmment(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nid INT,
  content VARCHAR(120),
  ctime DATETIME
);

#创建购物车表
CREATE TABLE xz_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  pid INT,
  price  DECIMAL(10,2),
  pname VARCHAR(255)
);

INSERT INTO xz_cart VALUES(null,1,1,125,"数码相机");
INSERT INTO xz_cart VALUES(null,1,2,5555,"苹果电脑");
INSERT INTO xz_cart VALUES(null,1,3,3125,"华为手机");
INSERT INTO xz_cart VALUES(null,1,4,5125,"华硕笔记本");
INSERT INTO xz_cart VALUES(null,1,5,1025,"金牛皮鞋");
INSERT INTO xz_cart VALUES(null,1,6,25,"可口可乐");
INSERT INTO xz_cart VALUES(null,1,7,25,"雪碧");
INSERT INTO xz_cart VALUES(null,1,8,25,"芬达");
INSERT INTO xz_cart VALUES(null,1,1,125,"数码相机");
INSERT INTO xz_cart VALUES(null,1,2,5555,"苹果电脑");
INSERT INTO xz_cart VALUES(null,1,3,3125,"华为手机");
INSERT INTO xz_cart VALUES(null,1,4,5125,"华硕笔记本");
INSERT INTO xz_cart VALUES(null,1,5,1025,"金牛皮鞋");
INSERT INTO xz_cart VALUES(null,1,6,25,"可口可乐");
INSERT INTO xz_cart VALUES(null,1,7,25,"雪碧");
INSERT INTO xz_cart VALUES(null,1,8,25,"芬达");
INSERT INTO xz_cart VALUES(null,1,1,125,"数码相机");
INSERT INTO xz_cart VALUES(null,1,2,5555,"苹果电脑");
INSERT INTO xz_cart VALUES(null,1,3,3125,"华为手机");
INSERT INTO xz_cart VALUES(null,1,4,5125,"华硕笔记本");
INSERT INTO xz_cart VALUES(null,1,5,1025,"金牛皮鞋");
INSERT INTO xz_cart VALUES(null,1,6,25,"可口可乐");
INSERT INTO xz_cart VALUES(null,1,7,25,"雪碧");
INSERT INTO xz_cart VALUES(null,1,8,25,"芬达");
INSERT INTO xz_cart VALUES(null,1,1,125,"数码相机");
INSERT INTO xz_cart VALUES(null,1,2,5555,"苹果电脑");
INSERT INTO xz_cart VALUES(null,1,3,3125,"华为手机");
INSERT INTO xz_cart VALUES(null,1,4,5125,"华硕笔记本");
INSERT INTO xz_cart VALUES(null,1,5,1025,"金牛皮鞋");
INSERT INTO xz_cart VALUES(null,1,6,25,"可口可乐");
INSERT INTO xz_cart VALUES(null,1,7,25,"雪碧");
INSERT INTO xz_cart VALUES(null,1,8,25,"芬达");
INSERT INTO xz_cart VALUES(null,1,1,125,"数码相机");
INSERT INTO xz_cart VALUES(null,1,2,5555,"苹果电脑");
INSERT INTO xz_cart VALUES(null,1,3,3125,"华为手机");
INSERT INTO xz_cart VALUES(null,1,4,5125,"华硕笔记本");
INSERT INTO xz_cart VALUES(null,1,5,1025,"金牛皮鞋");
INSERT INTO xz_cart VALUES(null,1,6,25,"可口可乐");
INSERT INTO xz_cart VALUES(null,1,7,25,"雪碧");
INSERT INTO xz_cart VALUES(null,1,8,25,"芬达");
INSERT INTO xz_cart VALUES(null,1,1,125,"数码相机");
INSERT INTO xz_cart VALUES(null,1,2,5555,"苹果电脑");
INSERT INTO xz_cart VALUES(null,1,3,3125,"华为手机");
INSERT INTO xz_cart VALUES(null,1,4,5125,"华硕笔记本");
INSERT INTO xz_cart VALUES(null,1,5,1025,"金牛皮鞋");
INSERT INTO xz_cart VALUES(null,1,6,25,"可口可乐");
INSERT INTO xz_cart VALUES(null,1,7,25,"雪碧");
INSERT INTO xz_cart VALUES(null,1,8,25,"芬达");
INSERT INTO xz_cart VALUES(null,1,1,125,"数码相机");
INSERT INTO xz_cart VALUES(null,1,2,5555,"苹果电脑");
INSERT INTO xz_cart VALUES(null,1,3,3125,"华为手机");
INSERT INTO xz_cart VALUES(null,1,4,5125,"华硕笔记本");
INSERT INTO xz_cart VALUES(null,1,5,1025,"金牛皮鞋");
INSERT INTO xz_cart VALUES(null,1,6,25,"可口可乐");
INSERT INTO xz_cart VALUES(null,1,7,25,"雪碧");
INSERT INTO xz_cart VALUES(null,1,8,25,"芬达");
INSERT INTO xz_cart VALUES(null,1,1,125,"数码相机");
INSERT INTO xz_cart VALUES(null,1,2,5555,"苹果电脑");
INSERT INTO xz_cart VALUES(null,1,3,3125,"华为手机");
INSERT INTO xz_cart VALUES(null,1,4,5125,"华硕笔记本");
INSERT INTO xz_cart VALUES(null,1,5,1025,"金牛皮鞋");
INSERT INTO xz_cart VALUES(null,1,6,25,"可口可乐");
INSERT INTO xz_cart VALUES(null,1,7,25,"雪碧");
INSERT INTO xz_cart VALUES(null,1,8,25,"芬达");
INSERT INTO xz_cart VALUES(null,1,1,125,"数码相机");
INSERT INTO xz_cart VALUES(null,1,2,5555,"苹果电脑");
INSERT INTO xz_cart VALUES(null,1,3,3125,"华为手机");
INSERT INTO xz_cart VALUES(null,1,4,5125,"华硕笔记本");
INSERT INTO xz_cart VALUES(null,1,5,1025,"金牛皮鞋");
INSERT INTO xz_cart VALUES(null,1,6,25,"可口可乐");
INSERT INTO xz_cart VALUES(null,1,7,25,"雪碧");
INSERT INTO xz_cart VALUES(null,1,8,25,"芬达");
INSERT INTO xz_cart VALUES(null,1,1,125,"数码相机");
INSERT INTO xz_cart VALUES(null,1,2,5555,"苹果电脑");
INSERT INTO xz_cart VALUES(null,1,3,3125,"华为手机");
INSERT INTO xz_cart VALUES(null,1,4,5125,"华硕笔记本");
INSERT INTO xz_cart VALUES(null,1,5,1025,"金牛皮鞋");
INSERT INTO xz_cart VALUES(null,1,6,25,"可口可乐");
INSERT INTO xz_cart VALUES(null,1,7,25,"雪碧");
INSERT INTO xz_cart VALUES(null,1,8,25,"芬达");

CREATE TABLE xz_shoplist(
   id INT PRIMARY KEY AUTO_INCREMENT,
   img_url VARCHAR(255),
   dname VARCHAR(255),
   addr  VARCHAR(255),
   ctime VARCHAR(25),
   point INT   # 分数
);
INSERT INTO xz_shoplist VALUES(null,"img/dnf/1.jpg","剑神","将剑气修炼到极致为队友提升25%爆伤","辅助",50);
INSERT INTO xz_shoplist VALUES(null,"img/dnf/2.jpg","帝血弑天","只有“血焚”成功的狂战士才能够随意操控那磅礴的血气之力化身血魔，从而进阶到狱血魔神的更高层次。","战士",95);
INSERT INTO xz_shoplist VALUES(null,"img/dnf/3.jpg","黑暗君主","巧妙的利用鬼神会对战斗有利。神官吉格将刀魂之卡赞、残影之凯贾、冰霜之萨亚、侵蚀之普戾蒙等鬼神的使用方法传播给了鬼泣","神",100);
INSERT INTO xz_shoplist VALUES(null,"img/dnf/4.jpg","天帝","不锈钢2元一个3元两个多买多送","控制",80);

INSERT INTO xz_shoplist VALUES(null,"img/dnf/5.jpg","剑皇","以心御剑，以剑修心。以剑为术，以宗为志。","战士",90);
INSERT INTO xz_shoplist VALUES(null,"img/dnf/6.jpg","弑神者","臣服在我的脚香吧","战士",85);

INSERT INTO xz_shoplist VALUES(null,"img/dnf/7.jpg","裁决女神","在漫长的岁月里躲在黑暗中的我们，面前终于出现了死亡使者。","控制",80);
INSERT INTO xz_shoplist VALUES(null,"img/dnf/8.jpg","剑帝","此剑承载的重量，何人知晓。
围观者只知感叹它光芒的瑰丽","战士",85);
INSERT INTO xz_shoplist VALUES(null,"img/dnf/9.jpg","古灵精怪","帝炉弑天、锅炉工","控制",70);
INSERT INTO xz_shoplist VALUES(null,"img/dnf/10.jpg","元素圣灵","将自然力量极限化的纯魔法师","法师",80);
INSERT INTO xz_shoplist VALUES(null,"img/dnf/11.jpg","伊斯塔战灵","骗吃骗喝靠卖萌划水","下水道",60);
INSERT INTO xz_shoplist VALUES(null,"img/dnf/12.jpg","月蚀","被“蚀”所影响的召唤师们时刻都处在一种痛苦的疯狂之中，她们甚至后悔当时没有被“蚀”所吞噬","法师",90);
INSERT INTO xz_shoplist VALUES(null,"img/dnf/13.jpg","魔界人","emmmmmmmmmmm","全能",100);