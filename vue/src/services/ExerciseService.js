import axios from "axios";

export default {

getAllExercises() {
    return axios.get("/exercise");
},

addExercise(exercise) {
    return axios.post("/exercise/add", exercise);
},

}