package com.techelevator.dao;

import com.techelevator.model.Workout;
import com.techelevator.model.WorkoutHistory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcWorkoutHistoryDao implements WorkoutHistoryDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcWorkoutHistoryDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void addWorkoutHistory(WorkoutHistory workoutHistory) {
        String sql = "INSERT INTO workout_history (user_id, workout_id, date_completed, minutes_spent, " +
                "exercises_count, focus_area) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                workoutHistory.getUserId(),
                workoutHistory.getWorkoutId(),
                workoutHistory.getDateCompleted(),
                workoutHistory.getMinutesSpent(),
                workoutHistory.getExercisesCount(),
                workoutHistory.getFocusArea());
    }

    @Override
    public List<WorkoutHistory> getWorkoutHistoryByUserId(int userId) {
        List<WorkoutHistory> workoutHistoryList = new ArrayList<>();
        String sql = "SELECT * FROM workout_history WHERE user_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            WorkoutHistory workoutHistory = mapRowToWorkoutHistory(results);
            workoutHistoryList.add(workoutHistory);
        }
        return workoutHistoryList;
    }


    @Override
    public WorkoutHistory getWorkoutHistoryById(int workoutHistoryId) {
        String sql = "SELECT * FROM workout_history WHERE workout_history_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, workoutHistoryId);
        if (result.next()) {
            return mapRowToWorkoutHistory(result);
        } else {
            return null;
        }
    }


    private WorkoutHistory mapRowToWorkoutHistory(SqlRowSet rs) {
        WorkoutHistory workoutHistory = new WorkoutHistory();
        workoutHistory.setWorkoutHistoryId(rs.getInt("workout_history_id"));
        workoutHistory.setUserId(rs.getInt("user_id"));
        workoutHistory.setWorkoutId(rs.getInt("workout_id"));
        workoutHistory.setDateCompleted(rs.getDate("date_completed").toLocalDate());
        workoutHistory.setMinutesSpent(rs.getInt("minutes_spent"));
        workoutHistory.setExercisesCount(rs.getInt("exercises_count"));
        workoutHistory.setFocusArea(rs.getString("focus_area"));
        return workoutHistory;
    }
}

