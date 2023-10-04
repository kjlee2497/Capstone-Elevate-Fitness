<template>
  <div class="bg-image"
       style="background-image: url('https://images.rawpixel.com/image_1000/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yMV9waG90b19vZl9maXRuZXNzX2d5bV9iYWNrZ3JvdW5kX2NvcHlfc3BhY2VfZThiOGMxMTAtYzRhOC00YjlmLTk2OGEtZWUzNDVlZGQwYzUwXzEuanBn.jpg');">

    

    <div class="history">
     

     

      <ul>
        <li v-for="entry in workoutHistory" :key="entry.workout_history_id">
          <strong>Date Completed:</strong> {{ entry.date_completed }}<br>
          <strong>Minutes Spent:</strong> {{ entry.minutes_spent }}<br>
          <strong>Exercises Count:</strong> {{ entry.exercises_count }}<br>
          <strong>Focus Area:</strong> {{ entry.focus_area }}<br><br>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios';


export default {
  data() {
    return {
     
    };
  },
  components: {
    
  },
  mounted() {
    if (this.$store.state.user && this.$store.state.user.id) {
      this.getWorkoutHistory(this.$store.state.user.id);
    } else {
      console.error("User not logged in");
      // Here you can handle the scenario, perhaps redirect to the login page or show an error message
    }
  },
  methods: {
    getWorkoutHistory(userId) {
      axios.get(`http://localhost:8080/workout/history/user/${userId}`)
        .then(response => {
          this.workoutHistory = response.data;
        })
        .catch(error => {
          console.error('Error fetching workout history:', error);
        });
    }
  }
};
</script>

<style scoped>
  h1 {
    color: white;
    text-align: center;
    margin: 0px 0px;
    font-family: 'Poppins', sans-serif;
    text-shadow: 2px 2px 2px black;
  }

  .bg-image {
    background-size: cover;
    background-position: center;
    height: 100vh;
    width: 100vw;
    margin: 0;
  }
</style>
