BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('Kevin', '$2a$10$Q7v41gLln/w3WG/gXp6JWes5PcmGphkTC0Qdo2sxto4bnBKDTHomq', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('Joshua','$2a$10$YiwZQ31wxF03AKBPByXJeOP/xJeDbf2oPrYIrnVjjJKzSLkHWAhZq', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('Jose','$2a$10$gPzzMX6n6Wu86GZxy41DBeXgCZL9oeWrNABgFvmYuCgukTA6ZBhFC', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('Alejandro', '$2a$10$kEvamjfY0ju9Hme4llBH2eJ0KWbqP/QrK0B7WrSe14zGfr5uvXXlq', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('Caroline', '$2a$10$VmhtTJg3l9WMi2tXNMUQpe0oT4tpZNUfPCLhk0YXgxHIQdcDOya22', 'ROLE_TRAINER');



-- exercises data
INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bicep Curl', 'A bicep curl is a popular strength-training exercise that primarily targets the biceps brachii muscle group, which is located in the front of the upper arm.',
'20', '10', '60', 'Arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Hammer Curl', 'A hammer curl is a resistance exercise that primarily targets the brachialis muscle, which is located on the outer side of the upper arm, as well as the brachioradialis muscle, which runs along the forearm.',
'20', '10', '60', 'Arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Skullcrushers', 'a weightlifting exercise that primarily targets the triceps muscles. In this exercise, you typically lie on a bench with your back flat, extend your arms vertically, and then bend your elbows to lower the weight (barbell or dumbbells) toward your forehead, hence the name "skull crushers." The movement resembles the crushing motion of a skull, but the key is to control the weight and focus on working the triceps for strength and muscle development.',
 '0', '10', '40', 'Arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Close-grip Bench Press', 'The "Close-Grip Bench Press" is a weightlifting exercise that targets the triceps, chest, and shoulders. In this exercise, you use a barbell and grip it with your hands positioned closer together than in a regular bench press. This narrower hand placement places greater emphasis on the triceps, helping to build strength and muscle in the back of your arms. The movement involves lowering the barbell to your chest and then pushing it back up to the starting position, working the targeted muscle groups for upper body strength and development.',
 '15', '10', '40', 'Arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Shoulder press', 'A fundamental weightlifting exercise that primarily targets the shoulder muscles. In this exercise, you typically stand or sit with a barbell or dumbbells at shoulder height and then push the weight directly overhead until your arms are fully extended. The shoulder press helps to develop strength and size in the deltoid muscles of the shoulders, as well as the triceps and upper chest. It is a key exercise in building upper body strength and achieving a well-rounded physique.',
 '20', '10', '60', 'Arms');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Calf Raises', 'Simple yet effective exercise that focuses on strengthening the calf muscles. Typically performed by standing with your feet flat on the ground and then raising your heels as high as possible by pushing through your toes, calf raises help target the gastrocnemius and soleus muscles in the lower leg. This exercise can be done with body weight alone or by adding resistance with weights or a machine, helping to improve calf strength, definition, and overall lower leg stability.',
 '20', '10', '80', 'Legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Squat', 'Fundamental lower-body exercise that involves bending your knees while keeping your back straight and lowering your body toward the ground. This movement engages the muscles in your thighs, hips, and buttocks, primarily targeting the quadriceps, hamstrings, and glutes. Squats are a versatile exercise and can be performed with various equipment, such as barbells, dumbbells, or just your body weight. They are an essential exercise for building lower body strength, stability, and overall functional fitness.',
 '65', '10', '60', 'Legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Romanian Deadlift', 'A weightlifting exercise that primarily targets the hamstrings and lower back. It involves holding a barbell or dumbbells in front of your thighs with a slight bend in the knees, then hinging at the hips to lower the weights toward the ground while keeping your back straight. The movement emphasizes the hamstrings and glutes, helping to build strength, stability, and flexibility in the posterior chain. It is an effective exercise for improving hip and hamstring mobility while also developing overall lower body strength.',
 '65', '10', '60', 'Legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Lunge', 'A dynamic lower body exercise that involves taking a step forward or backward with one leg while bending both knees to lower your body toward the ground. This movement engages various muscles, including the quadriceps, hamstrings, glutes, and calves, while also challenging balance and coordination. Lunges can be done with body weight alone or by adding weights for increased resistance, making them a versatile exercise for building lower body strength, endurance, and stability.',
 '15', '10', '60', 'Legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Leg Press', 'A weightlifting exercise performed on a specialized machine designed to target the lower body. In the leg press, you sit or lie on your back with your feet on a platform, then push the weight upwards by extending your legs. This exercise primarily engages the quadriceps, hamstrings, and glutes, helping to build strength and muscle in the legs. The leg press is an effective exercise for developing lower body power and can be adjusted to various fitness levels by adjusting the weight load on the machine.',
 '60', '10', '60', 'Legs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Russian Twists', 'A core-strengthening exercise performed by sitting on the floor, bending your knees, and leaning back slightly while keeping your back straight. You then twist your torso from side to side, bringing your hands or a weight across your body toward the floor. This movement targets the obliques and helps improve rotational core strength and stability. Russian twists can be done with body weight or by holding a weight or medicine ball, making them a versatile exercise for building a strong and balanced core.',
 '65', '10', '60', 'Abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Leg Raises', 'An exercise that involves lying flat on your back and lifting your legs off the ground. With your hands under your hips or by your sides for support, you raise your legs upward until they are perpendicular to the ground or as high as your flexibility allows. Leg raises primarily target the lower abdominal muscles and help to improve core strength and stability. This exercise can be performed on the floor or using an inclined bench for added challenge.',
 '0', '10', '90', 'Abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Plank', 'A core-strengthening exercise that involves holding a push-up-like position with your body in a straight line from head to heels. You support your weight on your forearms and toes, engaging your core muscles to maintain this static position. Planks help build core strength, stability, and endurance while also engaging the shoulders, back, and glutes. This exercise is highly effective for developing a strong and stable core, which is essential for overall functional fitness and posture.',
 '0', '10', '60', 'Abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bicycle Crunches', 'A dynamic core exercise where you lie on your back, lift your shoulders off the ground, and bring your opposite elbow towards your opposite knee while extending the other leg out. This mimics a pedaling motion, engaging your abdominal muscles, especially the obliques. Bicycle crunches are effective for strengthening the core, improving abdominal definition, and enhancing overall core stability and balance.',
 '0', '10', '60', 'Abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Sit-Up', 'An abdominal exercise where you start by lying on your back with your knees bent and feet flat on the ground. With your hands either crossed over your chest or behind your head, you engage your core muscles to lift your upper body off the ground and sit all the way up before lowering it back down. Sit-ups primarily target the rectus abdominis, commonly known as the "six-pack" muscles, and help to strengthen and tone the abdominal area.',
 '0', '10', '90', 'Abs');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bent-Over Row', 'A weightlifting exercise that targets the muscles of the upper back, particularly the lats, rhomboids, and rear deltoids. In this exercise, you bend at the hips to lean forward while keeping your back straight, then lift a barbell or dumbbells toward your lower ribcage, squeezing your shoulder blades together at the top of the movement. Bent-over rows are effective for building strength and muscle in the back and improving posture.',
 '65', '10', '60', 'Back');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Deadlift', 'A fundamental compound weightlifting exercise that involves lifting a loaded barbell or dumbbells from the ground to a standing position. In the deadlift, you maintain a straight back, hinge at the hips and knees to lower yourself down to the barbell, and then stand up while lifting the weight. This exercise targets multiple muscle groups, including the lower back, glutes, hamstrings, and traps. Deadlifts are renowned for their effectiveness in building overall strength, enhancing posture, and promoting functional fitness.',
 '65', '10', '60', 'Back');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bent Over Dumbbell Row', 'A weightlifting exercise in which you bend at the hips, keep your back flat, and hold a dumbbell in each hand. While in a slightly bent-over position, you pull the dumbbells towards your hips, squeezing your shoulder blades together at the top of the movement. This exercise primarily targets the muscles of the upper back, including the lats, rhomboids, and rear deltoids, while also engaging the biceps and lower back. Bent-over dumbbell rows are effective for building back strength, improving posture, and promoting upper body muscle development.', '20', '10', '60', 'Back');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Single Arm Dumbbell Row', 'An exercise where you stabilize yourself with one hand and knee on a bench, and with the other hand, you lift a dumbbell from the floor toward your hip while keeping your back straight. This exercise primarily targets the muscles of the upper back, such as the latissimus dorsi and rhomboids, and also engages the biceps and rear deltoids. Single-arm dumbbell rows are effective for building back strength, improving posture, and creating a balanced and well-developed upper body.',
 '20', '10', '60', 'Back');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Renegade Row', 'A challenging and dynamic full-body exercise performed with dumbbells. You start in a push-up position with a dumbbell in each hand and, while balancing on one arm, lift the other dumbbell off the ground, pulling it towards your hip. This exercise engages not only your upper body, particularly the back and shoulders, but also your core for stability. Renegade rows help improve strength, balance, and overall muscular endurance.',
 '20', '10', '60', 'Back');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Rowing Machine', 'When using a rowing machine, you sit on the seat, grip the handlebar, and push off with your legs while simultaneously pulling the handlebar toward your torso. This full-body workout engages muscles in the legs, back, shoulders, and arms, providing an effective cardiovascular and strength training exercise. Rowing machines are known for promoting cardiovascular health, improving endurance, and building overall body strength.',
 '0', '0', '90', 'Cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Jump Rope', ' A simple yet highly effective cardiovascular exercise. It involves swinging a rope over your head and under your feet while jumping over it with precise timing. Jumping rope engages your entire body, enhancing coordination, balance, and agility, while providing a superb cardiovascular workout. It is a versatile exercise suitable for various fitness levels and can be a fun way to boost endurance, burn calories, and improve overall fitness.',
 '0', '0', '60', 'Cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Jumping Jack', 'A classic and efficient bodyweight exercise. To perform a jumping jack, you start with your feet together and arms at your sides. Then, you jump while simultaneously spreading your legs apart and raising your arms overhead. Afterward, you return to the starting position with another jump, bringing your legs together and lowering your arms. Jumping jacks are a fantastic full-body exercise that elevates your heart rate, enhances cardiovascular fitness, and improves coordination. They are often used as part of warm-up routines or in high-intensity interval training (HIIT) workouts.',
 '0', '0', '80', 'Cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Elliptical Machine', 'When using an elliptical machine, you stand on the pedals and move your legs in an elliptical, or oval-shaped, motion while simultaneously holding onto the handlebars. This low-impact exercise provides a full-body cardiovascular workout, engaging the legs, glutes, arms, and upper body muscles. The elliptical machine is valued for its ability to deliver an effective, joint-friendly workout that enhances cardiovascular endurance, burns calories, and tones various muscle groups.',
 '0', '0', '75', 'Cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Exercise Bike', 'When using an exercise bike, you pedal the machine while adjusting resistance levels to simulate different cycling conditions. This low-impact cardio exercise targets the muscles in the legs and provides an effective workout for improving cardiovascular fitness, building leg strength, and burning calories. Exercise bikes are a popular choice for home workouts and gym cardio routines, offering a convenient and accessible way to achieve fitness goals.',
 '0', '0', '60', 'Cardio');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Push Ups', 'To perform a push-up, you start in a plank position with your hands placed slightly wider than shoulder-width apart and your body in a straight line from head to heels. You then lower your chest toward the ground by bending your elbows while keeping your body in a straight line, and then push back up to the starting position. Push-ups primarily work the chest, shoulders, triceps, and core muscles. They are a versatile exercise suitable for all fitness levels, helping to build upper body strength and improve overall muscular endurance.',
 '0', '10', '50', 'Total Body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Mountain Climbers', 'A dynamic and effective full-body exercise. To perform mountain climbers, you start in a plank position with your hands under your shoulders and your body in a straight line from head to heels. Then, you alternate bringing your knees towards your chest in a running-like motion while maintaining the plank position. This exercise engages the core, shoulders, chest, and leg muscles, providing a cardiovascular challenge and enhancing overall strength, endurance, and coordination. Mountain climbers are often incorporated into HIIT (High-Intensity Interval Training) routines and are great for building both strength and stamina.',
 '0', '20', '60', 'Total Body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Step Ups', 'To perform step-ups, start with one foot on the platform and push your body upward until both legs are straight. Step back down and repeat with the other leg. This exercise primarily targets the quadriceps, hamstrings, and glutes, helping to build leg strength and improve balance and stability. Step-ups can be done with various heights of platforms, making them suitable for different fitness levels and goals.',
 '0', '20', '60', 'Total Body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Bodyweight Squat', 'To perform a bodyweight squat, you stand with your feet shoulder-width apart, engage your core, and bend your knees while pushing your hips back as if you are sitting into an imaginary chair. Lower yourself until your thighs are parallel to the ground or as far as your flexibility allows, then push through your heels to return to a standing position. Bodyweight squats primarily target the quadriceps, hamstrings, glutes, and core muscles. They are an effective exercise for building leg strength, enhancing lower body endurance, and improving overall functional fitness.',
 '0', '10', '70', 'Total Body');

INSERT INTO exercises (exercise_name, description, suggested_weight_lbs, rep_count, expected_time_seconds, target)
VALUES ('Jump Squat', 'An explosive lower-body exercise that combines a traditional squat with a powerful jump. To perform a jump squat, you start with your feet shoulder-width apart, perform a regular squat by bending your knees and pushing your hips back, and then explosively jump upward as you straighten your legs. At the top of the jump, you return to the squat position upon landing. Jump squats engage the quadriceps, hamstrings, glutes, and calf muscles while also providing a cardiovascular challenge. They are an effective exercise for building leg power, improving explosive strength, and boosting overall athleticism.',
 '0', '10', '90', 'Total Body');

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

