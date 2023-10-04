<template>

  <div class="allworkouts">

  <div class="workoutList">
    <!-- <div class="scrollbar" id="scrollbar"> -->
    <br>
    <br>
    <h1>Workout List</h1>
    
      <table class="workoutList-table">
      <thead>
        <th class="h-name"> Workout Name</th>
        <th class="h-desc">Description</th>
        <th class="h-workout"></th>
        
      </thead>

        <tbody class="scrollbar" id="scrollbar">
        

          <tr v-for="workout in workouts" v-bind:key="workout.id">
           <td class="name" >{{ workout.name }}</td>
            <td class="description">{{ workout.description }}</td>

            <td class="workout-btn"><button v-on:click="goToWorkout(workout.workout_id)">Start Workout</button></td>
          </tr>

        </tbody>
      </table>

      <div id="buttons">
      
      </div>
      
</div>

</div>
  
  
</template>
<script>
 import service from '../services/WorkoutService'
export default {
  name: "assigned-workouts",
  data() {
    return {
       workouts: [] 
       };
  },
  created() {
    service.listAssignedWorkout().then((response) => {
      this.workouts = response.data ?? []
    });
  },
  methods:{
   goToWorkout(workoutId){
     this.$router.push(`/exercises/workout/${workoutId}`)
   } ,
   assignUserToWorkout(workoutId){
     service.assignUserToWorkout(workoutId).then(response => {
            if(response.status == 200) {
                alert(
                "Workout Added!!"
            )
             
              this.$router.push(`/v1/workouts`);
            }
          })

   },
  }
}
</script>

<style scoped>




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
  /* background-image: -webkit-gradient(linear, left bottom, left top, color-stop(.5, #a4a0a5), color-stop(1, #2f3031)); */
  background-color: #8f05ffb9;
   transform: scale(1.05);
  backdrop-filter: blur(30px);
  border-radius: 10px;

}

h1{
  color:white;
  text-align: center;
  /* position: static; */
  margin: 0px 0px;
  font-family: 'Poppins',sans-serif;
  text-shadow: 2px 2px 2px black;

}

body {
  margin: auto;
}

.button-container{
    text-align: center;
}

/* table{
  
    display: flex;
    justify-content: center; 
    align-items: center; 
    
} */

button {
    margin: 10px 10px;
    background-color: #0b080cc0;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

/* table {
    
    
    display: inline-block;
    border: 1px black solid;
    padding: 10px 20px;
    border-radius: 15px;
    font-family: 'Poppins',sans-serif;
    background-color: rgba(255, 255, 255, 0.493);
    backdrop-filter: blur(30px);
} */



button:hover {
     background-color: #8F05FF;
    transform: scale(1.05);
        animation: pulse 0.5s ease infinite alternate;
}

input {
    height: 20px;
    border: 1px darkgrey solid;
}



table{
  
     /* margin-top:5vh; */
      position:absolute;
      transform: translate(-50%,-50%);
      top: 70%;
      left: 50%;
      
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
    font-family: 'Poppins',sans-serif;
    background-color: rgba(255,255,255,0.13);
    backdrop-filter: blur(15px);
  }
 
  
  table td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
  }

  table tr:nth-child(even) {
    background-color: #0505056e;
    backdrop-filter: blur(30px);
  }

  
  table tr:hover {
    background-color: #b409f896;
  }

  
  table-container {
    margin: 40px;
  }

  
  
    /* Add animation to row hover effect */
  table tr {
    transition: background-color 0.3s, opacity 0.3s;
  }
  /* Change background color and opacity on hover */
  tr:hover {
    background-color: #b409f896;
    opacity: 0.8;
    transform: scale(1.01);
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
   
  }
  /* Add a subtle border to table rows */
  table tr {
    border-bottom: 2px solid #8f05ffb9;
    margin-left: 60vw;
  }
  /* Add a gradient background to header cells */
  th.h-name {
    background-color: #8f05ffb9;
    color: rgb(255, 255, 255);
    text-align: center;
        font-style: italic;
        padding: 15px;
        width: 8vw
  }

  th.h-desc {
    background-color: #8f05ffb9;
    color: rgb(255, 255, 255);
    text-align: center;
        font-style: italic;
        width: 15vw;
        height: 8vh;
  }

 
  
th.h-workout {
    background-color: #8f05ffb9;
    color: rgb(255, 255, 255);
    text-align: center;
        font-style: italic;
        padding: 15px;
        width: 40vw
  }

tbody{
   height: 50vh;
  overflow: scroll;
  display: block;
  
}
  /* Add a shadow to header cells */
  .exerciseList-table th {
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
  }
  /* Define the pulse animation */
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
    justify-content: center;

    margin-bottom: 40px;
}
  /* Basic button styles */
  button {
    /* got to go over margins */
    margin-left: 13vw; 
    background-color: #0b080cc0;
    color: #fff;
    border: 10px;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}
  /* Hover effect - change background color and add a slight scale effect */
  button:hover {
    background-color: #8F05FF;
    transform: scale(1.05);
        animation: pulse 0.5s ease infinite alternate;
  }
  /* Add a subtle box shadow on hover for depth */
  button:hover {
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
}

.name {
  width: 10vw;
}
.description {
  width: 20vw;
}

</style>