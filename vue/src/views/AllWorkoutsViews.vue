<template>
  <div class="bg-image"
     style="background-image: url('https://img.peerspace.com/image/upload/w_1200,c_limit/c_crop,g_custom,f_auto,q_auto,dpr_auto/l_PS-logo,g_south_east,x_20,y_20,w_175,o_75/seztuwttyztfuuz6ebmv');" >
  <div class="listWorkout">
      <h1>List workouts!!!</h1>
      <all-workouts/>
  </div>
         </div>

</template>

<script>
import AllWorkouts from '../components/AllWorkouts.vue'

export default {
  name: "workouts",
  components: {
    AllWorkouts
  }
}
</script>

<style>
h1{
  color:white;
  text-align: center;
}
.bg-image {
 
  background-size: cover;
  background-position: center;
  height: 100vh;
  width: 100vw;
  margin:0
}


</style>