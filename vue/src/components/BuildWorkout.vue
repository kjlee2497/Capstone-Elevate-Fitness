<template>
  <div class="exerciseList">
    <div class="bg-image"
     style="background-image: url('  https://img.peerspace.com/image/upload/w_1200,c_limit/c_crop,g_custom,f_auto,q_auto,dpr_auto/l_PS-logo,g_south_east,x_20,y_20,w_175,o_75/nutvnqk8nwfellox26n5
');" >
<br>
    <h1>Select Your Exercises</h1>
    
    <br>
    <div class="filterBar">
        <input type="text" id="filterTextBar" v-model="filterOptions.searchQuery" placeholder="Please Enter Your Search Query">
        <select name="filterCategory" id="filterCategory" v-model="filterOptions.searchFilter">
          <option value="exerciseName">Name</option>
          <option value="target">Target</option>
          <option value="time">Time</option>
          <option value="all">All</option>
        </select>
        <button id="filterBtn" v-on:click="filterExercises">Filter</button>

    </div>
    <br>
    <div id="buttons">
        <button class="refresh-btn" v-on:click="refreshPage">Refresh</button>
        <button class="submit-exercises" v-on:click="addExercisesToWorkout()">Add Exercises To Workout</button>
        <button v-on:click="deleteWorkout(workoutId)">Cancel</button>
    </div>
    <br>
    <div id="main-container">
        <table class="exerciseList-table table">
        
            <thead>
            <th class="name"> Exercise Name</th>
            <th class="description">Description</th>
            <th class="weight">Suggested Weight</th>
            <th class="repCount">Rep Count</th>
            <th class="expectedTime">Expected Time to Complete</th>
            <th class="target">Target Area</th>
            <th class="edit-btn"></th>
            </thead>
        <tbody class="scrollbar" id="scrollbar">
            <tr v-for="exercise in this.$store.state.filter" v-bind:key="exercise.id">
                <td class="name">{{ exercise.name }}</td>
                <td class="description">{{ exercise.description }}</td>
                <td class="weight">{{ exercise.weight }} lbs</td>
                <td class="repCount">{{ exercise.repCount }} reps</td>
                <td class="expectedTime">{{ exercise.expectedTime }} seconds</td>
                <td class="target">{{ exercise.target }}</td>
                <td class="edit-btn"><button v-on:click="addToWorkoutList(exercise)">Add</button></td>
            </tr>    
            </tbody> 
        </table>
    
        <div id="workoutExercises">
        <table class="exerciseList-table table table2">
            <h1 class="workout-name">{{ this.workout.name }}</h1>
           
                <thead>
                <th class="name"> Exercise Name</th>
                <th class="weight">Suggested Weight</th>
                <th class="repCount">Rep Count</th>
                <th class="expectedTime">Expected Time to Complete</th>
                <th class="target">Target Area</th>
                <th class="edit-btn"></th>
                </thead>
            <tbody class="scrollbar2" id="scrollbar2">
                <tr v-for="exercise in this.$store.state.workoutExercises" v-bind:key="exercise.id">
                    <td class="name">{{ exercise.name }}</td>
                    <td class="weight">{{ exercise.weight }} lbs</td>
                    <td class="repCount">{{ exercise.repCount }} reps</td>
                    <td class="expectedTime">{{ exercise.expectedTime }} seconds</td>
                    <td class="target">{{ exercise.target }}</td>
                </tr>    
            </tbody> 
        </table>
        </div>
    </div>

      
    </div>
  </div>

</template>
<script>
import ExerciseService from '../services/ExerciseService'
import WorkoutService from "../services/WorkoutService"

