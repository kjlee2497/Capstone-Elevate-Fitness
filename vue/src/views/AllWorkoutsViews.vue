<template>
  <div class="bg-image"
     style="background-image: url('https://images.rawpixel.com/image_1000/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yMV9waG90b19vZl9tb2Rlcm5fZ3ltX3Jvb21fZml0bmVzc19jZW50ZXJfd2l0aF84MWUwNjEzMC1lOGQwLTQ4MDktOTEwZC04NzQzZDQxY2M5ZWJfMS5qcGc.jpg');" >
  <div class="listWorkout">

      <all-workouts/>
      <div class="btn-container">
        <button class="btn" v-on:click="goToGenerateWorkout">Create a Workout</button>
      </div>
  </div>

         </div>

</template>

<script>
import AllWorkouts from '../components/AllWorkouts.vue'

export default {
  name: "workouts",
  components: {
    AllWorkouts
  },
  methods: {
    goToGenerateWorkout() {
      this.$router.push('/workouts/add')
    }
  }
}
</script>

<style>

.bg-image {
 
  background-size: cover;
  background-position: center;
  height: 100vh;
  width: 100vw;
  margin:0
}

.btn-container {
  margin-top: none;
}

.btn {
    margin: 10px 50px;
     background-color: #0b080cc0;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
    
}

.btn:hover {
     background-color: #8F05FF;
    transform: scale(1.05);
}


</style>