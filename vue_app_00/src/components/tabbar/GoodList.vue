<template>
  <div class="app-goodlist">
  <header class="mui-bar mui-bar-nav">
		    <router-link to="/Home" class="mui-action-back mui-icon mui-icon-back mui-pull-left"></router-link>
		    <h1 class="mui-title">商品列表</h1>
		</header>
      <!--商品详细信息信息开始-->
     <div class="goods-item" v-for="item of list">
        <img :src="'http://127.0.0.1:3000/'+item.pic" :data-iid="item.Iid" @click="redir" />
        <div class="info">
           <span class="now">{{item.title}}</span>
        </div>
        <div class="sell">
           <span>¥{{item.price}}</span>
        </div>
      </div>
         <!--商品详细信息信息结束-->
        <!--加载更多-->
        <mt-button size="large" type="primary" @click="loadMore">加载更多</mt-button>
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
  </div>
</template>

<script>
export default {
   data(){
     return {
       list:[],
       pno:0
     }
   },
   created() {
     this.loadMore();
   },
   methods:{
     //加载下一页数据
     loadMore(){
        this.pno++
      var url="http://127.0.0.1:3000/product?pno="+this.pno;
      this.axios.get(url).then(result=>{
      //  console.log(result.data.data)
        var rows= this.list.concat(result.data.data);
        this.list=rows;
      })
     },
     redir(e){
       var Iid=e.target.dataset.iid;
       this.$router.push("/GoodInfo?Iid="+Iid)
     }
   },
}
</script>
<style>
  /*外层父元素*/
  .app-goodlist{
    display:flex;
    flex-wrap:wrap;
    justify-content:space-between;
    padding:4px;

  }
  /*商品信息*/
  .app-goodlist .goods-item{
    width:49%;
    border:1px solid #ccc;
    margin:2px 0;
    padding:2px 0;
    display:flex;
    flex-direction:column;
    min-height:245px;
    justify-content: space-between ;
        background:#fff;
  }
/*商品图片*/
 .app-goodlist .goods-item img{
   width:100%;
 }
 .app-goodlist .goods-item .info .now{
   font-size:13px;
 }
.sell{
  color:red;
  text-align:center;
  margin-bottom:0px;
}

</style>