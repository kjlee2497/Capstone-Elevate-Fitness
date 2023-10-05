<template>
  <div class="exerciseList">
    <div class="bg-image"
     style="background-image: url('  https://img.peerspace.com/image/upload/w_1200,c_limit/c_crop,g_custom,f_auto,q_auto,dpr_auto/l_PS-logo,g_south_east,x_20,y_20,w_175,o_75/nutvnqk8nwfellox26n5
');" >
    <form @submit.prevent="updateWorkout(myId, workout)">
        <input type="text" v-model="workout.name" id="workout-name">
        <br>
        <textarea rows="4" columns="50" v-model="workout.description" id="workout-description" />
        <br>
        <button class="submit-btn">Submit Changes</button> 

    </form>

      <table class="exerciseList-table">
       
        <thead>
          <th class="name"> Exercise Name</th>
          <th class="description">Description</th>
          <th class="weight">Suggested Weight</th>
          <th class="repCount">Rep Count</th>
          <th class="expectedTime">Expected Time to Complete</th>
          <th class="target">Target Area</th>
          <th class="checkmark"></th>

        
        </thead>
       <tbody class="scrollbar" id="scrollbar">
       
           
          <tr v-for="exercise in filter" v-bind:key="exercise.id">
            <td class="strikethrough">{{ exercise.name }}</td>
            <td class="description">{{ exercise.description }}</td>
            <td class="weight">{{ exercise.weight }} lbs</td>
            <td class="repCount">{{ exercise.repCount }} reps</td>
            <td class="expectedTime">{{ exercise.expectedTime }} seconds</td>
            <td class="target">{{ exercise.target }}</td>
            <td>
              <button v-on:click="deleteExerciseFromWorkout(exercise.exercise_id)">Delete</button>  
            </td>
           
          </tr>
      </tbody>

      </table>
      
    </div>
  </div>

</template>
<script>
 import service from '../services/ExerciseService'
import WorkoutService from '../services/WorkoutService'


export default {
  name: "all-exercises",
  data(){
    return{
      exercises:[],
      filter:[],
      myId: '',  //wonky solution, fix it tomorrow 
      filterOptions: {
        searchQuery: "",
        searchFilter: "all"
      },
      workout: {
        workout_id: "",
        name: "",
        description: "",
        isCompleted: ''
      }
    }
  },
  created() {
    service.getExercisesByWorkout(this.$route.params.workoutId).then((response) => {
      this.exercises = response.data;
      this.filter = this.exercises;
      WorkoutService.getWorkoutById(this.$route.params.workoutId)
        .then(res => {
          if(res.status == 200) {
            this.workout = res.data;
          }
        })
        .catch(err => {
          this.handleErrorResponse(err, "getting")
        });
    })
    .catch(err => {
      this.handleErrorResponse(err, "getting")
    });
    this.myId = this.$route.params.workoutId
  },
  methods: {

  backToWorkoutList(){
    this.$router.push(`/home`)
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
  deleteExerciseFromWorkout(exerciseId) {
    service.deleteExerciseFromWorkout(exerciseId)
      .then(res => {
        if(res.status == 200) {
          this.$router.go();
        }
      })
      .catch(err => {
        this.handleErrorResponse(err, "deleting")
      });
  },
  updateWorkout(workoutId, workout) {
    console.log(workoutId);
    console.log(this.myId);
    console.log(this.workout)
    WorkoutService.updateWorkout(workoutId, workout)
      .then(res => {
        if(res.status == 200) {
          alert("Workout has been updated!");
          this.$router.push(`/workout/details/${workoutId}`)
        }
      })
      .catch(err => {
          this.handleErrorResponse(err, "updating")
      });
  } 
 
  }
}
</script>
<style scoped>

.submit-btn {
  font-size: 20px;
  margin-top: 0.3%
}
.scrollbar {
  height: 300px;
  width: auto;
  overflow: auto; 
 }

#scrollbar::-webkit-scrollbar {
  background-color: rgba(0, 0, 0, 0);
  width: 12px;
  border-radius: 10px;
}
        
#scrollbar::-webkit-scrollbar-track {
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

h1 {
  margin: 0px 0px;
  font-family: 'Poppins',sans-serif;
  text-shadow: 2px 2px 2px black;

}
.bg-image {
  height: 100vh;
  width: 100vw;
}

  table{
    display: flex;
    justify-items: center;
      margin-top:155px;
      height: 65vh;
      width: 75vw;
      position:absolute;
      transform: translate(-50%,-50%);
      top: 52%;
      left: 53.5%;
      
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


thead th{
  text-align: center;
  padding: 10px;
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
    
     margin-top: 20px;
     display: flex;
    justify-items: center;
    justify-content: space-evenly;
    margin-bottom: 60px;
}
  
  
  button {
    
    background-color: #0b080cc0;
    color: #fff;
    border: 10px;
    padding: 15px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}
 
  button:hover {
    background-color: #8F05FF;
    transform: scale(1.05);
        animation: pulse 0.5s ease infinite alternate;
  }
 
  button:hover {
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
}


.name {
  width: 5vw;
 
}
.description {
  width: 25vw;
}
.weight {
  width: 8vw;
}
.repCount {
  width: 8vw;
}
.expectedTime{
  width: 8vw;
}
.target {
  width: 8vw;
}
.checkmark {
  width: 4vw;
}

#cb {
  width: 1.5vw;
  height: 1.5vw;
}
form {
  margin-left: 0%;
  padding-top: 3%;
  text-align: center;
}

#workout-name {
  width: 40vw;
  height: 5vh;
  font-size: 30px;
  font-family: 'Poppins',sans-serif;
  text-align: center;
}

#workout-description {
  font-family: 'Poppins',sans-serif;
  width: 40vw;
  height: 10vh;
  font-size: 15px;
  margin-top: 1%;
  padding: 10px;
}





</style>
