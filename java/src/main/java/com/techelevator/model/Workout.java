package com.techelevator.model;

public class Workout {

    private int workout_id;
    private String name;
    private String description;
    private boolean isCompleted;


    public Workout() {
    }

    public Workout(String name, String description, boolean isCompleted) {
        this.name = name;
        this.description = description;
        this.isCompleted = isCompleted;
    }

    public Workout(int workout_id, String name, String description, boolean isCompleted) {
        this.workout_id = workout_id;
        this.name = name;
        this.description = description;
        this.isCompleted = isCompleted;
    }

    public int getWorkout_id() {
        return workout_id;
    }

    public void setWorkout_id(int workout_id) {
        this.workout_id = workout_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isCompleted() {
        return isCompleted;
    }

    public void setCompleted(boolean completed) {
        isCompleted = completed;
    }
}
