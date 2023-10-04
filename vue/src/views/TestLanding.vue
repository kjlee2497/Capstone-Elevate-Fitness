<template>

<div id="landing">
  <div class="wrapper">
    <!-- Navigation -->
    <nav class="main-nav">
      <ul>
        <li>
          <a href="#" class="topLoginBtn1" @click ="goToLogin" >Sign In</a>
        </li>
        <li>
          <a href="#" class="topSignUpBtn2" @click="goToRegister">Sign Up</a>
        </li>
        <li>
          <a href="#">Contact us</a>
        </li>
        <li>
          <a href="#">About us</a>
        </li>
      </ul>
    </nav>

    <!-- Top Container -->
    <section class="top-container">
      <header class="showcase">
        <h1>Elevate Fitness</h1>
        <p class="neon">"Elevate your effort, elevate your focus, and soon, you'll elevate your results. Rise above the ordinary, conquer the extraordinary!"</p>
        <a href="#" class="btn">Read More</a>
      </header>
      <div class="top-box top-box-a">
        
        <p class="neon">Don't Wish For It.<br>Work For It.</p>
        <a href="" class="btn" @click ="goToLogin">Sign In</a>
      </div>
      <div class="top-box top-box-b">
        <div class="container">
        </div>    
        <p class="neon">One Day<br>Or Day One.<br>You Decide.<br>Sign Up Today.</p>
        <a href="" class="btn" @click="goToRegister">Sign Up</a>
      </div>
    </section>

    <!-- Boxes Section -->
    <section class="boxes">
      <div class="box">
        <i class="fas fa-chart-pie fa-4x"></i>
        <h3>Gym Analytics</h3>
        <p>We use the gym analytics📊📈 for gym members to provide valuable 
          insights and benefits to help individuals make informed decisions 
          about their fitness journey and optimize their workouts</p>
      </div>
      <div class="box">
        <i class="fas fa-globe fa-4x"></i>
        <h3>Social Media</h3>
        <p>Stay in the know and keep your motivation soaring by following on social media🏋️‍♀️📲. 
          Get ready for exclusive workout tips, inspiring success stories🏅, exciting challenges, 
          and the latest updates on classes and events. Let's achieve your fitness goals together, 
          one like👍, one follow, one workout at a time!</p>
      </div>
      <div class="box">
        <i class="fas fa-cog fa-4x"></i>
        <h3>Personal Development</h3>
        <p>Embrace the journey of self-improvement and watch yourself transform🏋️‍♂️💪,
           not just physically but mentally too. Each rep, each set, and every drop
            of sweat💧 is a step closer to becoming the best version of yourself. 
            Believe in your strength and dedication, because the gym isn't just about 
            building muscle – it's about building character.🏆 </p>
      </div>
      <div class="box">
        <i class="fas fa-users fa-4x"></i>
        <h3>Inclusiveness</h3>
        <p>At our gym, support comes in all shapes and sizes! 💪🤝 Whether it's our friendly staff
           offering expert guidance, workout buddies cheering you on🎉🙌👏, or the community atmosphere
           that motivates you, you'll find a diverse range of support here. We're not just about lifting
           weights; we're about lifting each other up🏋️‍♂️🏋️‍♀️. Join us for a workout experience that's not
           just about fitness, but about the strength of a supportive community. Together, we achieve more!</p>
      </div>
    </section>

    <!-- Info Section -->
    <section class="info">
      <img src="https://img.peerspace.com/image/upload/w_1200,c_limit/c_crop,g_custom,f_auto,q_auto,dpr_auto/l_PS-logo,g_south_east,x_20,y_20,w_175,o_75/f0boxsoym9wm5ahs8lfx" alt="">
      

      <div>
        <h2>Meet Our Trainers</h2>
        <p>Meet our dedicated personal trainers at the gym if you don't know where to begin or are ready for a game-changer in your fitness journey. 
          Our trainers are more than just fitness experts; they're your partners in achieving your goals. 
          With their guidance, you'll receive a tailored workout plan that suits your unique needs and objectives. 
          They provide the motivation, accountability, and expertise that can help you push through plateaus and unlock your full potential. 
          Whether you're looking to lose weight, build muscle, improve endurance, or simply lead a healthier lifestyle, 
          our personal trainers will be by your side every step of the way. Don't miss out on the advantage of having a 
          fitness professional on your team; it's the secret to realizing your fitness dreams faster and more effectively.</p>
          <br>
        <a href="" class="btn" @click="goToMeetTrainers">Meet the team</a>
      </div>
    </section>

   
    <footer>
      <p>ElevateFitness &copy; 2023</p>
    </footer>

  </div>
  </div>
</template>

<script>
export default {
  name: "landingPage",
  data() {
    return {
      homePage:[]
    }
  },
  methods:{
    goToLogin(){
      this.$router.push({ name: 'login'})
    },
    goToRegister() {
      this.$router.push({ name: 'register' })
    },
    goToMeetTrainers() {
      this.$router.push({ name: 'meet-trainers'})
    }
  }

}
</script>

<style>
:root {
  --primary: #ddd;
  --dark: #333;
  --light: #fff;
  --shadow: 0 1px 5px rgba(104, 104, 104, 0.8);
}

html {
  box-sizing: border-box;
  font-family: Arial, Helvetica, sans-serif;
  color: var(--dark);
}

body {
  background: rgb(17, 17, 17);
  margin: 30px 50px;
  line-height: 1.4;
}

a.topSignUpBtn {
  font-weight: bold;
}
a.topLoginBtn { 
font-weight: bold;
}

.btn {
  background: var(--dark);
  color: var(--light);
  padding: 0.6rem 1.3rem;
  text-decoration: none;
  border: 0;
  margin-left: 0px;
  margin-right: 0px;
  margin-top: 20px;
}