export default {
  name: "all-exercises",
  data(){
    return{
      filterOptions: {
        searchQuery: "",
        searchFilter: "all"
      },
      workout: {
          name: "",
          description: "",
          status: ""
      },
      exercisesToAdd: [],
      workoutId: ""
    }
  },
  created() {
    ExerciseService.getAllExercises().then((response) => {
      this.$store.state.exercises = response.data;
      this.$store.state.filter = this.$store.state.exercises;
    })
    .catch(err => {
      this.handleErrorResponse(err, "getting")
    });
    WorkoutService.getWorkoutById(this.$route.params.workoutId)
        .then(res => {
            this.workout = res.data;
            this.workoutId = this.$route.params.workoutId;
        })
  },
  methods: {
    refreshPage() {
        this.$router.go();
    },
    goToRequestExercise() {
      this.$router.push({ name: 'add-exercises' });
  },
    filterExercises(){
      if(this.filterOptions.searchFilter == 'all') {
        this.$store.state.filter = this.$store.state.exercises;
      }
      if(this.filterOptions.searchFilter == 'target') {
        this.$store.state.filter = [];
        let filteredExercises = [];
        for(let exercise of this.$store.state.exercises) {
          if(exercise.target == this.filterOptions.searchQuery) {
            filteredExercises.push(exercise);
          }
        }
        this.$store.state.filter = filteredExercises;
      }
      if(this.filterOptions.searchFilter == 'exerciseName') {
        this.$store.state.filter = [];
        let filteredExercises = [];
        for(let exercise of this.$store.state.exercises) {
          if(exercise.name.toLowerCase().includes(this.filterOptions.searchQuery.toLowerCase())) {
            filteredExercises.push(exercise);
          }
        }
        this.$store.state.filter = filteredExercises;
      }
      if(this.filterOptions.searchFilter == 'time') {
        this.$store.state.filter = [];
          let filteredExercises = [];
        for(let exercise of this.$store.state.exercises) {
            if(exercise.expectedTime <= this.filterOptions.searchQuery) {
              filteredExercises.push(exercise);
            }
          }
        this.$store.state.filter = filteredExercises;
      }
    },
    handleErrorResponse(error, verb) {
      if (error.response) {
        this.errorMsg =
          "Error " + verb + " exercise to workout. Response received was '" +
          error.response.statusText +
          "'.";
      } else if (error.request) {
        this.errorMsg =
          "Error " + verb + " exercise to workout. Server could not be reached.";
      } else {
        this.errorMsg =
          "Error " + verb + " exercise to workout. Request could not be created.";
      }
    },
    addToWorkoutList(currentExercise) {
        for(let exercise of this.$store.state.exercises) {
            if(exercise.exercise_id == currentExercise.exercise_id) {
                console.log("clicked");
               this.$store.commit("ADD_EXERCISE_TO_WORKOUT", currentExercise);
            }
        }
    },
    addExercisesToWorkout() {
        this.storeExercisesInLocal();
        for(let exercise of this.exercisesToAdd) {
            WorkoutService.addExerciseToWorkout(this.workoutId, exercise.exercise_id)
                .then(res => {
                    if(res.status == 200) {
                        console.log("Exercise has been added");
                    }
                })
                .catch(err => {
                    this.handleErrorResponse(err, "adding")
                });        }
                this.$router.push(`/workout/details/${this.workoutId}`);
    },
    storeExercisesInLocal() {
        this.exercisesToAdd = this.$store.state.workoutExercises;
    },
    deleteWorkout(workoutId) {
      WorkoutService.deleteWorkout(workoutId)
        .then(res=> {
          if(res.status == 200) {
            alert("Workout has not been created.  Returning to Home...");
            this.$router.push('/home');
          }
        })
    }
  }
}
</script>
<style scoped>

.scrollbar {
  height: 300px;
  width: auto;
  overflow: auto; 
 }
 .scrollbar2 {
  height: 420px;
  width: auto;
  overflow: auto; 
 }

#scrollbar::-webkit-scrollbar {
  background-color: rgba(0, 0, 0, 0);
  width: 12px;
  border-radius: 10px;
}
#scrollbar2::-webkit-scrollbar {
  background-color: rgba(0, 0, 0, 0);
  width: 12px;
  border-radius: 10px;
}
        
#scrollbar::-webkit-scrollbar-track {
  border-radius: 10px;
 background-color: rgba(255, 255, 255, 0.178);
  backdrop-filter: blur(30px);
}
        
