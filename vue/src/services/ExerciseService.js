import axios from "axios";

export default {

getAllExercises() {
    return axios.get("/exercises");
},

createExercise(exercise) {
    return axios.post("/exercise/add/addExercise", exercise);
},

editExercise(exercise) {
    return axios.put("/exercises/id/edit/editExercise/", exercise);
},

deleteExercise(exerciseId) {
    return axios.delete(`/exercises/id/deleteExercise/${exerciseId}`);
},

getExercisesByWorkout(workoutId) {
    return axios.get(`/exercises/workout/id/${workoutId}`);
},

getExercisesByUser(userId) {
    return axios.get(`/exercises/user/id/${userId}`);
},

getExerciseByTarget(target) {
    return axios.get(`/exercises/target/${target}`);
},

getExerciseById(exerciseId) {
    return axios.get(`/exercises/id/${exerciseId}`);
}


}