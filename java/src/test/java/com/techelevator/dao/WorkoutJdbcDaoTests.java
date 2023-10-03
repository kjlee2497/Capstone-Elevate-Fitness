package com.techelevator.dao;

import com.techelevator.model.Exercise;
import com.techelevator.model.Workout;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

public class WorkoutJdbcDaoTests extends BaseDaoTests{

    protected static final Workout WORKOUT_1 = new Workout(3001, "workout1", "this is a workout", false);
    protected static final Workout WORKOUT_2 = new Workout(3002, "workout2", "this is a workout", false);
    protected static final Workout WORKOUT_3 = new Workout(3003, "workout3", "this is a workout", true);

    private WorkoutJdbcDao sut;

    @Before
    public void setup() {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        sut = new WorkoutJdbcDao(jdbcTemplate);
    }

    @Test
    public void getWorkoutByIdTest(){
        Workout test = sut.getWorkoutById(WORKOUT_1.getWorkout_id());
        int actualId = test.getWorkout_id();

        int expectedId = WORKOUT_1.getWorkout_id();

        Assert.assertEquals(expectedId, actualId);

        Workout test2 = sut.getWorkoutById(WORKOUT_2.getWorkout_id());
        int actualId2 = test2.getWorkout_id();

        int expectedId2 = WORKOUT_2.getWorkout_id();


        Assert.assertEquals(expectedId2, actualId2);

    }



}
