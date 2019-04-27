<template>
  <div class="app-newslist"> 
  <header class="mui-bar mui-bar-nav">
		    <router-link to="/Home" class="mui-action-back mui-icon mui-icon-back mui-pull-left"></router-link>
		    <h1 class="mui-title">新闻列表</h1>
		</header>
  <!--新闻列表-->
   <ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media" v-for="item of list">
				  <router-link :to="'/NewsInfo?nid='+item.id">
						<img class="mui-media-object mui-pull-left" :src="item.img_url">
						<div class="mui-media-body">
							{{item.title}}
						   	<p class='mui-ellipsis'>
              <span>{{item.ctime | datetimeFilter}}</span>
            <span>点击{{item.point}}次</span>
              </p>
						</div>
					</router-link>
				</li>
   </ul>
   <mt-button size="large" type="primary" @click=" loadMore">加载更多</mt-button>
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
     this.loadMore()
   },
   methods: {
     loadMore(){
       this.pno++;
      var url="http://127.0.0.1:3000/news?pno="+this.pno
      this.axios.get(url).then(result=>{
      var rows=this.list.concat(result.data.data)
        this.list=rows
      })
     }
   },
}
</script>
<style>
  .app-newslist .mui-ellipsis{
    display:flex;
    font-size:12px;
    color:#226aff;
    justify-content:space-between;
  }
</style>