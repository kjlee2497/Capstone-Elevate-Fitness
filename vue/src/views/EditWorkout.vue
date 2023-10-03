<template>
    
<div>
    <br>
    <br>
     <h1>Edit Workout</h1>
    <workout-edit-form v-bind:workoutId="this.workoutId" />
  </div>
</template>

<script>
import WorkoutEditFrom from '../components/WorkoutEditForm.vue'

export default {
  components: {
    WorkoutEditFrom
      }
}
</script>