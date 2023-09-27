<template>
  <div class="exerciseList">
      <h1>Exercise List</h1>
      <table >
        <tr v-for="exercise in exercises" v-bind:key="exercise.id">
          <td>{{ exercise.id }}</td>
          <td>{{ exercise.name }}</td>
          <td>{{ exercise.description }}</td>
          <td>{{ exercise.weight }}</td>
          <td>{{ exercise.repCount }}</td>
          <td>{{ exercise.expectedTime }}</td>
          <td>{{ exercise.target }}</td>

        </tr>
      </table>
  </div>



</template>

<script>
 import service from '../services/ExerciseService'
  
export default {
  name: "all-exercises",
  data(){
    return{
      exercises:[]
    }
  },

  created() {
    service.getAllExercises().then((response) => {
      this.exercises = response.data
    });
  }
}
</script>

<style>

</style>