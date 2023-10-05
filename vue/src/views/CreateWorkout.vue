<template>

  <div class="bg-image"
     style="background-image: url('https://images.rawpixel.com/image_1000/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA3L3Jhd3BpeGVsX29mZmljZV82X3Bob3RvZ3JhcGh5X29mX2xpZ2h0X2FuZF9jbGVhbl9neW1fZXhlcmNpc2VfZV81ZDMxM2VhYS05NTY2LTQxNTgtOTMyMi1lYzZkNWU2YWNkNDguanBn.jpg');">
      <new-workout-form></new-workout-form>
  </div>
</template>

<script>
import NewWorkoutForm from '../components/NewWorkoutForm.vue'

export default {
  components: {
    NewWorkoutForm
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
</style>