package com.techelevator.dao;

import com.techelevator.model.Exercise;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class ExerciseJdbcDaoTests extends BaseDaoTests{

    protected static final Exercise EXERCISE_1 = new Exercise(2001, "exercise1", "description", 10, 5, 100, "arms");
    protected static final Exercise EXERCISE_2 = new Exercise(2002, "exercise2", "description", 5, 1, 25, "legs");
    protected static final Exercise EXERCISE_3 = new Exercise(2003, "exercise3", "description", 100, 20, 10, "legs");
    protected static final Exercise EXERCISE_4 = new Exercise(2003, "exercise4", "description", 1, 1, 1, "back");


    private ExerciseJdbcDao sut;

    @Before
    public void setup() {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        sut = new ExerciseJdbcDao(jdbcTemplate);
    }

    @Test
    public void getAllExercises(){
        List<Exercise> actual = sut.getAllExercises();

        Assert.assertEquals(4, actual.size());
        Assert.assertEquals(EXERCISE_1.getName(), actual.get(0).getName());
        Assert.assertEquals(EXERCISE_2.getExercise_id(), actual.get(1).getExercise_id());
        Assert.assertEquals(EXERCISE_3.getDescription(), actual.get(2).getDescription());
        Assert.assertEquals(EXERCISE_4.getTarget(), actual.get(3).getTarget());
    }

    @Test
    public void getExerciseByIdTest(){
        Exercise test = sut.getExerciseById(EXERCISE_1.getExercise_id());
        int actualId = test.getExercise_id();

        int expectedId = EXERCISE_1.getExercise_id();

        Assert.assertEquals(expectedId, actualId);

        Exercise test2 = sut.getExerciseById(EXERCISE_2.getExercise_id());
        int actualId2 = test2.getExercise_id();

        int expectedId2 = EXERCISE_2.getExercise_id();


        Assert.assertEquals(expectedId2, actualId2);

    }

    @Test(expected = IllegalArgumentException.class)
    public void getByIdTest_bad(){

         sut.getExerciseById(0);
    }

    @Test
    public void getExerciseByTargetTest(){

       List<Exercise> test = sut.getExerciseByTarget("arms");
        //1 is the expected value because only exercise1 has a target of "arms"
       Assert.assertEquals(1, test.size());

       List<Exercise> test2 = sut.getExerciseByTarget("legs");
        //2 is expected because exercise2 and exercise3 have a target of "legs"
       Assert.assertEquals(2, test2.size());

    }
    @Test(expected = IllegalArgumentException.class)
    public void getByTargetTest_bad(){

        sut.getExerciseByTarget("junk");
    }

    @Test
    public void getExerciseByUserTest(){

        List<Exercise> test = sut.getExercisesByUser(1001);

        Assert.assertEquals(1, test.size());

        List<Exercise> test2 = sut.getExercisesByUser(1002);

        Assert.assertEquals(2, test2.size());

    }

    @Test(expected = IllegalArgumentException.class)
    public void getByUserTest_bad(){

        sut.getExercisesByUser(9999);
    }

    @Test
    public void getExerciseByWorkoutTest(){

        List<Exercise> test = sut.getExercisesByWorkout(3001);

        Assert.assertEquals(2, test.size());

        List<Exercise> test2 = sut.getExercisesByWorkout(3002);

        Assert.assertEquals(1, test2.size());

    }

    @Test(expected = IllegalArgumentException.class)
    public void getByWorkoutTest_bad(){

        sut.getExercisesByUser(0);
    }

    @Test
    public void createExerciseTest(){
        Exercise exerciseTest = new Exercise("test", "description", 1, 1, 1, "back");

       Exercise created = sut.createExercise(exerciseTest, "trainer");

        List<Exercise> actual = sut.getAllExercises();

        //the exerciseTest was add to the list of exercises
        Assert.assertEquals(5, actual.size());

        //checking that each column matches
        Assert.assertEquals(actual.get(4).getExercise_id(), created.getExercise_id());
        Assert.assertEquals(exerciseTest.getName(), created.getName());
        Assert.assertEquals(exerciseTest.getDescription(), created.getDescription());
        Assert.assertEquals(exerciseTest.getWeight(), created.getWeight());
        Assert.assertEquals(exerciseTest.getRepCount(), created.getRepCount());
        Assert.assertEquals(exerciseTest.getExpectedTime(), created.getExpectedTime());
        Assert.assertEquals(exerciseTest.getTarget(), created.getTarget());


    }

    @Test
    public void editExerciseTest(){
        Exercise exerciseTest = new Exercise("test", "description", 1, 1, 1, "back");

        Exercise created = sut.createExercise(exerciseTest, "trainer");

        Exercise editTest = new Exercise("xxx", "xxx", 100, 100, 100, "chest");
       sut.editExercise(editTest, created.getExercise_id());

       //the edits will alter the exercise at index 4
       List<Exercise> allExercises = sut.getAllExercises();


        //checking that each column matches
        Assert.assertEquals(editTest.getName(), allExercises.get(4).getName());
        Assert.assertEquals(editTest.getDescription(), allExercises.get(4).getDescription());
        Assert.assertEquals(editTest.getWeight(), allExercises.get(4).getWeight());
        Assert.assertEquals(editTest.getRepCount(), allExercises.get(4).getRepCount());
        Assert.assertEquals(editTest.getExpectedTime(), allExercises.get(4).getExpectedTime());
        Assert.assertEquals(editTest.getTarget(), allExercises.get(4).getTarget());


    }

    @Test
    public void deleteExerciseTest(){
        Exercise exerciseTest = new Exercise("test", "description", 1, 1, 1, "back");

        Exercise created = sut.createExercise(exerciseTest, "trainer");

        //check list length before the delete
        List<Exercise> allExercises = sut.getAllExercises();
        Assert.assertEquals(5, allExercises.size());

        boolean exerciseWasDeleted = sut.deleteExercise(created.getExercise_id());

        Assert.assertTrue(exerciseWasDeleted);

        //check list length after the delete
        List<Exercise> afterDelete = sut.getAllExercises();
        Assert.assertEquals(4, afterDelete.size());

    }




}
