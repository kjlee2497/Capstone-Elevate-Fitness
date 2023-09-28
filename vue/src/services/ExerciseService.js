import axios from "axios";

export default {

getAllExercises() {
    return axios.get("/exercises");
},

addExercise(exercise) {
    return axios.post("/exercises/generate", exercise);
},

}