#scrollbar2::-webkit-scrollbar-track {
  border-radius: 10px;
 background-color: rgba(255, 255, 255, 0.178);
  backdrop-filter: blur(30px);
}
        
#scrollbar::-webkit-scrollbar-thumb {
  background-color: #8f05ffb9;
   transform: scale(1.05);
  backdrop-filter: blur(30px);
  border-radius: 10px;

}
        
#scrollbar2::-webkit-scrollbar-thumb {
  background-color: #8f05ffb9;
   transform: scale(1.05);
  backdrop-filter: blur(30px);
  border-radius: 10px;

}

h1.workout-name {
  margin-top:none;
  padding-top: none;
  font-family: 'Poppins',sans-serif;
  text-shadow: 2px 2px 2px black;

}


.bg-image {
  height: 100vh;
  width: 100vw;
}

  .table{
    display: flex;
    justify-items: center;
      margin-top:8%;
      height: 65vh;
      width: 50vw;
      position:absolute;
      transform: translate(-50%,-50%);
      top: 42%;
      /* left: 53.5%; */
      left: 33%;
      
      border-radius: 10px;
      backdrop-filter: blur(10px);
      box-shadow: 0 0 40px rgba(8,7,16,0.6);
      padding: 10px 15px;
      font-family: 'Poppins',sans-serif;
      color: #FFFFFF;
      letter-spacing: 0.5px;
      outline: none;
      border: none;
      text-shadow: 2px 2px 2px black;
      border-collapse: collapse;
      display: inline-block;
      border: 1px black solid;
      padding: 30px;
    
    background-color: rgba(255,255,255,0.13);
    backdrop-filter: blur(15px);
  }

  
.table2{
    margin-top: 8%;
    width: 35vw;
    left: 77%;
}

 
  .exerciseList-table td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
    text-align: center;
  }

  .exerciseList-table tr:nth-child(even) {
    background-color: #0505056e;
    backdrop-filter: blur(30px);
  }
  
  
  .exerciseList-table-container {
    margin: 40px;
  }
  .exerciseList-table tr {
    transition: background-color 0.3s, opacity 0.3s;
  
  }
  
  .exerciseList-table tr:hover {
    background-color: #b409f896;
    opacity: 0.8;
    transform: scale(1.01);
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
    cursor: pointer;
  }
 
  .exerciseList-table tr {
    border-bottom: 2px solid #8f05ffb9;
    margin-left: 60vw;
  }
  
  .exerciseList-table th {
    background-color: #8f05ffb9;
    color: rgb(255, 255, 255);
    text-align: center;
        font-style: italic;

  }

tbody#scrollbar.scrollbar{
  height: 50vh;

}

tbody{
  height: 50vh;
  overflow: scroll;
  
  display: block;
  
}
   
  @keyframes pulse {
    from {
      transform: scale(1);
    }
    to {
      transform: scale(1.02);
    }
  }
  #buttons{
    
     margin-top: 1%;
     display: flex;
    justify-items: center;
    justify-content: space-evenly;
    margin-bottom: 60px;
    margin-right: 8%
}
  
button {
  
  background-color: #0b080cc0;
  color: #fff;
  border: 10px;
  padding: 10px 20px;
  font-size: 16px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s, transform 0.2s;
}
 
button:hover {
  background-color: #8F05FF;
  transform: scale(1.05);
  animation: pulse 0.5s ease infinite alternate;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);

}

.filterBar {
  text-align: center;
  margin-top: 0px;
}

#filterTextBar {
  width: 40vw;
  height: 30px;
  font-size: 20px;
}

#filterCategory {
  width: 10vw;
  height: 35px;
  margin-left: 30px;
  font-size: 20px;
}

#filterBtn {
  margin-left: 30px;
  height: 40px;
  font-size: 20px;
}
thead th{
  text-align: center;
  padding: 10px;
}
.name {
  width: 10vw;
}
.description {
  width: 25vw;
}
.weight {
  width: 5vw;
}
.repCount {
  width: 5vw;
}
.expectedTime{
  width: 5vw;
}
.target {
  width: 5vw;
}



</style>
