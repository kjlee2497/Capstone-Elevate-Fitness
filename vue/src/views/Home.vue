<template>
<div class="bg-image"
     style="background-image: url('https://images.rawpixel.com/image_1000/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsb2ZmaWNlN19waG90b2dyYXBoeV9vZl9tb2Rlcm5fZml0bmVzc19yb29tX21pbmltYWxfOGtfMjdjNmZkYjctNGQxMS00Yjc1LWJkODQtZThjZTBiMTY4NmY3XzEuanBn.jpg');" >
  <div class="home"  > 
    <h1>Welcome </h1>


 <img src="avatar.png" alt="Avatar" class="Avatar">


    <user-data />
    <all-assigned-workouts class="workoutTable" />
       



    
</div>

</div>
</template>

<script>
import AllAssignedWorkouts from '../components/AllAssignedWorkouts.vue';
import UserData from '../components/UserData.vue';

export default {
  components: {
    UserData,
    AllAssignedWorkouts
  },
  data(){  
  return {};
  }
  
}
</script>

<style scoped>
.bg-image {
 
  background-size: cover;
  background-position: center;
  height: 100vh;
  width: 100vw;
  margin:0
}
h1{
  color: white;
}

.Avatar {
   display: flex;
  
  width: 110px;
  height: 110px;
margin-top: 3%;
 margin-left: auto;
 margin-right: auto;

}
</style>
