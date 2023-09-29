<template>
  <div class="listWorkout">
      <h1>List workouts!!!</h1>
      <all-workouts/>
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

</style>