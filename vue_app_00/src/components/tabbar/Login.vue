<template>
 <div class="app-login">
<header class="mui-bar mui-bar-nav">
		    <router-link to="/Home" class="mui-action-back mui-icon mui-icon-back mui-pull-left "></router-link>
		    <h1 class="mui-title">登录</h1>
</header>
 <!-- <mt-header title="360账号登录" fixed></mt-header> -->
    <form>
    <input type="text" name="uname" placeholder="手机号/用户名/邮箱" v-model="uname"> <br>
    <input type="password" name="upwd" placeholder="密码/动态密码" v-model="upwd"> <br>
    <input class="login" type="button" value="登录" @click="btnLogin">
    </form>
    <div class="fte">
      <p>短信验证</p>
      <p>忘记密码</p>
    </div>
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
import {Toast} from "mint-ui"
export default {
  data(){
    return { 
      uname:"",
      upwd:"",
    }
  },
  methods: {
    btnLogin(){
       var u=this.uname;
       var p=this.upwd;
       var reg=/^[a-z0-9_]{3,8}$/
       if(!reg.test(u)){
         Toast("用户名不正确")
         return;
       }
       if(!reg.test(p)){
         Toast("密码不正确")
         return;
       }
       var url="http://127.0.0.1:3000/Login?uname="+u+"&upwd="+p
       this.axios.get(url).then(result=>{
            if(result.data.code==1){
              Toast("登陆成功")
                 this.$router.push("/success")
            }else{
              Toast("用户名或密码有误")
            }
       })
    }
  },
}
</script>
<style>
form{
  margin-top:20px;
}
.fte{
margin-top:20px;
width:100%;
display:flex;
justify-content: space-between;
}
.fte p{
color:#4b93ff;
}
.app-login .login{
  background:#26a2ff;
  color:#fff;
  width:100%;
  height:40px;
}
.app-login  input{
  margin:20px 0;
}
</style> 