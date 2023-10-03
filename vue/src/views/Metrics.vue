<template>

 

 
  <div id="metrics" class="text-center">
      
  <div class="bg-image"
     style="background-image: url('https://img.freepik.com/free-photo/dumbbells-floor-gym-ai-generative_123827-23745.jpg?w=1380&t=st=1695696952~exp=1695697552~hmac=af1847e11029522a3e0021f8649fd3ec26425e66cd642d317b483b378a40b0a1');
            height: 100vh ; width:100vw " ></div>
	
    
    <form @submit.prevent="metrics">
      
     <img class="logo" src="logo.png" alt="logo">
      <h1>User Info</h1>
      
      <div role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      
      <div class="form-input-group">
        <label for="userHeight">Height</label>
        <input type="number" id="height" placeholder="Height in Inches" v-model="user.height" required autofocus />
      </div>

      <div class="form-input-group">
        <label for="userWeight">Weight</label>
        <input type="number" id="weight" placeholder="Weight in Lbs" v-model="user.weight" required />
      </div>
      <div class="form-input-group">
        <label for="userAge">Age</label>
        <input type="number" id="Age" v-model="user.age" required />
      </div>
       <router-link :to="{ name: 'home'}"><button type="submit">Create Account</button></router-link>
      
   
    </form>

     
    
  </div>
  
</template>

<script>
// import authService from '../services/AuthService';

export default {
  name: 'metrics',
  data() {
    return {
      user: {
        height: '',
        weight: '',
        age: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  // methods: {
  //   register() {
  //     if (this.user.password != this.user.confirmPassword) {
  //       this.registrationErrors = true;
  //       this.registrationErrorMsg = 'Password & Confirm Password do not match.';
  //     } else {
  //       authService
  //         .register(this.user)
  //         .then((response) => {
  //           if (response.status == 201) {
  //             this.$router.push({
  //               path: '/login',
  //               query: { registration: 'success' },
  //             });
  //           }
  //         })
  //         .catch((error) => {
  //           const response = error.response;
  //           this.registrationErrors = true;
  //           if (response.status === 400) {
  //             this.registrationErrorMsg = 'Bad Request: Validation Errors';
  //           }
  //         });
  //     }
  //   },
  //   clearErrors() {
  //     this.registrationErrors = false;
  //     this.registrationErrorMsg = 'There were problems registering this user.';
  //   },
  // },
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
  background-color:  #958fbe;
}

form {
  height: 520px;
  width: 400px;
  background-color: rgba(255,255, 255, 0.13);
  position: absolute;
  transform: translate(-50%,-50%);
  top: 50%;
  left:50%;
  border-radius: 10px;
  backdrop-filter: blur(10px);
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
      background-color: #ffffff;
      color: #080710;
      padding: 15px 0;
      font-size: 18px;
      font-weight: 600;
      border-radius: 5px;
      cursor: pointer;
      text-shadow:none;
  } 
 



</style>
