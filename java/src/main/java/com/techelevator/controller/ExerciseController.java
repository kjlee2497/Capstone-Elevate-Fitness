package com.techelevator.controller;


import com.techelevator.dao.ExerciseDao;
import com.techelevator.model.Exercise;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.stylesheets.LinkStyle;

import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class ExerciseController {
    @Autowired
    ExerciseDao exerciseDao;

    @RequestMapping(path = "/exercises", method = RequestMethod.GET)
    public List<Exercise> getAllExercises(){
        return exerciseDao.getAllExercises();
    }

    @RequestMapping(path = "/exercise/id/{exerciseId}", method = RequestMethod.GET)
    public Exercise getExerciseById(@PathVariable int exerciseId) {
        return exerciseDao.getExerciseById(exerciseId);
    }

    @RequestMapping(path = "/exercise/add", method = RequestMethod.POST)
    public void addExercise(@RequestBody Exercise exercise){ //@Valid?
        exerciseDao.addExercise(exercise);
    }



//    @RequestMapping(path = "/v1/exercise/name", method = RequestMethod.GET)
//    public Exercise getExerciseByName(String name) {
//        return exerciseDao.getExerciseByName(name);
//    }

    @RequestMapping(path = "/exercise/target/{target}", method = RequestMethod.GET)
    public List<Exercise> getExerciseByTarget(@PathVariable String target)  {
        return exerciseDao.getExerciseByTarget(target);
    }

    @RequestMapping(path = "/exercises/user/{userId}", method = RequestMethod.GET)
    public List<Exercise> getExercisesByUser(@PathVariable int userId)  {
        return exerciseDao.getExercisesByUser(userId);
    }

    @RequestMapping(path = "/exercises/workout/{workoutId}", method = RequestMethod.GET)
    public List<Exercise> getExercisesByWorkout(@PathVariable int workoutId)  {
        return exerciseDao.getExercisesByWorkout(workoutId);
    }

    @RequestMapping(path = "/exercise/generate", method = RequestMethod.POST)
    public void createExercise(Exercise exercise)  {
        exerciseDao.createExercise(exercise);
    }

    @RequestMapping(path = "/exercise/id/{exerciseId}", method = RequestMethod.PUT)
    public void editExercise(Exercise exercise, @PathVariable int exerciseId)  {
        exerciseDao.editExercise(exercise, exerciseId);
    }

    @RequestMapping(path = "/exercise/id/{exerciseId}", method = RequestMethod.DELETE)
    public void deleteExercise(@PathVariable int exerciseId)  {
        exerciseDao.deleteExercise(exerciseId);
    }

}
