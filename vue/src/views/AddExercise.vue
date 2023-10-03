<template>
<div class="bg-image"
     style="background-image: url('https://images.unsplash.com/photo-1674834727206-4bc272bfd8da?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80');" >
  <div class="addExercise">
    <br>
    <br>
      <h1>Add an Exercise</h1>
      <exercise-form />
  </div>
  </div>
</template>

<script>
import ExerciseForm from '../components/ExerciseForm.vue'

export default {
    components: {
      ExerciseForm
    }
}
</script>

<style>
h1{
  color:white;
  text-align: center;
  
  margin: 0px 0px;
  font-family: 'Poppins',sans-serif;
  text-shadow: 2px 2px 2px black;

}

.bg-image {
 
  background-size: cover;
  background-position: center;
  height: 100vh;
  width: 100vw;
  margin:0
  
}
</style>