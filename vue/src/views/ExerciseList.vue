<template>
  <div class="exerciseList">
    <h1>Exercise List</h1>
      <table class="exerciseList-table">
        <th> Exercise name</th>
        <th>Description</th>
        <th>Suggested Weight</th>
        <th>Rep Count</th>
        <th>Expected Time to Complete</th>
        <th>Target Area</th>
          <tr v-for="exercise in exercises" v-bind:key="exercise.id">
            <!-- <td>{{ exercise.id }}</td> -->
            <td>{{ exercise.name }}</td>
            <td>{{ exercise.description }}</td>
            <td>{{ exercise.weight }}</td>
            <td>{{ exercise.repCount }}</td>
            <td>{{ exercise.expectedTime }}</td>
            <td>{{ exercise.target }}</td>
        </tr>
      </table>
      <div id="buttons">
      <button>Add Selected Exercises to a Workout</button>
      <button>Request an Exercise</button>
      <button>Generate a Random Workout</button>
</div>
  </div>
</template>
<script>
 import service from '../services/ExerciseService'
export default {
  name: "all-exercises",
  data(){
    return{
      exercises:[]
    }
  },
  created() {
    service.getAllExercises().then((response) => {
      this.exercises = response.data
    });
  }
}
</script>
<style scoped>
  /* table{
     height: 900px;
      width: 75vw;
      background-color: rgba(255,255,255,0.13);
      position: absolute;
      transform: translate(-50%,-50%);
      top: 50%;
      left: 50%;
      border-radius: 10px;
      backdrop-filter: blur(10px);
      border: 2px solid rgba(255,255,255,0.1);
      box-shadow: 0 0 40px rgba(8,7,16,0.6);
      padding: 10px 15px;
      font-family: 'Poppins',sans-serif;
      color: #FFFFFF;
      letter-spacing: 0.5px;
      outline: none;
      border: none;
     text-shadow: 2px 2px 2px black;
     border-collapse: collapse;
  margin: 20px 0;
  }
  th {
    font-style: italic;
  } */
   /* Container styles */
  .exerciseList {
    font-family: Arial, sans-serif;
    margin-top: 20vh;
    margin-right: none;
}
  /* Header styles */
  .exerciseList h1 {
    text-align: center;
    font-size: 24px;
    margin-bottom: 20px;
  }
  /* Table styles */
  .exerciseList-table {
    border-collapse: collapse;
    background-color: #F2F2F2;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
    margin-right: 18%;
    margin-left: 18%;
  }
  /* Header cell styles */
  .exerciseList-table th {
    background-color: #333;
    color: #fff;
    text-align: left;
    padding: 10px;
    transform: none;
  }
  /* Data cell styles */
  .exerciseList-table td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
  }
  /* Alternate row background color */
  .exerciseList-table tr:nth-child(even) {
    background-color: #F9F9F9;
  }
  /* Hover effect for rows */
  .exerciseList-table tr:hover {
    background-color: #ccc;
  }
  /* Add some space around the table */
  .exerciseList-table-container {
    margin: 20px;
  }
  .exerciseList-table tr {
    transition: background-color 0.3s, opacity 0.3s;
  }
  /* Change background color and opacity on hover */
  .exerciseList-table tr:hover {
    background-color: #ccc;
    opacity: 0.8;
  }
    /* Add animation to row hover effect */
  .exerciseList-table tr {
    transition: background-color 0.3s, opacity 0.3s;
  }
  /* Change background color and opacity on hover */
  .exerciseList-table tr:hover {
    background-color: #b409f88c;
    opacity: 0.8;
    transform: scale(1.01);
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
    cursor: pointer;
  }
  /* Add a subtle border to table rows */
  .exerciseList-table tr {
    border-bottom: 2px solid #8F05FF;
    margin-left: 60vw;
  }
  /* Add a gradient background to header cells */
  .exerciseList-table th {
    background: linear-gradient(to bottom, #070606, #585656);
    color: rgb(255, 255, 255);
    text-align: center;
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
    justify-content: space-between;
    margin-right: 18%;
    margin-left: 18%;
    margin-bottom: 40px;
}
  /* Basic button styles */
  button {
    background-color: #0b080cc0;
    color: #fff;
    border: none;
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
  .table-container {
    overflow-y: auto;
    max-height: 40px; /* Adjust the maximum height as needed */
  }
</style>
