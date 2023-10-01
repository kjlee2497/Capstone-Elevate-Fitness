<template>
  <div>
    <form @submit.prevent="submitForm" class="cardForm">
      
      <div class="form-group">
        <div class="form-control">
          <label for="name">Exercise Name:</label>
          <input type="text" id="name" v-model="exercise.name">
        </div>
        <div class="form-control">
          <label for="description">Description:</label>
          <input type="text" id="description" v-model="exercise.description">
        </div>

        <div class="form-control">
          <label for="weight">Suggested Weight:</label>
          <input type="number" id="weight" v-model="exercise.weight">
        </div>

        <div class="form-control">
          <label for="expectedTime">Expected Time (Seconds):</label>
          <input type="number" id="expectedTime" v-model="exercise.expectedTime">
        </div>

        <div class="form-control">
          <label for="repCount">Suggested Number of Reps (per Set):</label>
          <input type="number" id="repCount" v-model="exercise.repCount">
        </div>

        <div class="form-control">
          <label for="target">Target Muscle Group:</label>
          <input type="text" id="target" v-model="exercise.target">
        </div>

        <div class="btn-container">
          <button class="btn btn-submit" type="submit">Submit</button>
          <button class="btn btn-cancel" @click="cancelForm">Cancel</button>
          
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import ExerciseService from '../services/ExerciseService'

export default {
  name: "edit-exercise",
  data() {
    return {
      exercise: {
        name: "",
        description: "",
        weight: "",
        repCount: "",
        expectedTime: "",
        target: ""
      },
      errorMsg: ""
    }
  },
  methods: {
    submitForm() {
      const newExercise = {
        exercise_id: Number(this.$route.params.exerciseId),
        name: this.exercise.name,
        description: this.exercise.description,
        weight: this.exercise.weight,
        repCount: this.exercise.repCount,
        expectedTime: this.exercise.expectedTime,
        target: this.exercise.target
      };
      ExerciseService.editExercise(newExercise, this.$route.params.exerciseId)
        .then(res => {
          if (res.status === 200) {
            this.$router.push(`/exercises/`)
          }
        })
        .catch(err => {
          this.handleErrorResponse(err, "updating")
        })
    },
    cancelForm() {
        alert(
            "Cancelled.  Returning to exercise list."
        )
        this.router.push({ name: `all-exercises` })
    },
    handleErrorResponse(error, verb) {
      if (error.response) {
        this.errorMsg =
          "Error " + verb + " exercise. Response received was '" +
          error.response.statusText +
          "'.";
      } else if (error.request) {
        this.errorMsg =
          "Error " + verb + " exercise. Server could not be reached.";
      } else {
        this.errorMsg =
          "Error " + verb + " exercise. Request could not be created.";
      }
    }
  },
  created() {
    ExerciseService.getExerciseById(this.$route.params.exerciseId)
      .then(res => {
        this.exercise = res.data
      })
      .catch(err => {
        if (err.response && err.response.status === 404) {
          alert(
            "Exercise not available."
          );
          this.$router.push({ name: 'all-exercises' });
        }
      })
  }
}
</script>

<style>

form.cardForm {
    margin-top: -100px;
}
.cardForm{
    margin:0px;
    height: 100vh;
    display: flex;
    justify-content: center; 
    align-items: center; 
}
.form-group {
    display: inline-block;
    border: 1px black solid;
    padding: 10px 20px;
    border-radius: 15px;
    font-family: 'Poppins',sans-serif;
       background-color: rgba(122, 122, 122, 0.24);
    backdrop-filter: blur(10px);
    
     color: #FFFFFF;
      letter-spacing: 0.5px;
      outline: none;
      border: none;
     text-shadow: 2px 2px 2px black;
}

.btn-container{
    text-align: center;
}

.btn {
    margin: 10px 50px;
     background-color: #0b080cc0;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

.btn:hover {
     background-color: #8F05FF;
    transform: scale(1.05);
        animation: pulse 0.5s ease infinite alternate;
}

.form-control {
    margin: 20px 0px;
}

label {
    margin-right: 20px;
    font-weight: bold;
}

input {
    height: 20px;
    border: 1px darkgrey solid;
}

</style>
