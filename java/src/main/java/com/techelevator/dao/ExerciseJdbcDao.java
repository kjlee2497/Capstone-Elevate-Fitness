package com.techelevator.dao;


import com.techelevator.model.Exercise;
import com.techelevator.model.User;
import com.techelevator.model.Workout;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Component
public class ExerciseJdbcDao implements ExerciseDao {

    private JdbcTemplate jdbcTemplate;
    public ExerciseJdbcDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
        }
    @Override
    public List<Exercise> getAllExercises() {
        String sql = "SELECT * FROM exercises";
        List<Exercise> exercises = new ArrayList<>();
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Exercise exercise = mapRowToExercise(results);

            exercises.add(exercise);
        }
        return exercises;
    }

    @Override
    public void addExercise(Exercise exercise) {
       String sql = "INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target) VALUES ( ?, ?, ?, ?, ?, ?)";
       jdbcTemplate.update(sql, exercise.getName(), exercise.getDescription(), exercise.getWeight(), exercise.getRepCount(), exercise.getExpectedTime(), exercise.getTarget());
    }
    @Override
    public Exercise getExerciseById(int id) {
    Exercise exercise  = null;
    String sql = "SELECT * FROM exercises WHERE exercise_id = ?";

    try {
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        if(results.next()){
            exercise = mapRowToExercise(results);
        }
    } catch (CannotGetJdbcConnectionException e){
        throw new RuntimeException("Unable to contact the database!", e);
    } catch (BadSqlGrammarException e){
        throw new RuntimeException("Bad SQL query: " + e.getSql()
                +"\n"+e.getSQLException(), e);
    } catch (DataIntegrityViolationException e){
        throw new RuntimeException("Database Integrity Violation", e);
    }

    if (exercise == null) throw new IllegalArgumentException("This exercise_id does not exist");
    return exercise;
}

