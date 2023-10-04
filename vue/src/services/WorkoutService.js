import axios from "axios";

export default {

    listWorkouts() {
        return axios.get("/v1/workouts");
    },

    getWorkoutById(id) {
        return axios.get(`/v1/workouts/id/${id}`);
    },

    listWorkoutsByTarget(target) {
        return axios.get("/v1/workouts/target/", target);
    },

    listWorkoutsByUser(id) {
        return axios.get("/v1/workouts/user", id);
    },

    listWorkoutsByLength() {
        return axios.get("/v1/workouts/length");
    },

    listCompletedWorkouts(id) {
        return axios.get("/v1/workouts/completed", id);
    },

    generateWorkout(workout) {
        return axios.post("/v1/workout", workout)
    },

    updateWorkout(id, workout) {
        return axios.put(`/v1/workout/${id}`, workout);
    },

    deleteWorkout(id) {
        return axios.delete(`/v1/workout/${id}`);
    },
    setcomplete(id) {
        return axios.put(`/v1/exercise/workout/${id}/complete`);
    },
    setincomplete(id) {
        return axios.put(`/v1/exercise/workout/${id}/incomplete`);
    },
    addExerciseToWorkout(workoutId, exerciseId) {
        return axios.post(`/v1/workout/${workoutId}/${exerciseId}`);
    },
    assignUserToWorkout(id) {
        return axios.post(`/v1/workout/add/${id}`);
    },
    listAssignedWorkout(){
        return axios.get(`/assigned`)
    },
    listWorkoutHistoryForUser(){
        return axios.get(`/completed`)
    },




}