img {
  max-width: 100%;
}

.wrapper {
  display: grid;
  grid-gap: 20px;
}

.main-nav ul {
  display: grid;
  grid-gap: 20px;
  padding: 0;
  list-style: none;
  grid-template-columns: repeat(4, 1fr);
}

.main-nav a {
  background: var(--primary);
  display: block;
  text-decoration: none;
  padding: 0.8rem;
  text-align: center;
  color: var(--dark);
  text-transform: uppercase;
  font-size: 1.1rem;
  box-shadow: var(--shadow);
    padding: 10px 20px;
    border-radius: 10px;
    font-family: 'Poppins',sans-serif;
   background-color: #ddd;
    backdrop-filter: blur(25px);
    
}

.main-nav a:hover {
  background: var(--dark);
  color: var(--light);
  font-weight: bold;
  
}

.top-container {
  display: grid;
  grid-gap: 20px;
  grid-template-areas:
    'showcase showcase top-box-a'
    'showcase showcase top-box-b';
}

.showcase {
  grid-area: showcase;
  min-height: 400px;
  background: url(https://img.peerspace.com/image/upload/w_1200,c_limit/c_crop,g_custom,f_auto,q_auto,dpr_auto/l_PS-logo,g_south_east,x_20,y_20,w_175,o_75/crepgzs5vjb363jjsq9o);
  background-size: cover;
  background-position: center;
  padding: 4.4rem;
  display: flex;
  flex-direction: column;
  align-items: start;
  justify-content: center;
  box-shadow: var(--shadow);
}

.showcase h1 {
  font-size: 4rem;
  margin-bottom: 0;
  color: var(--light);
  text-shadow:
    0 0 5px #8f05ffb9,
    0 0 10px #8f05ffb9,
    0 0 20px #8f05ffb9,
    0 0 40px #8f05ffb9,
    0 0 80px #8f05ffb9,
    0 0 90px #8f05ffb9,
    0 0 100px #8f05ffb9,
    0 0 150px #8f05ffb9;
}

.showcase p {
  font-size: 1.3rem;
  margin-top: 0;
  color: var(--light);
  text-shadow:
    0 0 5px #8f05ffb9,
    0 0 10px #8f05ffb9,
    0 0 20px #8f05ffb9,
    0 0 40px #8f05ffb9,
    0 0 80px #8f05ffb9,
    0 0 90px #8f05ffb9,
    0 0 100px #8f05ffb9,
    0 0 150px #8f05ffb9;
}

.top-box {
  background: var(--primary);
  display: grid;
  align-items: center;
  justify-items: center;
  box-shadow: var(--shadow);
    border: 1px black solid;
    padding: 10px 20px;
    border-radius: 15px;
    font-family: 'Poppins',sans-serif;
   background-color: #ddd;
    backdrop-filter: blur(25px);
}

.top-box .neon {
  font-size: 2.5rem;
   color: white;
  text-shadow:
    0 0 5px #8f05ffb9,
    0 0 10px #8f05ffb9,
    0 0 20px #8f05ffb9,
    0 0 40px #8f05ffb9,
    0 0 80px #8f05ffb9,
    0 0 90px #8f05ffb9,
    0 0 100px #8f05ffb9,
    0 0 150px #8f05ffb9;
}

.top-box-a {
  grid-area: top-box-a;
}

.top-box-b {
  grid-area: top-box-b;
}

.boxes {
  display: grid;
  grid-gap: 20px;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
}

.box {
  background: var(--primary);
  text-align: center;
  padding: 1.5rem 2rem;
  box-shadow: var(--shadow);
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    border: 1px black solid;
    padding: 10px 20px;
    border-radius: 15px;
    font-family: 'Poppins',sans-serif;
   background-color: rgb(255, 255, 255);
    backdrop-filter: blur(25px);
}

.info {
  background: var(--primary);
  box-shadow: var(--shadow);
  display: grid;
  grid-gap: 30px;
  grid-template-columns: repeat(2, 1fr);
  padding: 3rem;
    border-radius: 10px;
    font-family: 'Poppins',sans-serif;
   background-color: white;
    backdrop-filter: blur(25px);
}

footer {
  margin-top: 2rem;
  background: var(--dark);
  color: var(--light);
  text-align: center;
  padding: 1rem;
  border-radius: 10px;
    font-family: 'Poppins',sans-serif;
    backdrop-filter: blur(25px);
}

@media (max-width: 700px) {
  .top-container {
    grid-template-areas:
      'showcase showcase'
      'top-box-a top-box-b';
  }

  .showcase h1 {
    font-size: 2.5rem;
  
  }

  .main-nav ul {
    grid-template-columns: 1fr;
  }

  .info {
    grid-template-columns: 1fr;
  }

  .info .btn {
    display: block;
    text-align: center;
    margin: auto;

  }
}

i.fas.fa-chart-pie.fa-4x{
   color: #333;
  text-shadow:
    0 0 5px #8f05ffb9,
    0 0 10px #8f05ffb9;
}

i.fas.fa-globe.fa-4x{
   color: #333;
  text-shadow:
    0 0 5px #8f05ffb9,
    0 0 10px #8f05ffb9;
}

i.fas.fa-cog.fa-4x{
   color: #333;
  text-shadow:
   0 0 5px #8f05ffb9,
    0 0 10px #8f05ffb9;
}

i.fas.fa-users.fa-4x{
   color: #333;
  text-shadow:
     0 0 5px #8f05ffb9,
    0 0 10px #8f05ffb9;
}

@media (max-width: 500px) {
  .top-container {
    grid-template-areas:
      'showcase'
      'top-box-a'
      'top-box-b';
  }
}



</style>