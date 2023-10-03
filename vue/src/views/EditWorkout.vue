<template>
<div>
 <h1>Edit Workout</h1>
    <workout-edit-form v-bind:workoutId="this.workoutId" />
</div>
</template>

<script>
import WorkoutEditForm from '../components/WorkoutEditForm.vue'

export default {
    components: {
        WorkoutEditForm
    }
}
</script>

<style>

</style>