//    @Override
//    public Exercise getExerciseByName(String name) {
//        Exercise exercise = new Exercise();
//        String sql = "SELECT * FROM exercises WHERE name = ?";
//
//        try {
//            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, name);
//            if(results.next()) {
//                exercise = mapRowToExercise(results);
//            }
//        } catch (CannotGetJdbcConnectionException e){
//            throw new RuntimeException("Unable to contact the database!", e);
//        } catch (BadSqlGrammarException e){
//            throw new RuntimeException("Bad SQL query: " + e.getSql()
//                    +"\n"+e.getSQLException(), e);
//        } catch (DataIntegrityViolationException e){
//            throw new RuntimeException("Database Integrity Violation", e);
//        }
//
//        return exercise;
//    }

    @Override
    public List<Exercise> getExerciseByTarget(String target) {
        int check = 0;
        List<Exercise> exercises = new ArrayList<>();
        target = target.toLowerCase();
        String sql = "SELECT * FROM exercises WHERE target = ?";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, target);

            while(results.next()) {
                Exercise exercise = mapRowToExercise(results);
                exercises.add(exercise);
                check++;
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        if (check == 0) throw new IllegalArgumentException("This target does not exist");
        return exercises;
    }

    @Override
    public List<Exercise> getExercisesByUser(int userId) {
        int check = 0;
        List<Exercise> exercises = new ArrayList<>();
        String sql = "SELECT *\n" +
                "FROM exercises JOIN user_exercises ON exercises.exercise_id = user_exercises.exercise_id\n" +
                "WHERE trainer_id = ?;";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            while(results.next()) {
                Exercise exercise = mapRowToExercise(results);
                exercises.add(exercise);
                check++;
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        if (check == 0) throw new IllegalArgumentException("This user does not exist");
        return exercises;
    }

    @Override
    public List<Exercise> getExercisesByWorkout(int workoutId) {
        int check = 0;
        List<Exercise> exercises = new ArrayList<>();
        String sql = "SELECT *\n" +
                "FROM exercises JOIN workout_exercises ON exercises.exercise_id = workout_exercises.exercise_id\n" +
                "WHERE workout_id = ?;";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, workoutId);
            while(results.next()) {
                Exercise exercise = mapRowToExercise(results);
                exercises.add(exercise);
                check++;
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        if (check == 0) throw new IllegalArgumentException("This workout does not exist");
        return exercises;
    }

    @Override
    public int findIdByUsername(String username) {
        if (username == null) throw new IllegalArgumentException("Username cannot be null");

        int userId;
        try {
            userId = jdbcTemplate.queryForObject("select user_id from users where username = ?", int.class, username);
        } catch (EmptyResultDataAccessException e) {
            throw new UsernameNotFoundException("User " + username + " was not found.");
        }

        return userId;
    }

    @Override
    public boolean deleteExerciseFromWorkout(int exerciseId) {
        boolean deleted = false;
        String sql = "DELETE FROM workout_exercises WHERE exercise_id = ?";

        try {
            int rowsDeleted = jdbcTemplate.update(sql, exerciseId);
            if(rowsDeleted == 1) {
                deleted = true;
            } else {
                deleted = false;
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        return deleted;
    }


    @Override
    public Exercise createExercise(Exercise exercise, String username) {

        String sql = "INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target) VALUES ( ?, ?, ?, ?, ?, ?) RETURNING exercise_id";
        int trainerId = findIdByUsername(username);

        try {
            int newId = jdbcTemplate.queryForObject(sql, int.class, exercise.getName(), exercise.getDescription(), exercise.getWeight(), exercise.getRepCount(), exercise.getExpectedTime(), exercise.getTarget());
            exercise = getExerciseById(newId);


            addTrainerExercise(trainerId, newId);

        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        return exercise;
    }

    @Override
    public Exercise editExercise(Exercise exercise, int exerciseId) {
        Exercise editedExercise = new Exercise();
//        String sql = "UPDATE exercises " +
//                "SET exercise_name = ?, description = ?, suggested_weight_lbs = ?, rep_count = ?, expected_time_seconds = ?, target = ? " +
//                "WHERE exercise_id = ?";
        exercise.setExercise_id(exerciseId);
        String sql = "UPDATE exercises SET exercise_name = ?, description = ?, suggested_weight_lbs = ?, rep_count = ?, expected_time_seconds = ?, target = ? WHERE exercise_id = ?";

        try {
            jdbcTemplate.update(sql, exercise.getName(), exercise.getDescription(), exercise.getWeight(), exercise.getRepCount(), exercise.getExpectedTime(), exercise.getTarget(), exercise.getExercise_id());

        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        return exercise;
    }

    @Override
    public boolean deleteExercise(int id) {
        boolean deleted = false;
        String sql = "DELETE FROM user_exercises WHERE exercise_id = ?";
        String sql2 = "DELETE FROM workout_exercises WHERE exercise_id = ?";
        String sql3 = "DELETE FROM exercises WHERE exercise_id = ?";

        try {
            int rowsDeleted = jdbcTemplate.update(sql, id);
            if(rowsDeleted == 1) {
                deleted = true;
            } else {
                deleted = false;
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        try {
            int rowsDeleted = jdbcTemplate.update(sql2, id);
            if(rowsDeleted == 1) {
                deleted = true;
            } else {
                deleted = false;
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        try {
            int rowsDeleted = jdbcTemplate.update(sql3, id);
            if(rowsDeleted == 1) {
                deleted = true;
            } else {
                deleted = false;
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        return deleted;
    }

    private void addTrainerExercise(int trainerId, int exerciseId){

        String sql = "INSERT INTO user_exercises(trainer_id, exercise_id) VALUES(?,?)";

        try {
            jdbcTemplate.update(sql,trainerId, exerciseId);

        }catch (CannotGetJdbcConnectionException e){
        throw new RuntimeException("Unable to contact the database!", e);
    } catch (BadSqlGrammarException e){
        throw new RuntimeException("Bad SQL query: " + e.getSql()
                +"\n"+e.getSQLException(), e);
    } catch (DataIntegrityViolationException e){
        throw new RuntimeException("Database Integrity Violation", e);
    }

    }

    private Exercise mapRowToExercise(SqlRowSet results) {
        Exercise exercise = new Exercise();
        int id = results.getInt("exercise_id");
        String name = results.getString("exercise_name");
        String desc = results.getString("description");
        int weight = results.getInt("suggested_weight_lbs");
        int repCount = results.getInt("rep_count");
        int seconds = results.getInt("expected_time_seconds");
        String target = results.getString("target");

        exercise.setExercise_id(id);
        exercise.setName(name);
        exercise.setDescription(desc);
        exercise.setWeight(weight);
        exercise.setRepCount(repCount);
        exercise.setExpectedTime(seconds);
        exercise.setTarget(target);

        return exercise;
    }
}
