<template>
  <div>
      
      <p class="userName">{{this.username}}</p>
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
.userName{
    display: flex;
    justify-content: center;
    font-size: 3rem;
    margin-top: 0;
  margin-bottom: 0;
  color: var(--light);
  text-shadow:
    0 0 5px #8f05ffb9, 
     0 0 10px #8f05ffb9,
    0 0 2px #8f05ffb9, 
    0 0 40px #8f05ffb9,
    0 0 8px #8f05ffb9,
    0 0 9px #55505ab9,
    0 0 1px #8f05ffb9,
    0 0 1px #6f6379b9;
}
</style>