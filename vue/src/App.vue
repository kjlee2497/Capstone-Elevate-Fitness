<template>

  
  <div id="app">
   
    <button class="toggle-button futuristic" @click="toggleSidebar">
      <i class="fas fa-bars"></i> 
    </button>
  
    
    <div class="sidebar futuristic" :class="{ 'show': isSidebarVisible }">
      <br>
      <br>
      <br>
      <router-link v-if="$store.state.token !== ''" :to="{ name: 'home' }" @click="toggleSidebar">Home</router-link>
      <router-link v-if="$store.state.token !== ''" :to="{ name: 'all-exercises' }" @click="toggleSidebar">Exercises</router-link>
      <router-link v-if="$store.state.token !== ''" :to="{ name: 'all-workouts' }" @click="toggleSidebar">Workouts</router-link>
      <router-link v-if="$store.state.token !== ''" :to="{ name: 'Completed' }" @click="toggleSidebar">History</router-link>
      <router-link v-if="$store.state.token !== ''" :to="{ name: 'logout' }" @click="toggleSidebar">Logout</router-link>
      
    </div>

    
    <div class="content">
      <router-view />
    </div>
  </div>
</template>

<script>
import AuthService from './services/AuthService';

export default {
  
  data() {
    return {
      isSidebarVisible: false ,
      user: {
        userId: '',
        name: '',
        role: ''
      }
    };
  },
  methods: {
    toggleSidebar() {
     
      this.isSidebarVisible = !this.isSidebarVisible;
    },
      goToLandingPage() {
    this.$router.push({ name: '/'});
    this.isSidebarVisible = !this.isSidebarVisible;
  }
},
created() {
  AuthService.getLoggedInUserInfo()
    .then(res => {
      console.log("getting user data");
      this.user = res.data;
      console.log(this.user.role); 
    })
}

};
</script>

<style>

/* #app{
  
  background-color: rgb(105, 91, 91); 
 
  margin: 0px;
  padding-bottom: 30px;
  height: 100%;
 
  
} */

/* .content {
  height: 100vmax; 
  width: 100vmax; 
  
} */

/* #app{
 background-image: radial-gradient(green,red,purple);
 background-size: cover;
} */
/* 
#app {
  background-color: black;
  height:100vh;
  width: 100vw;
} */

.sidebar {
  position: fixed;
  top: 0;
  left: -250px; 
  width: 150px;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.418);
    backdrop-filter: blur(30px);

  color: #fff;
  overflow-x: hidden;
  transition: left 0.3s ease; 
  box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
  z-index: 1000; 
}

.sidebar.show {
  left: 0; 
}
 
  @keyframes pulse {
    from {
      transform: scale(1);
    }
    to {
      transform: scale(1.02);
    }
  }

.sidebar a {
  padding: 20px;
  text-decoration: none;
  color: #fff;
  display: block;
  transition: color 0.3s ease; 
  
  
}

.sidebar a:hover {
    background-image: linear-gradient(180deg, #8f05ff7c,#b409f88c);
    animation: pulse 0.5s ease infinite alternate;
}

/* .content {
  margin-left: 0;
  transition: margin-left 0.3s ease; 
} */


.toggle-button {
  position: fixed;
  top: 10px;
  left: 10px;
  z-index: 1001; 
  background-color: transparent;
  color: rgb(150, 111, 255);
  border: none;
  cursor: pointer;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  font-size: 1.5rem;
  transition: background-color 0.3s ease, transform 0.3s ease; 
}

.toggle-button.futuristic:hover {
  background-image: linear-gradient(180deg, rgba(82, 93, 243, 0.514), rgb(35, 96, 189,0.514),rgb(245, 0, 245,0.514)); /* Change background color on hover */
  transform: rotate(180deg); 
}


@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css');
</style>