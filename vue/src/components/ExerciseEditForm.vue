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
          <button></button>
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

.cardForm{
    margin:0px;
    height: 100vh;
    display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */

}
.form-group {
    display: inline-block;
    border: 1px black solid;
    padding: 10px 20px;
    border-radius: 15px;
    font-family: 'Poppins',sans-serif;
    background-color: lightgrey;
}

.btn-container{
    text-align: center;
}

.btn {
    margin: 10px 50px;
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
