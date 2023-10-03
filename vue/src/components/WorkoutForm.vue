<template>
    <div>
        <form v-on:submit.prevent="submitForm" class="cardForm">
        <label for="name">Workout Name</label>
        <input type="text" id="name" name="name">

        <label for="description">Description</label>
        <input type="description" id="description" name="description">
        <button v-on:click="createWorkout(newWorkout)">Next</button>
        </form>
    </div>    
</template>

<script>
import WorkoutService from '../services/WorkoutService'

export default {
    data() {
        return {
            workoutId: "",
            newWorkout: {
                name: "",
                description: "",
                status: "Pending"
            }
        }
    },
    methods: {
        createWorkout(newWorkout) {
            const newWorkout = {
                
            }
            WorkoutService.createWorkout(newWorkout)
                .then(res => {
                    this.workoutId = res.data.workout_id;                   
                })
                .catch(err => {
                    console.log(err)
                })
        }
    }
}
</script>

<style>

</style>