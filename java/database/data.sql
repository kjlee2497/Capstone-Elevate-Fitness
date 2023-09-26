BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('kevin', '$2a$10$Q7v41gLln/w3WG/gXp6JWes5PcmGphkTC0Qdo2sxto4bnBKDTHomq', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('joshua','$2a$10$YiwZQ31wxF03AKBPByXJeOP/xJeDbf2oPrYIrnVjjJKzSLkHWAhZq', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('jose','$2a$10$gPzzMX6n6Wu86GZxy41DBeXgCZL9oeWrNABgFvmYuCgukTA6ZBhFC', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('alejandro', '$2a$10$kEvamjfY0ju9Hme4llBH2eJ0KWbqP/QrK0B7WrSe14zGfr5uvXXlq', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('caroline', '$2a$10$VmhtTJg3l9WMi2tXNMUQpe0oT4tpZNUfPCLhk0YXgxHIQdcDOya22', 'ROLE_TRAINER');



-- exercises data
INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bicep Curl', 'A bicep curl is a popular strength-training exercise that primarily targets the biceps brachii muscle group, which is located in the front of the upper arm.',
'20', '10', '60', 'arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Hammer Curl', 'A hammer curl is a resistance exercise that primarily targets the brachialis muscle, which is located on the outer side of the upper arm, as well as the brachioradialis muscle, which runs along the forearm.' ,
'20', '10', '60', 'arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Skullcrushers', 'skullcrushers DESCRIPTION', '0', '10', '60', 'arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Close-grip bench press', 'Close-grip bench press DESCRIPTION', '15', '10', '60', 'arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Shoulder press', 'shoulder press DESCRIPTION', '20', '10', '60', 'arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Calf raises', 'calf raises DESCRIPTION', '20', '10', '60', 'legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Squat', 'squat DESCRIPTION', '65', '10', '60', 'legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Romanian deadlift', 'Romanian deadlift DESCRIPTION', '65', '10', '60', 'legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Lunge', 'Lunge DESCRIPTION', '15', '10', '60', 'legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Leg Press', 'Leg Press DESCRIPTION', '60', '10', '60', 'legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Russian twists', 'Russian twists DESCRIPTION', '65', '10', '60', 'abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Leg raises', 'Leg raises DESCRIPTION', '0', '10', '60', 'abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Plank', 'Plank DESCRIPTION', '0', '10', '60', 'abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bicycle crunches', 'Bicycle crunches DESCRIPTION', '0', '10', '60', 'abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Sit-up', 'Sit-up DESCRIPTION', '0', '10', '60', 'abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bent-over row', 'Bent-over row DESCRIPTION', '65', '10', '60', 'back');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Deadlift', 'Deadlift DESCRIPTION', '65', '10', '60', 'back');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bent over dumbbell row', 'bent over dumbbell row DESCRIPTION', '20', '10', '60', 'back');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Single arm dumbbell row', 'Single arm dumbbell row DESCRIPTION', '20', '10', '60', 'back');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Renegade row', 'Renegade row DESCRIPTION', '20', '10', '60', 'back');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Rowing machine', 'Rowing machine DESCRIPTION', '0', '0', '60', 'cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Jump rope', 'Jump rope DESCRIPTION', '0', '0', '60', 'cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Jumping jack', 'Jumping jack DESCRIPTION', '0', '0', '60', 'cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Elliptical machine', 'Elliptical machine DESCRIPTION', '0', '0', '60', 'cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Exercise bike', 'Exercise bike DESCRIPTION', '0', '0', '60', 'cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Push ups', 'Push ups DESCRIPTION', '0', '10', '60', 'total body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Mountain climbers', 'Mountain climbers DESCRIPTION', '0', '20', '60', 'total body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Step ups', 'Step up DESCRIPTION', '0', '20', '60', 'total body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bodyweight Squat', 'Bodyweight squat DESCRIPTION', '0', '10', '60', 'total body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Jump Squat', 'Jump Squat DESCRIPTION', '0', '10', '60', 'total body');

--arms (2001 - 2005), legs (2006 - 2010),
-- abs (2011 2015), back (2016-2020), cardio (2021 - 2025), total body (2026 - 2030)

--WORKOUTS DATA
INSERT INTO workouts (isCompleted, name, description) VALUES (
    false,
    'Tone your Arms',
    'this is an arm workout'
);

INSERT INTO workouts (isCompleted, name, description) VALUES (
    true,
    'Tone your Legs',
    'this is a leg workout'
);

INSERT INTO workouts (isCompleted, name, description) VALUES (
    false,
    '6 Pack Shortcuts',
    'this is an ab workout'
);

INSERT INTO workouts (isCompleted, name, description) VALUES (
    false,
    'Back Routine',
    'this is a back workout'
);

INSERT INTO workouts (isCompleted, name, description) VALUES (
    false,
    'Heart Racer',
    'this is a cardio workout'
);

INSERT INTO workouts (isCompleted, name, description) VALUES (
    true,
    'Full Body Til You Cry',
    'this is a full body workout'
);

--WORKOUT_EXERCISES TABLE DATA

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3001,
    2001
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3001,
    2002
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3001,
    2003
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3001,
    2004
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3001,
    2005
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3002,
    2006
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3002,
    2007
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3002,
    2008
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3002,
    2009
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3002,
    2010
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3003,
    2011
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3003,
    2012
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3003,
    2013
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3003,
    2014
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3003,
    2015
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3004,
    2016
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3004,
    2017
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3004,
    2018
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3004,
    2019
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3004,
    2020
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3005,
    2021
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3005,
    2022
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3005,
    2023
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3005,
    2024
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3005,
    2025
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3006,
    2026
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3006,
    2027
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3006,
    2028
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3006,
    2029
);

INSERT INTO workout_exercises (workout_id, exercise_id) VALUES (
    3006,
    2030
);


--WORKOUTS DATA
INSERT INTO user_workouts (user_id, workout_id) VALUES (
    1003,
    3001
);

INSERT INTO user_workouts (user_id, workout_id) VALUES (
    1004,
    3002
);

INSERT INTO user_workouts (user_id, workout_id) VALUES (
    1005,
    3003
);

INSERT INTO user_workouts (user_id, workout_id) VALUES (
    1006,
    3004
);

INSERT INTO user_workouts (user_id, workout_id) VALUES (
    1007,
    3005
);

COMMIT TRANSACTION;

