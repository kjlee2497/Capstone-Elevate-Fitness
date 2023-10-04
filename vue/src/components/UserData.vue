<template>
  <div>
      <p>{{this.username}}</p>
  </div>
</template>

<script>
import AuthService from '../services/AuthService'

export default {
    data() {
        return {
            username: ""
        }
    },
    created() {
            AuthService.getLoggedInUsername()
                .then(res => {
                    if(res.status == 200) {
                        this.username = res.data;
                        console.log(this.username)
                    }
                })
                .catch(err => {
                    console.log(err)
                });
        }
    }


</script>

<style>

</style>