CREATE TABLE workout_history (
    workout_history_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    workout_id INT NOT NULL,
    date_completed DATE NOT NULL,
    minutes_spent INT NOT NULL,
    exercises_count INT NOT NULL,
    focus_area VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (workout_id) REFERENCES workouts(workout_id)
);