package com.techelevator.controller;

import com.techelevator.dao.WorkoutDao;
import com.techelevator.model.Exercise;
import com.techelevator.model.Workout;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class WorkoutController {
    @Autowired
    private WorkoutDao workoutDao;

    @RequestMapping(path = "/v1/workouts", method = RequestMethod.GET)
    public List<Workout> getAllWorkouts() {
        return workoutDao.listWorkouts();
    }

    @RequestMapping(path = "/v1/workouts/id/{id}", method = RequestMethod.GET)
    public Workout getWorkoutById(@PathVariable int id) {
        return workoutDao.getWorkoutById(id);
    }

//    Not sure how URL should look with the path variable so couldn't test
//    @RequestMapping(path = "/v1/workouts/name", method = RequestMethod.GET)
//    public Workout getWorkoutByName(@PathVariable String name) {
//        return workoutDao.getWorkoutByName(name);
//    }
    @RequestMapping(path = "/v1/workouts/target/{target}", method = RequestMethod.GET)
    public List<Workout> listWorkoutsByTarget(@PathVariable String target) {
        return workoutDao.listWorkoutsByTarget(target);
    }
//TODO:Add /{id} to the end of then path? update accordingly in the workoutService in vue
    @RequestMapping(path = "/v1/workouts/user", method = RequestMethod.GET)
    public List<Workout> listWorkoutsByUser(int id) {
        return workoutDao.listWorkoutsByUser(id);
    }

    //TODO: Maybe change to getWorkoutByLength and add length as a parameter? update accordingly in the workoutService in vue
    @RequestMapping(path = "/v1/workouts/length", method = RequestMethod.GET)
    public List<Workout> listWorkoutsByLength() {
        return workoutDao.listWorkoutsByLength();
    }

    @RequestMapping(path = "/v1/workouts/completed", method = RequestMethod.GET)
    public List<Workout> listCompletedWorkouts(int id) {
        return workoutDao.listCompletedWorkouts(id);


    }

    @RequestMapping(path = "/v1/workout", method = RequestMethod.POST)
    public Workout generateWorkout(@RequestBody Workout workout) {
        return workoutDao.generateWorkout(workout);

    }

    @RequestMapping(path = "/v1/workout/{workoutId}/{exerciseId}", method = RequestMethod.POST)
    public void addExerciseToWorkout(@PathVariable int workoutId, @PathVariable int exerciseId){
        workoutDao.addExerciseToWorkout(workoutId, exerciseId);
    }

    //TODO: is it fine that the path for the bottom 2 methods is the same? update workoutservice in vue accordingly
    @RequestMapping(path = "/v1/workout/{id}", method = RequestMethod.PUT)
    public void updateWorkout(@RequestBody Workout workout, @PathVariable int id) {
        workoutDao.updateWorkout(workout);
    }

    @RequestMapping(path = "v1/workout/{id}", method = RequestMethod.DELETE)
    public void deleteWorkout(@PathVariable int id) {
        workoutDao.deleteWorkout(id);
    }

    @RequestMapping(path = "/v1/exercise/workout/{id}/complete", method = RequestMethod.PUT)
    public void setWorkoutComplete(Principal principal, @PathVariable int id) {
        workoutDao.setWorkoutComplete(id, principal.getName());
    }
    @RequestMapping(path = "/v1/exercise/workout/{id}/incomplete", method = RequestMethod.PUT)
    public void setWorkoutIncomplete(Principal principal, @PathVariable int id) {
        workoutDao.setWorkoutIncomplete(id, principal.getName());
    }

    @RequestMapping(path = "/v1/workout/add/{workoutId}", method = RequestMethod.POST)
    public void assignWorkoutToUser(Principal principal, @PathVariable int workoutId){
        workoutDao.assignWorkoutToUser(workoutId, principal.getName() );
    }

    @RequestMapping(path = "/assigned", method = RequestMethod.GET)
    public List<Workout> listAssignedWorkout(Principal principal){
       return workoutDao.listAssignedWorkout(principal.getName());
    }

    @RequestMapping(path = "/completed", method = RequestMethod.GET)
    public List<Workout> listWorkoutHistoryForUser(Principal principal){
        return workoutDao.listWorkoutHistoryForUser(principal.getName());
    }
}
