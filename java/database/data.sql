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
VALUES ('Hammer Curl', 'A hammer curl is a resistance exercise that primarily targets the brachialis muscle, which is located on the outer side of the upper arm, as well as the brachioradialis muscle, which runs along the forearm.',
'20', '10', '60', 'arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Skullcrushers', 'a weightlifting exercise that primarily targets the triceps muscles. In this exercise, you typically lie on a bench with your back flat, extend your arms vertically, and then bend your elbows to lower the weight (barbell or dumbbells) toward your forehead, hence the name "skull crushers." The movement resembles the crushing motion of a skull, but the key is to control the weight and focus on working the triceps for strength and muscle development.',
 '0', '10', '40', 'arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Close-grip bench press', 'The "Close-Grip Bench Press" is a weightlifting exercise that targets the triceps, chest, and shoulders. In this exercise, you use a barbell and grip it with your hands positioned closer together than in a regular bench press. This narrower hand placement places greater emphasis on the triceps, helping to build strength and muscle in the back of your arms. The movement involves lowering the barbell to your chest and then pushing it back up to the starting position, working the targeted muscle groups for upper body strength and development.',
 '15', '10', '40', 'arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Shoulder press', 'A fundamental weightlifting exercise that primarily targets the shoulder muscles. In this exercise, you typically stand or sit with a barbell or dumbbells at shoulder height and then push the weight directly overhead until your arms are fully extended. The shoulder press helps to develop strength and size in the deltoid muscles of the shoulders, as well as the triceps and upper chest. It is a key exercise in building upper body strength and achieving a well-rounded physique.',
 '20', '10', '60', 'arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Calf raises', 'calf raises DESCRIPTION', '20', '10', '80', 'legs');

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
VALUES ('Leg raises', 'Leg raises DESCRIPTION', '0', '10', '90', 'abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Plank', 'Plank DESCRIPTION', '0', '10', '60', 'abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bicycle crunches', 'Bicycle crunches DESCRIPTION', '0', '10', '60', 'abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Sit-up', 'Sit-up DESCRIPTION', '0', '10', '90', 'abs');

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
VALUES ('Rowing machine', 'Rowing machine DESCRIPTION', '0', '0', '90', 'cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Jump rope', 'Jump rope DESCRIPTION', '0', '0', '60', 'cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Jumping jack', 'Jumping jack DESCRIPTION', '0', '0', '80', 'cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Elliptical machine', 'Elliptical machine DESCRIPTION', '0', '0', '75', 'cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Exercise bike', 'Exercise bike DESCRIPTION', '0', '0', '60', 'cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Push ups', 'Push ups DESCRIPTION', '0', '10', '50', 'total body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Mountain climbers', 'Mountain climbers DESCRIPTION', '0', '20', '60', 'total body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Step ups', 'Step up DESCRIPTION', '0', '20', '60', 'total body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bodyweight Squat', 'Bodyweight squat DESCRIPTION', '0', '10', '70', 'total body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Jump Squat', 'Jump Squat DESCRIPTION', '0', '10', '90', 'total body');

--arms (2001 - 2005), legs (2006 - 2010),
-- abs (2011 2015), back (2016-2020), cardio (2021 - 2025), total body (2026 - 2030)

--WORKOUTS DATA
INSERT INTO workouts (isCompleted, name, description) VALUES (
    false,
    'Arms',
    'Forge formidable arms that command respect. Rise, embrace the weights, and conquer your limits. In each rep, you sculpt greatness. This workout is not a choice; it is destiny.'
);

INSERT INTO workouts (isCompleted, name, description) VALUES (
    true,
    'Legs',
    'Ignite your lower body. The iron bends, but you stand strong. With each squat, lunge, and lift, you carve the path to legendary strength. In this arena, you are not just training; you are rewriting your legacy.'
);

INSERT INTO workouts (isCompleted, name, description) VALUES (
    false,
    'Abs',
    'Discover the path to chiseled perfection with our intense ab workout. Unleash the hidden potential of your core as you sculpt a powerhouse midsection that commands attention. Brace yourself for a journey of sweat, strength, and six-pack satisfaction.'
);

INSERT INTO workouts (isCompleted, name, description) VALUES (
    false,
    'Back',
    'Unleash the power within as you embark on a journey to sculpt your back into a fortress of strength and definition. With every rep, you forge a path to greatness, each exercise a battle won in the epic quest for a powerful and chiseled back. Feel the burn, embrace the challenge, and conquer your limits, for in the crucible of the gym, legends are born.'
);

INSERT INTO workouts (isCompleted, name, description) VALUES (
    false,
    'Cardio',
    'Embark on a journey that ignites your inner warrior, as you conquer the miles and seize the rhythm of your heart. In the realm of the cardio battlefield, you will find endurance, strength, and the relentless pursuit of vitality. Let the sweat be your victory, and with every beat, sculpt a heart of steel that echoes with the anthem of life itself.'
);

INSERT INTO workouts (isCompleted, name, description) VALUES (
    true,
    'Full Body',
    'Enter the crucible of transformation, where every muscle becomes a weapon, and strength knows no bounds. In the arena of the total body workout, you will forge a physique of mythic proportions, sculpting your destiny with iron and determination. From head to toe, you rise as a titan of fitness, ready to conquer any challenge that stands in your path.'
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

INSERT INTO user_workouts (user_id, workout_id) VALUES (
    1007,
    3006
);

-- USERS EXERCISES DATA
INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1003,
    2001
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1003,
    2002
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1003,
    2003
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1003,
    2004
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1003,
    2005
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1004,
    2006
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1004,
    2007
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1004,
    2008
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1004,
    2009
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1004,
    2010
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1005,
    2011
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1005,
    2012
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1005,
    2013
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1005,
    2014
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1005,
    2015
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1006,
    2016
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1006,
    2017
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1006,
    2018
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1006,
    2019
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1006,
    2020
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1007,
    2021
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1007,
    2022
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1007,
    2023
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1007,
    2024
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1007,
    2025
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1007,
    2026
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1007,
    2027
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1007,
    2028
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1007,
    2029
);

INSERT INTO user_exercises (trainer_id, exercise_id) VALUES (
    1007,
    2030
);

COMMIT TRANSACTION;

