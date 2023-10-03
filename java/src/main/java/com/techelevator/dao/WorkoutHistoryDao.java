package com.techelevator.dao;

import com.techelevator.model.WorkoutHistory;

import java.util.List;

public interface WorkoutHistoryDao {

    void addWorkoutHistory(WorkoutHistory workoutHistory);

    List<WorkoutHistory> getWorkoutHistoryByUserId(int userId);

    WorkoutHistory getWorkoutHistoryById(int workoutHistoryId);
}
