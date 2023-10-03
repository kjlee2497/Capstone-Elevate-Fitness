<template>
  <div>
    <form @submit.prevent="submitForm" class="cardForm">
      
      <div class="form-group">
        <div class="form-control">
          <label for="name">Workout Name:</label>
          <input type="text" id="name" v-model="workout.name">
        </div>
        <div class="form-control">
          <label for="description">Workout Description:</label>
          <input type="text" id="description" v-model="workout.description">
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
import WorkoutService from '../services/WorkoutService';
export default {
    name: "workout-form",
    props: {
        workoutID: {
            type: Number,
            default: 0
        }
    },
    data() {
        return {
            workout: {
                name: "",
                description: "",
                status: ""
            }
        }
    },
    methods: {
      submitForm() {
      const newWorkout = {
        workout_id: Number(this.$route.params.workoutId), //workoutId
        name: this.workout.name,
        description: this.workout.description,
        status: this.workout.status
      };
      WorkoutService.updateWorkout(newWorkout, this.$route.params.workoutId)
        .then(res => {
          if (res.status === 200) {
            this.$router.push(`/v1/workouts/`) ///workouts/:id
          }
        })
        .catch(err => {
          this.handleErrorResponse(err, "updating")
        })
    },
        cancelForm() {
            alert(
                "Cancelled.  Returning to workout list."
            )
            this.$router.push({ name: `all-workouts` });
        },
        handleErrorResponse(error, verb) {
            if (error.response) {
                this.errorMsg =
                "Error " + verb + " workout. Response received was '" +
                error.response.statusText +
                "'.";
            } else if (error.request) {
                this.errorMsg =
                "Error " + verb + " workout. Server could not be reached.";
            } else {
                this.errorMsg =
                "Error " + verb + " workout. Request could not be created.";
            }
        },
        
        created() {
          WorkoutService.getWorkoutById(this.$route.params.workoutId)
          .then(res => {
            this.workout = res.data
          })
          .catch(err =>{
            if (err.response && err.response.status === 404) {
              alert(
                "Workout not available."
              );
              this.$router.push({name: 'all-workouts'});
            
            }
          })
        }
    }

    
}
</script>

<style scoped>


form.cardForm {
    margin-top: -100px;
}
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
   background-color: rgba(122, 122, 122, 0.24);
    backdrop-filter: blur(10px);
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
     color: #FFFFFF;
      letter-spacing: 0.5px;
      outline: none;
      border: none;
     text-shadow: 2px 2px 2px black;

}

label {
    margin-right: 20px;
    font-weight: bold;
}

input {
    height: 20px;
    border: 1px darkgrey solid;
}

.filterBar {
  text-align: left;
}

#filterTextBar {
  width: 40vw;
  height: 20px;
}

#filterTarget {
  width: 10vw;
  height: 25px;
  margin-left: 20px;
}

#filterBtn {
  margin-left: 30px;
}
label{
 text-align: left;   
}
</style>
