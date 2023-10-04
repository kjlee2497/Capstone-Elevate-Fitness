<template>
<div class="bg-image"
     style="background-image: url('https://images.rawpixel.com/image_1000/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsb2ZmaWNlN19waG90b2dyYXBoeV9vZl9tb2Rlcm5fZml0bmVzc19yb29tX21pbmltYWxfOGtfMjdjNmZkYjctNGQxMS00Yjc1LWJkODQtZThjZTBiMTY4NmY3XzEuanBn.jpg');" >
  <div class="home"  > 
    <h1>Welcome </h1>
    <user-data />
       


    
</div>
<v-container
    fluid
    style="height: 300px"
  >
    <v-row justify="center">
      <v-menu
        min-width="200px"
        rounded
      >
        <template v-slot:activator="{ props }">
          <v-btn
            icon
            v-bind="props"
          >
            <v-avatar
              color="brown"
              size="large"
            >
              <span class="text-h5">{{ user.initials }}</span>
            </v-avatar>
          </v-btn>
        </template>
        <v-card>
          <v-card-text>
            <div class="mx-auto text-center">
              <v-avatar
                color="brown"
              >
                <span class="text-h5">{{ user.initials }}</span>
              </v-avatar>
              <h3>{{ user.fullName }}</h3>
              <p class="text-caption mt-1">
                {{ user.email }}
              </p>
              <v-divider class="my-3"></v-divider>
              <v-btn
                rounded
                variant="text"
              >
                Edit Account
              </v-btn>
              <v-divider class="my-3"></v-divider>
              <v-btn
                rounded
                variant="text"
              >
                Disconnect
              </v-btn>
            </div>
          </v-card-text>
        </v-card>
      </v-menu>
    </v-row>
  </v-container>

</div>
</template>

<script>
import UserData from '../components/UserData.vue';

export default {
  components: {
    UserData
  },
  data(){  
  return {};
  }
  
}
</script>

<style scoped>
h1{
  color: white;
}

</style>
