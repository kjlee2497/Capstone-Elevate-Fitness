package com.techelevator.dao;


import com.techelevator.model.Exercise;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class ExerciseJdbcDao implements ExerciseDao {

    private JdbcTemplate jdbcTemplate;
    public ExerciseJdbcDao(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
        }
    @Override
    public List<Exercise> getAllExercises() {
        String sql = "SELECT * FROM exercises";
        List<Exercise> exercises = new ArrayList<>();
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Exercise exercise = new Exercise();
            exercise.setExercise_id(results.getInt("exercise_id"));
            exercise.setName(results.getString("exercise_name"));
            exercise.setDescription(results.getString("description"));
            exercise.setWeight(results.getInt("suggested_weight_lbs"));
            exercise.setRepCount(results.getInt("rep_count"));
            exercise.setExpectedTime(results.getInt("expected_time_seconds"));
            exercise.setTarget(results.getString("target"));

            exercises.add(exercise);
        }
        return exercises;
    }

    @Override
    public void addExercise(Exercise exercise) {
       String sql = "INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target) VALUES ( ?, ?, ?, ?, ?, ?)";
       jdbcTemplate.update(sql, exercise.getName(), exercise.getDescription(), exercise.getWeight(), exercise.getRepCount(), exercise.getExpectedTime(), exercise.getTarget());
    }


}
