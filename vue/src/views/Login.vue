<template>



  <div id="login">
    
    <div class="bg-image"
     style="background-image: url('https://img.freepik.com/free-photo/dumbbells-floor-gym-ai-generative_123827-23745.jpg?w=1380&t=st=1695696952~exp=1695697552~hmac=af1847e11029522a3e0021f8649fd3ec26425e66cd642d317b483b378a40b0a1');
            height: 100vh ; width:100vw " repeat-x ></div>
    <form @submit.prevent="login">
       <img class="logo" src="logo.png" alt="logo">
      <h1 >Please Sign In</h1>
      <div role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Username</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <button type="submit">Sign in</button>
      <p>
      <router-link :to="{ name: 'register' }">Need an account? Sign up.</router-link></p>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>
 
.bg-image{
  background-size:cover;
  
}
img.logo{
  align-items: center;
  margin-left: 15px;
  
}
#login {
  
      width: 100vw;
      height: 100vh;
      position: absolute;
      transform: translate(-50%,-50%);
      left: 50%;
      top: 50%;
      
}

  form{
      height: 520px;
      width: 400px;
      background-color: rgba(255,255,255,0.13);
      position: absolute;
      transform: translate(-50%,-50%);
      top: 50%;
      left: 50%;
      border-radius: 10px;
      backdrop-filter: blur(10px);
      border: 2px solid rgba(255,255,255,0.1);
      box-shadow: 0 0 40px rgba(8,7,16,0.6);
      padding: 10px 15px;
      
  }
  form *{
      font-family: 'Poppins',sans-serif;
      color: #ffffff;
      letter-spacing: 0.5px;
      outline: none;
      border: none;
     text-shadow: 2px 2px 2px black; 
  }
  .form-input-group {
  
      width: 95%;
     text-shadow: none;
  }


  form h3{
      font-size: 32px;
      font-weight: 500;
      line-height: 42px;
      text-align: center;
  }
  
  label{
      display: block;
      margin-top: 30px;
      font-size: 16px;
      font-weight: 500;
  }
  input{
      display: block;
      height: 50px;
      width: 100%;
      background-color: rgba(255,255,255,0.07);
      border-radius: 3px;
      padding: 0 10px;
      margin-top: 8px;
      font-size: 14px;
      font-weight: 300;
  }
 
  button{
      margin-top: 50px;
      width: 100%;
      background-color: #ffffff;
      color: #080710;
      padding: 15px 0;
      font-size: 18px;
      font-weight: 600;
      border-radius: 5px;
      cursor: pointer;
      text-shadow: none;
  }  

</style>

