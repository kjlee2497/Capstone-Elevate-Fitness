<template>
<div class="bg-image"
     style="background-image: url('https://images.rawpixel.com/image_1000/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yMV9waG90b19vZl9maXRuZXNzX2d5bV9iYWNrZ3JvdW5kX2NvcHlfc3BhY2VfZThiOGMxMTAtYzRhOC00YjlmLTk2OGEtZWUzNDVlZGQwYzUwXzEuanBn.jpg');" >
  <div class="home"  > 
    <h1> Workout History </h1>
  
       <all-completed-workouts />


    
</div>

</div>
</template>

<script>
import AllCompletedWorkouts from '../components/AllCompletedWorkouts.vue';


export default {
  components: {
    AllCompletedWorkouts
  },
  data(){  
  return {};
  }
  
}
</script>

<style scoped>
h1{
  color: white;
}

</style>
