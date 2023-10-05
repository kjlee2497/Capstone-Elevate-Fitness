<template>
  <div class="exerciseList">
    <div class="bg-image"
     style="background-image: url('  https://img.peerspace.com/image/upload/w_1200,c_limit/c_crop,g_custom,f_auto,q_auto,dpr_auto/l_PS-logo,g_south_east,x_20,y_20,w_175,o_75/nutvnqk8nwfellox26n5
');" >
<br>
    <h1>Exercise List</h1>
    
    <br>
    <div class="filterBar">
        <input type="text" id="filterTextBar" v-model="filterOptions.searchQuery">
        <select name="filterCategory" id="filterCategory" v-model="filterOptions.searchFilter">
          <option value="exerciseName">Name</option>
          <option value="target">Target</option>
          <option value="time">Time</option>
          <option value="all">All</option>
        </select>
        <button id="filterBtn" v-on:click="filterExercises">Filter</button>
    <div id="buttons">
      <!-- <button>Add Selected Exercises to a Workout</button> -->
      
      <button class="requestButton" @click="goToRequestExercise">Add an Exercise</button>
      <!-- <button>Generate a Random Workout</button> -->
      
    </div>

    </div>
    <br>
    <br>
      <table class="exerciseList-table">
       
        <thead>
          <th class="name"> Exercise Name</th>
          <th class="description">Description</th>
          <th class="weight">Suggested Weight</th>
          <th class="repCount">Rep Count</th>
          <th class="expectedTime">Expected Time to Complete</th>
          <th class="target">Target Area</th>
          <th class="edit"></th>

          
        </thead>
       <tbody class="scrollbar" id="scrollbar">
       
           
          <tr v-for="exercise in filter" v-bind:key="exercise.id">
            <td class="name">{{ exercise.name }}</td>
            <td class="description">{{ exercise.description }}</td>
            <td class="weight">{{ exercise.weight }} lbs</td>
            <td class="repCount">{{ exercise.repCount }} reps</td>
            <td class="expectedTime">{{ exercise.expectedTime }} seconds</td>
            <td class="target">{{ exercise.target }}</td>
            <td class="edit-btn"><button v-on:click="goToEditPage(exercise.exercise_id)">Edit</button></td>
            <td class="delete-btn"><button v-on:click="deleteExercise(exercise.exercise_id)">Delete</button></td>
        
        </tr>
           
        </tbody>
       
      </table>
      
    </div>
  </div>

</template>
<script>
 import service from '../services/ExerciseService'
export default {
  name: "all-exercises",
  data(){
    return{
      exercises:[],
      filter:[],
      filterOptions: {
        searchQuery: "",
        searchFilter: "all"
      }
    }
  },
  created() {
    service.getAllExercises().then((response) => {
      this.exercises = response.data;
      this.filter = this.exercises;
    })
    .catch(err => {
      this.handleErrorResponse(err, "getting")
    });
  },
  methods: {
    goToEditPage(exerciseId) {
      this.$router.push(`/exercise/${exerciseId}`)
    },
   goToRequestExercise() {
      this.$router.push({ name: 'add-exercises' });
  },
    deleteExercise(exerciseId) {
      service.deleteExercise(exerciseId)
          .then(res => {
            if(res.status == 200) {
              confirm("Exercise will be deleted.  Would you like to continue?");
              this.$router.go();
            }
          })
          .catch(err => {
            this.handleErrorResponse(err, "deleting")
          })
    },
    filterExercises(){
      if(this.filterOptions.searchFilter == 'all') {
        this.filter = this.exercises;
      }
      if(this.filterOptions.searchFilter == 'target') {
        this.filter = [];
        let filteredExercises = [];
        for(let exercise of this.exercises) {
          if(exercise.target == this.filterOptions.searchQuery) {
            filteredExercises.push(exercise);
          }
        }
        this.filter = filteredExercises;
      }
      if(this.filterOptions.searchFilter == 'exerciseName') {
        this.filter = [];
        let filteredExercises = [];
        for(let exercise of this.exercises) {
          if(exercise.name.toLowerCase().includes(this.filterOptions.searchQuery.toLowerCase())) {
            filteredExercises.push(exercise);
          }
        }
        this.filter = filteredExercises;
      }
      if(this.filterOptions.searchFilter == 'time') {
          this.filter = [];
          let filteredExercises = [];
          for(let exercise of this.exercises) {
            if(exercise.expectedTime <= this.filterOptions.searchQuery) {
              filteredExercises.push(exercise);
            }
          }
        this.filter = filteredExercises;
      }
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
  }
}
</script>
<style scoped>


.scrollbar {
  height: 300px;
  width: 62vw;
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
      margin-top:150px;
      height: 65vh;
      position:absolute;
      transform: translate(-50%,-50%);
      top: 50%;
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
    
    background-color: rgba(39, 38, 38, 0.267);
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
  
 
 
  @keyframes pulse {
    from {
      transform: scale(1);
    }
    to {
      transform: scale(1.02);
    }
  }
  #buttons{
    
     margin-top: 30px;
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
.filterBar {
  text-align: center;
}

#filterTextBar {
  width: 40vw;
  height: 20px;
}

#filterCategory {
  width: 10vw;
  height: 25px;
  margin-left: 30px;
}

#filterBtn {
  margin-left: 30px;
}
thead th{
  text-align: center;
  padding: 10px;
}
.name {
  width: 10vw;
}
.description {
  width: 20vw;
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
.edit{
  width: 12vw;
}





</style>
