<template>
 <div>
 <header class="mui-bar mui-bar-nav">
		    <router-link to="/Home" class="mui-action-back mui-icon mui-icon-back mui-pull-left "></router-link>
		    <h1 class="mui-title">设置</h1>
</header>
    <div class="my_f1">
       <img src="http://127.0.0.1:3000/img/1.png" alt="">
       <div class="my_f1_1">
         <b>东营捂眼族</b>
         <p>账号:99999</p>
       </div>
       <p class="my_f1_2">></p>
    </div>
    <div class="my_f2">
      <span>账号与安全</span>
      <span class="my_f2_1">></span>
    </div>
    <div class="my_f3">
    <span>新消息通知</span>
      <span class="my_f3_1">></span>
    </div>
     <div class="my_f3">
    <span>联系人，隐私</span>
      <span class="my_f3_1">></span>
    </div>
     <div class="my_f3">
    <span>通用</span>
      <span class="my_f3_1">></span>
    </div>
     <div class="my_f3">
    <span>辅助功能</span>
      <span class="my_f3_1">></span>
    </div>
     <div class="my_f3">
    <span>免流量特权</span>
      <span class="my_f3_1">></span>
    </div>
     <div class="my_f3">
    <span>关于我们</span>
      <span class="my_f3_1">></span>
    </div>
     <input class="logins" type="button" value="退出登录" @click="btnLogin">
 </div>
</template>
<script>
export default {
    data(){
      return{}
    },
    methods: {
     btnLogin(){
       this.$router.push("/Login")
     } 
    },
    
}
</script>
<style>
.logins{
  width:100%;
  margin-top:30px;
  height:40px;
  color:#fff;
  font-size:19px;
}
.my_f3>span{
  margin-left:10px;
}
.my_f3{
  margin:0;
  padding:0;
  width:100%;
  height:43px;
  background:#fff;
  border:1px solid #ddd;
  line-height:43px;
}
.my_f3_1{
   float:right;
  margin-right:20px;
}
.my_f2_1{
  float:right;
  margin-right:20px;
}
.my_f2{
  width:100%;
  height:43px;
  background:#fff;
  border:1px solid #ddd;
  margin:20px 0;
  line-height:43px;

}
.my_f2>span{
font-size:16px;
color:#000;
margin-left:10px;
}

 .my_f1{
   height:64px;
   width:100%;
   border:1px solid  #ddd;
   margin-top:20px;
   display:flex;
   background:#fff;
 }
 .my_f1>img{
   width:48px;
   height:42px;
   margin-top:10px;
   margin-left:10px;
 }
 .my_f1> .my_f1_1{
   width:245px;
   height:42px;
   margin-top:10px;
   margin-left:20px;
 }
 .my_f1_2{
   margin-left:20px;
   line-height:64px;
   font-size:16px;
   color:#000;
 }

</style>