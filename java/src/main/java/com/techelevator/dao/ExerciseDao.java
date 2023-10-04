package com.techelevator.dao;

import com.techelevator.model.Exercise;

import java.security.Principal;
import java.util.List;

public interface ExerciseDao {
    List<Exercise> getAllExercises();
    void addExercise(Exercise exercise);
    Exercise getExerciseById(int id);
//    Exercise getExerciseByName(String name);
    List<Exercise> getExerciseByTarget(String target);
    List<Exercise> getExercisesByUser(int userId);
    List<Exercise> getExercisesByWorkout(int workoutId);
    Exercise createExercise(Exercise exercise, String username);
    Exercise editExercise(Exercise exercise, int exerciseId);
    boolean deleteExercise(int exerciseId);
    int findIdByUsername(String username);
    boolean deleteExerciseFromWorkout(int exerciseId);

}
