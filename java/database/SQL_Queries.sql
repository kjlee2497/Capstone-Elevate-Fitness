SELECT * FROM users;
SELECT * FROM workouts;
SELECT * FROM exercises;
SELECT * FROM users_info;
SELECT * FROM trainer_workouts;
SELECT * FROM workout_exercises;

-- Search for Workouts by User/Trainer
SELECT *
FROM workouts JOIN user_workouts ON workouts.workout_id = user_workouts.workout_id
WHERE user_workouts.user_id = 1003;


-- Search for completed workouts by user
SELECT *
FROM workouts JOIN user_workouts ON workouts.workout_id = user_workouts.workout_id
WHERE user_workouts.user_id = 1004 AND workouts.isCompleted IS true;


-- Search for Trainer workouts
SELECT *
FROM workouts JOIN user_workouts ON workouts.workout_id = user_workouts.workout_id
			JOIN users ON users.user_id = user_workouts.user_id
WHERE user_workouts.user_id = 1003AND users.role = 'ROLE_TRAINER';


-- Search for Workouts by exercise target
SELECT *
FROM workouts JOIN workout_exercises ON workouts.workout_id = workout_exercises.workout_id
			JOIN exercises ON exercises.exercise_id = workout_exercises.exercise_id
WHERE exercises.target = 'back';


-- Search for Workouts by workout length (sum of exercise time(seconds) * exercise rep count)
SELECT workouts.workout_id, workouts.name, SUM(exercises.expected_time_seconds * exercises.rep_count) AS workout_length
FROM workouts JOIN workout_exercises ON workouts.workout_id = workout_exercises.workout_id
				JOIN exercises ON workout_exercises.exercise_id = exercises.exercise_id
GROUP BY workouts.workout_id
HAVING SUM(exercises.expected_time_seconds) < 100000;