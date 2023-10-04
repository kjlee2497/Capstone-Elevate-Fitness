<template>

<div id="landing">
  <div class="wrapper">
    

    <section class="top-container">
      <header class="showcase">
        <h1>Welcome</h1>
        <a href="#" class="btn">Edit Profile</a>
      </header>
      <div class="top-box top-box-a">
        
        <p class="neon">Schedule</p>
        <a href="#" class="btn" @click ="goToCalendar">View Calendar</a>
      </div>
      <div class="top-box top-box-b">
        <div class="container">
        </div>    
        <p class="neon">Trainer Functions</p>
        <nav class="main-nav">
      <ul>
        <li>
          <a href="" class="btn" @click ="goToRequestExercise">Add Exercise</a>
        </li>
        <li>
          <a href="" class="btn"  @click ="goToExerciseList" >Edit Exercise</a>
        </li>
        <li>
          <a href="" class="btn" @click="goToExerciseList">Delete Exercise</a>
        </li>
        <li>
          <a href="" class="btn" @click="goToAddWorkout">Add Workout</a>
        </li>
        <li>
          <a href="" class="btn">Edit Workout</a>
        </li>
        <li>
          <a href="" class="btn" @click="goToDeleteWorkout">Delete Workout</a>
        </li>
      </ul>
    </nav>    
      </div>
    </section>
    <footer>
      <p>ElevateFitness &copy; 2023</p>
    </footer>
  </div>
</div>

</template>

<script>

export default {
  name: "trainerHome",
  data(){
  return{
      trainerHome:[]
    } 
  }, 
  methods:{
    goToExerciseList() {
      this.$router.push({ name: 'all-exercises' });
    },
   goToRequestExercise() {
      this.$router.push({ name: 'add-exercises' });
  },
    goToAddWorkout() {
      this.$router.push('/workouts/add');
    },
    goToDeleteWorkout() {
      this.$router.push('/v1/workouts');
    }
    
  }

}
</script>

<style scoped>
.showcase {
  grid-area: showcase;
  min-height: 400px;
  background: url(https://hips.hearstapps.com/hmg-prod/images/gettyimages-865837254-1520531198.jpg?crop=0.686xw:0.791xh;0.107xw,0.0879xh&resize=1200:*);
  background-size: cover;
  background-position: center;
  padding: 4.4rem;
  display: flex;
  flex-direction: column;
  align-items: start;
  justify-content: center;
  box-shadow: var(--shadow);
}

</style>