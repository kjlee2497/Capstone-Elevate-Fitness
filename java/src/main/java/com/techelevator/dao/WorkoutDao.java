package com.techelevator.dao;

import com.techelevator.model.Exercise;
import com.techelevator.model.Workout;

import java.util.List;

public interface WorkoutDao {
    List<Workout> listWorkouts();
    Workout getWorkoutById(int id);
//    Workout getWorkoutByName(String name);

    List<Workout> listWorkoutsByTarget(String target);
    List<Workout> listWorkoutsByUser(int id);
    List<Workout> listWorkoutsByLength();
    List<Workout> listCompletedWorkouts(int id);
    Workout setWorkoutComplete(int workoutId);

    Workout generateWorkout(Workout workout);

    void addExerciseToWorkout(int workoutId, int exercisesId);
    Workout updateWorkout(Workout workout);
    boolean deleteWorkout(int id);

}
