<template>
  <div id="app">
    <!-- <div class="bg-image"
     style="background-image: url('https://images.rawpixel.com/image_1000/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsb2ZmaWNlN19waG90b2dyYXBoeV9vZl9tb2Rlcm5fZml0bmVzc19yb29tX21pbmltYWxfOGtfMjdjNmZkYjctNGQxMS00Yjc1LWJkODQtZThjZTBiMTY4NmY3XzEuanBn.jpg');
            height: 100vh ; width:100vw " ></div> -->
    <!-- Toggle button to show/hide the sidebar -->
    <button class="toggle-button futuristic" @click="toggleSidebar">
      <i class="fas fa-bars"></i> 
    </button>

    <!-- Sidebar menu -->
    <div class="sidebar futuristic" :class="{ 'show': isSidebarVisible }">
      <br>
      <br>
      <br>
      <router-link v-if="$store.state.token !== ''" :to="{ name: 'home' }" @click="toggleSidebar">Home</router-link>

      
      <router-link v-if="$store.state.token !== ''" :to="{ name: 'all-exercises' }" @click="toggleSidebar">Exercises</router-link>
      <router-link v-if="$store.state.token !== ''" :to="{ name: 'workouts' }" @click="toggleSidebar">Workouts</router-link>
      <router-link v-if="$store.state.token !== ''" :to="{ name: 'history' }" @click="toggleSidebar">History</router-link>
      <router-link v-if="$store.state.token !== ''" :to="{ name: 'logout' }" @click="toggleSidebar">Logout</router-link>
      <!-- Add more menu items as needed -->
    </div>

    <!-- Main content -->
    <div class="content">
      <router-view />
    </div>
  </div>
</template>

<script>
export default {
  
  data() {
    return {
      isSidebarVisible: false // Initially, the sidebar is hidden
    };
  },
  methods: {
    toggleSidebar() {
      // Toggle the visibility of the sidebar
      this.isSidebarVisible = !this.isSidebarVisible;
    }
  }
};
</script>

<style>
.bg-image{
 background-size: cover;
 
}

/* CSS for the animated sidebar menu */
.sidebar {
  position: fixed;
  top: 0;
  left: -250px; /* Initially hidden */
  width: 250px;
  height: 100%;
background-image: linear-gradient(147deg, #4d4855 0%, #000000 74%);
; /* Dark background color */
  color: #fff;
  overflow-x: hidden;
  transition: left 0.3s ease; /* Add smooth transition for sliding effect */
  box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2); /* Futuristic box shadow */
  z-index: 1000; /* Higher z-index for overlay effect */
}

.sidebar.show {
  left: 0; /* Show the sidebar by moving it to the left */
}
 /* Define the pulse animation */
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
  transition: color 0.3s ease; /* Smooth color transition */
  
}

.sidebar a:hover {
    background-image: linear-gradient(180deg, #8f05ff,#b409f88c);/* Change color on hover */
    animation: pulse 0.5s ease infinite alternate;
}

.content {
  margin-left: 0;
  transition: margin-left 0.3s ease; /* Add smooth transition for main content */
}

/* Button to toggle the sidebar */
.toggle-button {
  position: fixed;
  top: 10px;
  left: 10px;
  z-index: 1001; /* Higher z-index to appear above the sidebar */
  background-color: transparent;
  color: rgb(14, 14, 14);
  border: none;
  cursor: pointer;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  font-size: 1.5rem;
  transition: background-color 0.3s ease, transform 0.3s ease; /* Smooth transitions */
}

.toggle-button.futuristic:hover {
  background-image: linear-gradient(180deg, rgb(82, 93, 243), rgb(35, 96, 189),rgb(245, 0, 245)); /* Change background color on hover */
  transform: rotate(180deg); /* Rotate the button on hover */
}

/* Font Awesome Icons */
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css');
</style>