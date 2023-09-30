<template>
<div class="bg-image"
     style="background-image: url('https://images.rawpixel.com/image_1000/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yMV9waG90b19vZl9tb2Rlcm5fZ3ltX3Jvb21fZml0bmVzc19jZW50ZXJfd2l0aF84MWUwNjEzMC1lOGQwLTQ4MDktOTEwZC04NzQzZDQxY2M5ZWJfMS5qcGc.jpg');" >
  

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

<style scopded>
.listWorkout {
  
  margin:0px;
  height: 100vh;
}

</style>