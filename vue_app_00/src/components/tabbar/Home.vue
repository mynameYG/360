<template>
  <div class="app-home">
  	<header class="mui-bar mui-bar-nav" >
		    <a class="mui-action-back mui-icon mui-icon-back mui-pull-left"></a>
		    <h1 class="mui-title">360商城</h1>
		</header>
    <!--轮播-->
    <mt-swipe >
      <mt-swipe-item v-for="item of navlist">
        <img :src="item.img_url">
      </mt-swipe-item>
    </mt-swipe>
<!--文本框滚动-->
       <div class="marquee">
              <div class="marquee_title">
                 <span>商城快报</span>
              </div>
              <div class="marquee_box">
                <ul class="marquee_list" :class="{marquee_top:animate}">
                        <li v-for="(item,index) in marqueeList">{{item.name}}</li>
                </ul>
               </div>
        </div>
 <!--九宫格-->
       <!--
          <ul class="mui-table-view mui-grid-view mui-grid-9">
		         <li class="mui-table-view-cell mui-media mui-col-xs-4  
              mui-col-sm-3" v-for="item of gridlist"><router-link to="/NewsList" href="#">
		             <img :src="item.img_url">
		             <p>{{item.title}}</p>
                 </router-link>
              </li>
          </ul>
         -->
          <ul class="mui-table-view mui-grid-view mui-grid-9">
		         <li class="mui-table-view-cell mui-media mui-col-xs-4  
              mui-col-sm-3"><router-link to="/GoodList">
		             <img src="http://127.0.0.1:3000/img/grid/grid6.webp">
		             <p>最新商品</p>
                 </router-link>
              </li>
               <li class="mui-table-view-cell mui-media mui-col-xs-4  
              mui-col-sm-3"><router-link to="/NewsList">
		             <img src="http://127.0.0.1:3000/img/grid/grid7.webp">
		             <p>商品列表</p>
                 </router-link>
              </li>
               <li class="mui-table-view-cell mui-media mui-col-xs-4  
              mui-col-sm-3"><router-link to="/NewsList">
		             <img src="http://127.0.0.1:3000/img/grid/grid8.webp">
		             <p>商品评价</p>
                 </router-link>
              </li>
               <li class="mui-table-view-cell mui-media mui-col-xs-4  
              mui-col-sm-3"><router-link to="/success">
		             <img src="http://127.0.0.1:3000/img/grid/grid9.webp" >
		             <p>每日签到</p>
                 </router-link>
              </li>
               <li class="mui-table-view-cell mui-media mui-col-xs-4  
              mui-col-sm-3"><router-link to="/success">
		             <img src="http://127.0.0.1:3000/img/grid/grid10.webp">
		             <p>个人中心</p>
                 </router-link>
              </li>
          </ul>



  <!--tabbar   mui-->
            <nav class="mui-bar mui-bar-tab">
            <router-link to="/Home" class="mui-tab-item mui-active" href="#tabbar">
            <span class="mui-icon mui-icon-home"></span>
           <span class="mui-tab-label">首页</span>
            </router-link>
            <router-link to="/NewsList" class="mui-tab-item" href="#tabbar-with-chat">
            <span class="mui-icon mui-icon-extra mui-icon-extra-class"></span>
            <span class="mui-tab-label">消息</span>
            </router-link>
            <router-link to="/GoodList" class="mui-tab-item" href="#tabbar-with-contact">
              <img src="../../img/360.png">
            </router-link>
            <router-link to="shopCart" class="mui-tab-item" href="#tabbar-with-map">
            <span class="mui-icon mui-icon-extra mui-icon-extra-cart">
             <span class="mui-badge">{{$store.getters.optCartCount}}</span>
            </span>
            <span class="mui-tab-label">购物车</span>
            </router-link>
             <router-link to="/Login" class="mui-tab-item" href="#tabbar-with-map">
            <span class="mui-icon mui-icon-person"></span>
            <span class="mui-tab-label">我的</span>
            </router-link>
            </nav>   

            <div class="h4e">
             <h4>限时抢购</h4>
            </div>
          <div class="item-box">
             <div v-for="item of boxlist">
              <img :src="item.img_url" alt="">
                <p>{{item.title}}</p>
                <s>¥{{item.no_pice}}</s>
                <p>¥{{item.pice}}</p>
              </div>
           </div>

            <video class="mp4" src="http://127.0.0.1:3000/img/mp4/mm.mp4" controls></video>

           <div class="pages" v-for="item of pageslist">
             <div><img :src="item.img1" alt=""></div>
             <div class="mate">
              <div><img :src="item.img2" alt=""></div>
              <div><img :src="item.img3" alt=""></div>
             </div>
           </div>
          <img class="aa" src="http://127.0.0.1:3000/img/mp4/ee.webp" />
          <img class="bb" src="http://127.0.0.1:3000/img/box/7a.png" />
           <div class="cc">
            <p>客服热线:400-1555-360周一到周日9:00-21:00</p>
            <p>360会员商城©2019 版权所有</p>
           </div>
          
        
  </div>
    
