<template>
  <div class="allWorkouts">
    <h1>Workout List</h1>
      <table class="workoutList-table">
        <th> Workout name</th>
        <th>Description</th>
        <th>Status</th>
          <tr v-for="workout in workouts" v-bind:key="workout.id">
            <td>{{ workout.name }}</td>
            <td>{{ workout.description }}</td>
            <td>{{ workout.status }}</td>
        </tr>
      </table>
      <div id="buttons">
      <button>Delete Workout</button>
      <button>Update Workout</button>
</div>
  </div>
</template>
<script>
 import service from '../services/WorkoutService'
export default {
  name: "all-workouts",
  data() {
    return { workouts: [] };
  },
  created() {
    service.listWorkouts().then((response) => {
      this.workouts = response.data ?? []
    });
  }
}
</script>