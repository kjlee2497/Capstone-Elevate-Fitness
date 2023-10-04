import axios from "axios";

export default {

getAllExercises() {
    return axios.get("/exercises");
},

createExercise(exercise) {
    return axios.post("/exercises/generate", exercise);
},

editExercise(exercise, exerciseId) {
    return axios.put(`/exercises/id/${exerciseId}/`, exercise);
},

deleteExercise(exerciseId) {
    return axios.delete(`/exercises/id/${exerciseId}`);
},

getExercisesByWorkout(workoutId) {
    return axios.get(`/exercises/workout/${workoutId}`);
},

getExercisesByUser(userId) {
    return axios.get(`/exercises/user/id/${userId}`);
},

getExerciseByTarget(target) {
    return axios.get(`/exercises/target/${target}`);
},

getExerciseById(exerciseId) {
    return axios.get(`/exercises/id/${exerciseId}`);
},

deleteExerciseFromWorkout(exerciseId) {
    return axios.delete(`/workout/exercises/${exerciseId}`)
}



}