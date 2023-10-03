<template>

<div id="landing">
  <div class="wrapper">
    

    <section class="top-container">
      <header class="showcase">
        <h1>Welcome</h1>
        <a href="#" class="btn">Edit Profile</a>
      </header>
      <div class="top-box top-box-a">
        
        <p class="neon">Schedule</p>
        <a href="#" class="btn" @click ="goToLogin">View Calendar</a>
      </div>
      <div class="top-box top-box-b">
        <div class="container">
        </div>    
        <p class="neon">Trainer Functions</p>
        <nav class="main-nav">
      <ul>
        <li>
          <a href="#" class="btn" @click ="goToLogin" >Add Exercise</a>
        </li>
        <li>
          <a href="#" class="btn">Edit Exercise</a>
        </li>
        <li>
          <a href="#" class="btn">Delete Exercise</a>
        </li>
        <li>
          <a href="#" class="btn" @click="goToRegister">Add Workout</a>
        </li>
        <li>
          <a href="#" class="btn">edit workout</a>
        </li>
        <li>
          <a href="#" class="btn">Delete workout</a>
        </li>
      </ul>
    </nav>    
      </div>
    </section>
    <footer>
      <p>ElevateFitness &copy; 2023</p>
    </footer>
  </div>
</div>

</template>

<script>

export default {
    
}
</script>

<style>

</style>