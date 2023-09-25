package com.techelevator.model;

public class Exercise {

    private int exercise_id;
    private String name;
    private String description;
    private int weight;
    private int repCount;
    private int expectedTime;
    private String target;

    public Exercise() {
    }

    public Exercise(int exercise_id, String name, String description, int weight, int repCount, int expectedTime, String target) {
        this.exercise_id = exercise_id;
        this.name = name;
        this.description = description;
        this.weight = weight;
        this.repCount = repCount;
        this.expectedTime = expectedTime;
        this.target = target;
    }

    public Exercise(String name, String description, int weight, int repCount, int expectedTime, String target) {
        this.name = name;
        this.description = description;
        this.weight = weight;
        this.repCount = repCount;
        this.expectedTime = expectedTime;
        this.target = target;
    }

    public int getExercise_id() {
        return exercise_id;
    }

    public void setExercise_id(int exercise_id) {
        this.exercise_id = exercise_id;
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

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getRepCount() {
        return repCount;
    }

    public void setRepCount(int repCount) {
        this.repCount = repCount;
    }

    public int getExpectedTime() {
        return expectedTime;
    }

    public void setExpectedTime(int expectedTime) {
        this.expectedTime = expectedTime;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }
}

