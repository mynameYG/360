<template>
  <div class="app-goodinfo">
  <header class="mui-bar mui-bar-nav">
		    <router-link to="/GoodList" class="mui-action-back mui-icon mui-icon-back mui-pull-left "></router-link>
		    <h1 class="mui-title">商品详情</h1>
  </header>
    <img :src="'http://127.0.0.1:3000/'+info.pic" class="my_img_w" />
   <div class="mui-card">
				<div class="mui-card-header">商品名称:{{info.title}}</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
				    <p>销售价格: <span class="good">¥{{info.price}}</span></p>
					</div>
				</div>
				<div class="mui-card-footer">
         <mt-button type="danger" size="small" @click="addcart">加入购物车</mt-button>
        </div>
			</div>
  </div>
</template>
<script>
export default {
  data(){
    return { 
    lid:this.$route.query.Iid,  
      info:{}   //显示商品对象
    }
  },
  created() {
    this.findProduct();
  },
  methods: {
    addcart(){
      //获取pid pname price
      var pid= this.lid 
      var pname=this.info.title
      var price=this.info.price
      var pic=this.info.pic
      var url="http://127.0.0.1:3000/addcart"
      url+="?pid="+pid
      url+="&price="+price
      url+="&pname="+pname 
      url+="&pic="+pic
      this.axios.get(url).then(result=>{
        //将商品加入购物车
        this.$store.commit("increment")
       // console.log(result)
      })
    },
    findProduct(){
    var url="http://127.0.0.1:3000/findProduct?Iid="+this.lid
    this.axios.get(url).then(result=>{
       // console.log(result)
        this.info=result.data.data[0]
       //  console.log(this.info)
    })
    
    }
  },
}
</script>
<style>
  .good{
    color:red;
    font-size:24px;
    margin-left:10px;
    
  }
  .my_img_w{
    width:100%;
  }
</style>