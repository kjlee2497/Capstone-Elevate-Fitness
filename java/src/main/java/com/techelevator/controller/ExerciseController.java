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
   private ExerciseDao exerciseDao;

    @RequestMapping(path = "/exercise", method = RequestMethod.GET)
    public List<Exercise> getAllExercises(){
        return exerciseDao.getAllExercises();
    }

    @RequestMapping(path = "/exercise/add", method = RequestMethod.POST)
    public void addExercise(@RequestBody Exercise exercise){ //@Valid?
        exerciseDao.addExercise(exercise);
    }
}
