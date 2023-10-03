package com.techelevator.model;

import java.time.LocalDate;

public class WorkoutHistory {

    private int workoutHistoryId;
    private int userId;
    private int workoutId;
    private LocalDate dateCompleted;
    private int minutesSpent;
    private int exercisesCount;
    private String focusArea;

    // Getters and Setters

    public int getWorkoutHistoryId() {
        return workoutHistoryId;
    }

    public void setWorkoutHistoryId(int workoutHistoryId) {
        this.workoutHistoryId = workoutHistoryId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getWorkoutId() {
        return workoutId;
    }

    public void setWorkoutId(int workoutId) {
        this.workoutId = workoutId;
    }

    public LocalDate getDateCompleted() {
        return dateCompleted;
    }

    public void setDateCompleted(LocalDate dateCompleted) {
        this.dateCompleted = dateCompleted;
    }

    public int getMinutesSpent() {
        return minutesSpent;
    }

    public void setMinutesSpent(int minutesSpent) {
        this.minutesSpent = minutesSpent;
    }

    public int getExercisesCount() {
        return exercisesCount;
    }

    public void setExercisesCount(int exercisesCount) {
        this.exercisesCount = exercisesCount;
    }

    public String getFocusArea() {
        return focusArea;
    }

    public void setFocusArea(String focusArea) {
        this.focusArea = focusArea;
    }
}


