package com.techelevator.controller;

import com.techelevator.dao.WorkoutDao;
import com.techelevator.model.Workout;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping(path = "/v1/workouts/user", method = RequestMethod.GET)
    public List<Workout> listWorkoutsByUser(int id) {
        return workoutDao.listWorkoutsByUser(id);
    }
    @RequestMapping(path = "/v1/workouts/length", method = RequestMethod.GET)
    public List<Workout> listWorkoutsByLength() {
        return workoutDao.listWorkoutsByLength();
    }

    @RequestMapping(path = "/v1/workouts/completed", method = RequestMethod.GET)
    public List<Workout> listCompletedWorkouts(int id) {
        return workoutDao.listCompletedWorkouts(id);
    }

    @RequestMapping(path = "/v1/workout", method = RequestMethod.POST)
    public void generateWorkout(@RequestBody Workout workout) {
        workoutDao.generateWorkout(workout);
    }

    @RequestMapping(path = "/v1/workout/{id}", method = RequestMethod.PUT)
    public void updateWorkout(@RequestBody Workout workout, @PathVariable int id) {
        workoutDao.updateWorkout(workout);
    }

    @RequestMapping(path = "v1/workout/{id}", method = RequestMethod.DELETE)
    public void deleteWorkout(@PathVariable int id) {
        workoutDao.deleteWorkout(id);
    }
}
