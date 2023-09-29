<template>
  <div>
    <exercise-edit-form v-bind:exerciseId="this.exerciseId" />
  </div>
</template>

<script>
import ExerciseEditForm from '../components/ExerciseEditForm.vue'

export default {
  components: {
    ExerciseEditForm
  }
}
</script>

<style>

</style>