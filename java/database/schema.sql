BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS exercises;
DROP TABLE IF EXISTS workouts;
DROP TABLE IF EXISTS trainer_workouts;
DROP TABLE IF EXISTS workout_exercises;
DROP TABLE IF EXISTS users_info;
DROP TABLE IF EXISTS user_exercises;


CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  START WITH 1001
  NO MAXVALUE;

CREATE TABLE users (
	user_id int NOT NULL DEFAULT nextval('seq_user_id'),
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE SEQUENCE seq_exercise_id
  INCREMENT BY 1
  START WITH 2001
  NO MAXVALUE;

CREATE TABLE exercises (
   exercise_id  int NOT NULL DEFAULT nextval('seq_exercise_id'),
   exercise_name varchar(50) NOT NULL,
   description varchar(1000) NOT NULL,
   suggested_weight_lbs int NOT NULL,
   rep_count int NOT NULL,
   expected_time_seconds int NOT NULL,
   target varchar(50) NOT NULL,
   CONSTRAINT PK_exercises PRIMARY KEY(exercise_id)
);

CREATE SEQUENCE seq_workout_id
  INCREMENT BY 1
  START WITH 3001
  NO MAXVALUE;

CREATE TABLE workouts (
    workout_id int NOT NULL DEFAULT nextval('seq_workout_id'),
    isCompleted boolean,
    name varchar(50),
    description varchar(1000),
   CONSTRAINT PK_workouts PRIMARY KEY(workout_id)
);

CREATE TABLE user_workouts (
    user_id int NOT NULL,
    workout_id int NOT NULL,
    CONSTRAINT PK_trainer_workouts PRIMARY KEY(user_id, workout_id),
    CONSTRAINT FK_trainer_workouts_trainer FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT FK_trainer_workouts_workout FOREIGN KEY(workout_id) REFERENCES workouts(workout_id)
);

CREATE TABLE user_workouts_assigned (
    user_id int NOT NULL,
    workout_id int NOT NULL,
    isCompleted boolean DEFAULT false,
    CONSTRAINT PK_assigned_workouts PRIMARY KEY(user_id, workout_id),
    CONSTRAINT FK_assigned_workouts_user FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT FK_assigned_workouts_workout FOREIGN KEY(workout_id) REFERENCES workouts(workout_id)
);

CREATE TABLE workout_exercises (
    workout_id int NOT NULL,
    exercise_id int NOT NULL,
    CONSTRAINT PK_workout_exercises PRIMARY KEY(exercise_id, workout_id),
    CONSTRAINT FK_workout_exercises_exercise FOREIGN KEY(exercise_id) REFERENCES exercises(exercise_id),
    CONSTRAINT FK_workout_exercises_workout FOREIGN KEY(workout_id) REFERENCES workouts(workout_id)
);
CREATE TABLE user_exercises (
    trainer_id int NOT NULL,
    exercise_id int NOT NULL,
    CONSTRAINT PK_user_exercises PRIMARY KEY(exercise_id, trainer_id),
    CONSTRAINT FK_user_exercises_exercise FOREIGN KEY(exercise_id) REFERENCES exercises(exercise_id),
    CONSTRAINT FK_user_exercises_workout FOREIGN KEY(trainer_id) REFERENCES users(user_id)
);

CREATE TABLE users_info (
	user_id int NOT NULL,
	weight int NOT NULL,
	height int NOT NULL,
	age int NOT NULL,

	CONSTRAINT PK_user_info PRIMARY KEY (user_id),
	CONSTRAINT FK_user_info_user FOREIGN KEY(user_id) REFERENCES users(user_id)
);


COMMIT TRANSACTION;
