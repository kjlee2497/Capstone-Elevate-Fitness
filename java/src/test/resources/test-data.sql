BEGIN TRANSACTION;
--Users--------------------------------------------------------------------------
INSERT INTO users (username,password_hash,role) VALUES ('trainer','user1','ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('user2','user2','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('user3','user3','ROLE_USER');



--Exercises--------------------------------------------------------------------------
INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('exercise1', 'description', '10', '5', '100', 'arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('exercise2', 'description', '5', '1', '25', 'legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('exercise3', 'description', '100', '20', '10', 'legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('exercise4', 'description', '1', '1', '1', 'back');

--Workouts--------------------------------------------------------------------------

INSERT INTO workouts (isCompleted, name, description) VALUES (
    false,
    'workout1',
    'this is a workout'
);
INSERT INTO workouts (isCompleted, name, description) VALUES (
    false,
    'workout2',
    'this is a workout'
);
INSERT INTO workouts (isCompleted, name, description) VALUES (
    true,
    'workout3',
    'this is a workout'
);

----------------------------------------------------------------------------

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1001,
    2001
);
INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1002,
    2002
);
INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1002,
    2003
);

----------------------------------------------------------------------------

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3001,
    2001
);
INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3001,
    2002
);
INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3002,
    2003
);



COMMIT TRANSACTION;
