package com.techelevator.model;

import java.time.LocalDate;

public class WorkoutHistory {

    private int id;
    private int userId;
    private LocalDate date;
    private int minutes;
    private int exerciseCount;
    private String focusArea;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getMinutes() {
        return minutes;
    }

    public void setMinutes(int minutes) {
        this.minutes = minutes;
    }

    public int getExerciseCount() {
        return exerciseCount;
    }

    public void setExerciseCount(int exerciseCount) {
        this.exerciseCount = exerciseCount;
    }

    public String getFocusArea() {
        return focusArea;
    }

    public void setFocusArea(String focusArea) {
        this.focusArea = focusArea;
    }

    public void setDateCompleted(LocalDate date_completed) {
    }

    public void setWorkoutHistoryId(long workout_history_id) {
    }

    public void setWorkoutId(long workout_id) {
    }

    public void setMinutesSpent(int minutes_spent) {
    }

    public void setExercisesCount(int exercises_count) {
    }

    public Object getWorkoutId() {
        return null;
    }

    public Object getDateCompleted() {
        return null;
    }

    public Object getMinutesSpent() {
        return null;
    }

    public Object getExercisesCount() {
        return null;
    }
}


