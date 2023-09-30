<template>
  <div class="allWorkouts">
    <h1>Workout List</h1>
      <table class="workoutList-table">
        <tbody>
        <th> Workout name</th>
        <th>Description</th>
        <th>Status</th>
          <tr v-for="workout in workouts" v-bind:key="workout.id">
            <td>{{ workout.name }}</td>
            <td>{{ workout.description }}</td>
            <td>{{ workout.status }}</td>
        </tr>
        </tbody>
      </table>
      <div id="buttons">
      <button>Delete Workout</button>
      <button>Update Workout</button>
</div>
  </div>
</template>
<script>
 import service from '../services/WorkoutService'
export default {
  name: "all-workouts",
  data() {
    return { workouts: [] };
  },
  created() {
    service.listWorkouts().then((response) => {
      this.workouts = response.data ?? []
    });
  }
}
</script>

<style scoped>
table{
    display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */

}

body {
  margin: auto;
}

table {
    
    
    display: inline-block;
    border: 1px black solid;
    padding: 10px 20px;
    border-radius: 15px;
    font-family: 'Poppins',sans-serif;
    background-color: rgba(255,255,255,0.13);
    backdrop-filter: blur(30px);
}

.button-container{
    text-align: center;
}

button {
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
      width: 50vw;
      position:absolute;
      transform: translate(-50%,-50%);
      top: 50%;
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
 
  /* Data cell styles */
  table td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
  }
  /* Alternate row background color */
  table tr:nth-child(even) {
    background-color: #0505056e;
    backdrop-filter: blur(30px);
  }
  /* Hover effect for rows */
  table tr:hover {
    background-color: #b409f896;
  }
  /* Add some space around the table */
  table-container {
    margin: 40px;
  }
  table tr {
    transition: background-color 0.3s, opacity 0.3s;
  
  
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
    cursor: pointer;
  }
  /* Add a subtle border to table rows */
  table tr {
    border-bottom: 2px solid #8f05ffb9;
    margin-left: 60vw;
  }
  /* Add a gradient background to header cells */
  table th {
    background-color: #8f05ffb9;
    color: rgb(255, 255, 255);
    text-align: center;
        font-style: italic;

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
</style>