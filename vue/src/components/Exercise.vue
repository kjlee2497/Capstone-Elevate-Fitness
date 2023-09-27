<template>
  <div>

      {{ exercise }}
      
        <form v-on:submit.prevent="saveExercise">
        Name: <input type="text" v-model='exercise.name'/>
        <br>
        Description: <input type="text" v-model='exercise.description'/>
        <br>
        Suggested Weight in Lbs: <input type="number" v-model='exercise.weight'/>
        <br>
         Suggested Rep Count: <input type="number" v-model='exercise.repCount'/>
        <br>
         Expected Time in seconds: <input type="number" v-model='exercise.expectedTime'/>
        <br>
         Target: <input type="number" v-model='exercise.target'/>
        <br>
        <button type="submit"> Save </button> 
        </form> 

  </div>
 


</template>

<script>
import service from '../services/ExerciseService';

export default {
    data() {
        return {
            exercise: {}
        }
    },

    methods: {
        saveExercise(){
            service.addExercise(this.exercise).then((response) =>{
                if(response.status == 200){
                    window.alert('Exercise Added');
                    this.$router.push({name: 'add-Exercises'});
                }
            });
        }
    }
}
</script>

<style>

</style>