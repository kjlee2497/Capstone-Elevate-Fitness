<template>

<form v-on:submit.prevent="submitForm" class="cardForm">
     
 
  <div class="form-group">
     

        <div class="form-control">
            <label for="name">Exercise Name:</label>
            <input type="text" id="name" v-model="exercise.name" required>
        </div>
        <div class="form-control">
            <label for="">Description:</label>
            <input type="text" id="description" v-model="exercise.description" required>
        </div>

        <div class="form-control">
            <label for="weight">Suggested Weight:</label>
            <input type="number" name="weight" id="weight" v-model="exercise.weight" required>
        </div>

        <div class="form-control">
            <label for="expectedTime">Expected Time (Seconds):</label>
            <input type="number" name="expectedTime" id="expectedTime" v-model="exercise.expectedTime" required>
        </div>
            
        <div class="form-control">
            <label for="repCount">Suggested Number of Reps (per Set):</label>
            <input type="number" name="repCount" id="repCount" v-model="exercise.repCount" required>
        </div>

        <div class="filterBar">
            <label for="target">Target Muscle Group:</label>
            
            <!-- <input type="text" name="filterTarget" id="filterTextBar" v-model="exercise.target" required> -->
            <select name="filterTarget" id="filterTarget"  v-model="exercise.target" required>
                <option value="arms">Arms</option>
                <option value="legs">Legs</option>
                <option value="back">Back</option>
                <option value="body">Body</option>
                <option value="cardio">Cardio</option>
            </select>
        </div>
        
        <div class="btn-container">
            <button class="btn btn-submit">Submit</button>
            <button class="btn btn-cancel"  @click="cancelForm">Cancel</button>
        </div>
  
  </div>
   
</form>
  
</template>

<script>
import ExerciseService from '../services/ExerciseService'

export default {
    name: "exercise-form",
    props: {
        exerciseID: {
            type: Number,
            default: 0
        }
    },
    data() {
        return {
            exercise: {
                name: "",
                description: "",
                weight: "",
                repCount: "",
                expectedTime: "",
                target: ""
            }
        }
    },
    methods: {
        submitForm() {
            const newExercise = {
                name: this.exercise.name,
                description: this.exercise.description,
                weight: this.exercise.weight,
                repCount: this.exercise.repCount,
                expectedTime: this.exercise.expectedTime,
                target: this.exercise.target
            };

            ExerciseService.createExercise(newExercise)
                .then(res => {
                    if (res.status === 200) {
                        this.$router.push(`/exercises/`);
                    }
                })
                .catch(err => {
                    this.handleErrorResponse(err, "adding");
                })
        },
        cancelForm() {
            alert(
                "Cancelled.  Returning to exercise list."
            )
            this.$router.push({ name: `all-exercises` });
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
        },
        clearForm() {
            this.exercise = {
                name: "",
                description: "",
                weight: "",
                repCount: "",
                expectedTime: "",
                target: ""
            }
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