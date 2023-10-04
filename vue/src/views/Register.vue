<template>
  <div id="register" class="text-center">
    <div class="bg-image"
     style="background-image: url('https://img.peerspace.com/image/upload/w_1200,c_limit/c_crop,g_custom,f_auto,q_auto,dpr_auto/l_PS-logo,g_south_east,x_20,y_20,w_175,o_75/seztuwttyztfuuz6ebmv');
            height: 100vh ; width:100vw ">
  </div>
    <!-- <background>
       <img src="dumbbells-background.jpg" alt="background">
     </background> -->
    <form @submit.prevent="register">
     <img class="logo" src="logo.png" alt="logo">
      <h1>Create Account</h1>
      <div role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="form-input-group">
        <label for="username">Username</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <div class="form-input-group">
        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" v-model="user.confirmPassword" required />
      </div>
      <button type="submit">Create Account</button>
      <p><router-link :to="{ name: 'login' }" >Already Have An Account? Log In.</router-link></p>
    </form>
  </div>
</template>
<script>
import authService from '../services/AuthService';
export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>
<style scoped>
.bg-image{
  background-size:cover;
}
img{
  align-items: center;
  max-width: 100vw;
  max-height: 100vh;
}
img.logo{
  align-items: center;
   margin-left: 15px;
}
#register {
  width: 100vw;
  height: 100vh;
  position: absolute;
  transform: translate(-50%,-50%);
  left: 50%;
  top: 50%;
 
}
p{
  text-align: center;
}
form {
  height: auto;
  width: 400px;
  background-color: rgba(255,255, 255, 0.13);
  position: absolute;
  transform: translate(-50%,-50%);
  top: 50%;
  left:50%;
  border-radius: 20px;
  backdrop-filter: blur(30px);
  border:2px solid rgba(255,255, 255, 0.1);
  box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
  padding: 10px 15px;
}
form *{
  font-family: 'Poppins',sans-serif;
  color:#ffffff;
  letter-spacing: 00.5px;
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
      background-color: #FFFFFF;
      color: #080710;
      padding: 15px 0;
      font-size: 18px;
      font-weight: 600;
      border-radius: 5px;
      cursor: pointer;
      text-shadow:none;
  }
</style>
