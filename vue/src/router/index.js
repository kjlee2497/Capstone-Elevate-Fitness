import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import Metrics from '../views/Metrics.vue'
import ExerciseList from '../views/ExerciseList'
import EditExercise from '../views/EditExercise'
import AddExercise from '../views/AddExercise'
import AllWorkouts from '../views/AllWorkouts'
import Workout from '../views/Workout'
import AddWorkout from '../views/AddWorkout'
import WorkoutHistory from '../views/WorkoutHistory'
Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/metrics",
      name: "metrics",
      component: Metrics,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/exercises",
      name: "all-exercises",
      component: ExerciseList,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/exercise/:exerciseId",
      name: "edit-exercise",
      component: EditExercise,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/exercise/add/",
      name: "add-exercises",
      component: AddExercise,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/workouts",
      name: "workouts",
      component: AllWorkouts,
      meta: {
        requiresAuth: true
      }
    },    
    {
      path: "/workout/:workoutId",
      name: "workout",
      component: Workout,
      meta: {
        requiresAuth: true
      }
    },    
    {
      path: "/workout/add",
      name: "add-workout",
      component: AddWorkout,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/workout/history",
      name: "history",
      component: WorkoutHistory,
      meta: {
        requiresAuth: true
      }
    }
  ]
});

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