</template>

<script>
export default {
   data(){
     return {
       pageslist:[],
       boxlist:[],
       navlist:[],
       gridlist:[],
        animate: false,
      marqueeList: [
        {  name: "【推荐】自带电子狗的行车记录仪G300"},
        {  name: "【新品】360高清智能摄像头户外版新品预售中"} ]
     }
   },
   created() {
     this.handpase();
     this.handbox();
     this.handleImage();
     this.handleGrid();
      setInterval(this.showMarquee, 3000);
   },
   methods: {
      handpase(){
      var  url="http://127.0.0.1:3000/pages"
      this.axios.get(url).then(result=>{
         this.pageslist=result.data
      })
      },
      handbox(){
        var url="http://127.0.0.1:3000/box"
        this.axios.get(url).then(result=>{
           this.boxlist=result.data
        })
      },
      //九宫格
      handleGrid(){
        var url="http://127.0.0.1:3000/grid"
        this.axios.get(url).then(result=>{
            this.gridlist=result.data
        })
      },    
     //轮播
     handleImage(){
    var url="http://127.0.0.1:3000/imglist"
      this.axios.get(url).then(result=>{
       this.navlist=result.data.data
      })
     },
   //文本上下滚动
     showMarquee: function() {
      this.animate = true;

      setTimeout(() => {
        this.marqueeList.push(this.marqueeList[0]);

        this.marqueeList.shift();

        this.animate = false;
      }, 300);
    }
   },
}
</script>
<style>
.cc{
  background:#fff;
}
.cc>p{
  color:#999;
  text-align:center;
}
.bb{
  width:100%;
}
.app-home .tema{
  display:flex;

}
.app-home .aa{
  width:100%;
  height:180px;
  margin:10px 0;
}
.app-home .pages .mate{
  display:flex;
  flex-direction:column;
}
.app-home .pages .mate img{
  width:100%;
  height:100%;
}
.app-home .pages .mate>div{
  box-sizing:border-box;
  width:100%;
  height:50%;
  border:1px solid #ddd;
}
.app-home .pages{
  display:flex;
justify-content:space-around;
}
.app-home .pages>div{
  height:275px;
  width:49%;
}
.app-home .pages>div>img{
  width:100%;
  height:100%;
}
 .app-home .mp4{
   width:100%;
   height:211px;
 }
.h4e{
  width:100%;
  height:50px;
  background:#fff;
}
.h4e>h4{
  line-height:50px;
}
.app-home .item-box div>img{
  width:100%;
  height:95.5px;
}
.app-home .item-box{
  width:100%;
  height:171px;
  display:flex;
  box-sizing:border-box;
  background:#fff;
}
.app-home .item-box>div{
  width:33.333333%;
  height:152.5px;
  border:1px solid #ddd;
}
.app-home .item-box>div>p{
text-align:center;
 color:red;
 font-size:10px;
 margin:-4px 0;
}
.app-home .item-box>div>s{
  margin-left:40%;
  font-size:10px;

}

/*九宫格样式*/
.app-home .mui-grid-9 img{
  width:50px;
  height:50px;
  margin-top:-10px;
  margin-left:-10px;
}
.app-home .mui-grid-9 li{
  width:70px;
  height:85.25px;
  border:none;
}
.app-home .mui-grid-9 a{
  width:70px;
  height:72.75px;
}
.app-home .mui-grid-9 p{
  width:70px;
  height:16.5px;
    font-size:10px;
  margin-left:-4px;
}
 .app-home .mui-grid-view.mui-grid-9{
    background-color:#fff
  }
.app-home .mui-grid-view.mui-grid-9 .mui-table-view-cell {
  border:none;
}
/*轮播样式*/
 .app-home .mint-swipe{
   height:240px
 }
 .app-home .mint-swipe img{
   width:100%;
 }
 /*文本栏样式*/
 .marquee {
  width: 100%;
  height: 40px;
  align-items: center;
  color: #3a3a3a;
  background-color: white;
  display: flex;
  box-sizing: border-box;
  overflow: hidden;
}

.marquee_title {
  padding: 0 20px;
  height: 21px;
  font-size: 14px;
  border-right: 1px solid #d8d8d8;
  align-items: center;
}
.marquee_box {
  display: block;
  position: relative;
  width: 60%;
  height: 60px;
  overflow: hidden;
}
.marquee_list {
  display: block;
  list-style:none;
  position: absolute;
  top: 0;
  left: 0;
}
.marquee_top {
  transition: all 0.5s;
  margin-top: -30px;
}
.marquee_list li {
  height: 30px;
  line-height: 30px;
  font-size: 14px;
  padding-left: 20px;
}
.marquee_list li span {
  padding: 0 2px;
}

</style>