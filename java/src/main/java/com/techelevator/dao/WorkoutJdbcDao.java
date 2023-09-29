package com.techelevator.dao;

import com.techelevator.model.Workout;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class WorkoutJdbcDao implements WorkoutDao {
    private JdbcTemplate jdbcTemplate;
    public WorkoutJdbcDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Workout> listWorkouts() {
        String sql = "SELECT * FROM workouts";
        List<Workout> workouts = new ArrayList<>();
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            Workout workout = mapRowToWorkout(results);
            workouts.add(workout);
        }

        return workouts;
    }

    @Override
    public Workout getWorkoutById(int id) {
        Workout workout = null;
        String sql = "SELECT * FROM workouts WHERE workout_id = ?";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if(results.next()){
                workout = mapRowToWorkout(results);
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        return workout;
    }

//    @Override
//    public Workout getWorkoutByName(String name) {
//        Workout workout = null;
//        name = name.toLowerCase();
//        String sql = "SELECT * FROM workouts WHERE name = ?";
//
//        try {
//            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, name);
//            if(results.next()) {
//                workout = mapRowToWorkout(results);
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
//        return workout;
//    }

    @Override
    public List<Workout> listWorkoutsByTarget(String target) {
        List<Workout> workouts = new ArrayList<>();
        String sql = "SELECT *\n" +
                "FROM workouts JOIN workout_exercises ON workouts.workout_id = workout_exercises.workout_id\n" +
                "\t\t\tJOIN exercises ON exercises.exercise_id = workout_exercises.exercise_id\n" +
                "WHERE exercises.target = ?;";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, target);
            while(results.next()) {
                Workout workout = mapRowToWorkout(results);
                workouts.add(workout);
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }
        return workouts;
    }

//    below method is for both users and trainers
    @Override
    public List<Workout> listWorkoutsByUser(int id) {
        List<Workout> workouts = new ArrayList<>();
        String sql = "SELECT *\n" +
                "FROM workouts JOIN user_workouts ON workouts.workout_id = user_workouts.workout_id\n" +
                              "JOIN users ON users.user_id = user_workouts.user_id\n" +
                "WHERE user_workouts.user_id = ? AND users.role = 'ROLE_TRAINER';";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            while(results.next()) {
                Workout workout = mapRowToWorkout(results);
                workouts.add(workout);
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }
        return workouts;
    }

//    Gets sum of exercise.expected_time_seconds.  Can adjust SQL query later if we want specific lengths
//    i.e. workouts shorter than 30 minutes.
    @Override
    public List<Workout> listWorkoutsByLength() {
        List<Workout> workouts = new ArrayList<>();
        String sql = "SELECT workouts.workout_id, workouts.name, SUM(exercises.expected_time_seconds * exercises.rep_count) AS workout_length " +
                      "FROM workouts JOIN workout_exercises ON workouts.workout_id = workout_exercises.workout_id " +
                                    "JOIN exercises ON workout_exercises.exercise_id = exercises.exercise_id " +
                      "GROUP BY workouts.workout_id " +
                      "HAVING SUM(exercises.expected_time_seconds) < ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, 10000);
            while(results.next()) {
                Workout workout = mapRowToWorkout(results);
                workouts.add(workout);
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        return workouts;
    }

    @Override
    public List<Workout> listCompletedWorkouts(int id) {
        List<Workout> workouts = new ArrayList<>();
        String sql = "SELECT *\n" +
                     "FROM workouts JOIN user_workouts ON workouts.workout_id = user_workouts.workout_id\n" +
                     "WHERE user_workouts.user_id = ? AND workouts.isCompleted IS true;";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            while(results.next()){
                Workout workout = mapRowToWorkout(results);
                workouts.add(workout);
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        return workouts;
    }

    @Override
    public Workout generateWorkout(Workout workout) {
        Workout newWorkout = null;
        String sql = "INSERT INTO workouts (name, description, isCompleted)" +
                     "VALUES (?, ?, ?) " +
                     "RETURNING workout_id";
        try {
            int newId = jdbcTemplate.update(sql, workout.getName(), workout.getDescription(), workout.isCompleted());
            newWorkout = getWorkoutById(newId);
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        return newWorkout;
    }

    @Override
    public Workout updateWorkout(Workout workout) {
        Workout newWorkout = new Workout();
        String sql = "UPDATE workouts " +
                     "SET name = ?, description = ?, isCompleted = ? " +
                     "WHERE workout_id = ?";

        try {
            int rows = jdbcTemplate.update(sql, workout.getName(), workout.getDescription(), workout.isCompleted(), workout.getWorkout_id());
            newWorkout = getWorkoutById(workout.getWorkout_id());
        } catch (CannotGetJdbcConnectionException e){
            throw new RuntimeException("Unable to contact the database!", e);
        } catch (BadSqlGrammarException e){
            throw new RuntimeException("Bad SQL query: " + e.getSql()
                    +"\n"+e.getSQLException(), e);
        } catch (DataIntegrityViolationException e){
            throw new RuntimeException("Database Integrity Violation", e);
        }

        return newWorkout;
    }

    @Override
    public boolean deleteWorkout(int id) {
        boolean deleted = false;
        String sql = "DELETE FROM workouts WHERE workout_id = ?;";
        String sql2 = "DELETE FROM user_workouts WHERE workout_id = ?";
        String sql3 = "DELETE FROM workout_exercises WHERE workout_id = ?";

        try {
            int rows = jdbcTemplate.update(sql3, id);
            if(rows == 1) {
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
            int rows = jdbcTemplate.update(sql2, id);
            if(rows == 1) {
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
            int rows = jdbcTemplate.update(sql, id);
            if(rows == 1) {
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

    private Workout mapRowToWorkout(SqlRowSet results) {
        Workout workout = new Workout();
        int id = results.getInt("workout_id");
        String name = results.getString("name");
        String description = results.getString("description");
        boolean isCompleted = results.getBoolean("isCompleted");

        workout.setWorkout_id(id);
        workout.setName(name);
        workout.setDescription(description);
        workout.setCompleted(isCompleted);

        return workout;
    }
}
