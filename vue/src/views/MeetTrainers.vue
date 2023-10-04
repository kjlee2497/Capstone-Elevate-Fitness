<template>
  <body>
    
    <h1>Meet The Trainers</h1>
    <button class="back-btn" @click="goToLandingPage">Go Back</button>
    <div class="container">
      <div class="row">
        <div class="col">
          <div class="usercard">
            <div class="usercard-avatar">
              <img
                src="https://ca.slack-edge.com/T0GNFLF6D-U05C61G3FD2-d39738f035af-512"
                alt="Kevin"
                class="usercard-img"
              />
            </div>
            <div class="usercard-body">
              <h2 class="usercard-name">Kevin Lee</h2>
              <span class="usercard-about">About:</span>
              <div class="description">
                Get ready to embark on an extraordinary fitness journey led by our esteemed chest specialist, Kevin. 
                With a rich history of expertise and an impeccable roster of credentials, Kevin is your go-to trainer 
                for achieving an awe-inspiring chest. His qualifications span the fields of strength training, anatomy, 
                and nutrition, providing a deep understanding of chest muscles and the precise methods required for optimal 
                development. Kevin's meticulously designed chest workout programs are renowned for their effectiveness, 
                targeting every aspect of chest muscles to ensure you attain your desired results. 
              </div>
            </div>
          </div>
        </div>
        <div class="col">
            <div class="usercard">
              <div class="usercard-avatar">
                <img
                  src="https://ca.slack-edge.com/T0GNFLF6D-U05EJDTDSTS-7d25909a3b63-512"
                  alt="Joshua"
                  class="usercard-img"
                />
              </div>
              <div class="usercard-body">
                <h2 class="usercard-name">Joshua Palonis-Kowalonek</h2>
              <span class="usercard-about">About:</span>
              <div class="description">
                 Joshua, a seasoned and highly accredited trainer with a passion for sculpting strong and resilient backs. 
                 With years of experience and a proven track record of helping clients achieve impressive back strength and definition,
                  Joshua is your go-to expert as he holds expertise in strength training, biomechanics, and exercise physiology.
                  He possesses a deep understanding of the intricate muscles that make up the back and how to target them effectively. 
                  His personalized back workout programs are thoughtfully crafted to engage every muscle group in your back, 
                  ensuring you attain the results you desire. \
              </div>
              </div>
            </div>
          </div>
        <div class="col">
          <div class="usercard">
            <div class="usercard-avatar">
              <img
                src="https://ca.slack-edge.com/T0GNFLF6D-U05D6KFG6ES-440d70f100e3-512"
                alt="Jose"
                class="usercard-img"
              />
            </div>
            <div class="usercard-body">
              <h2 class="usercard-name">Jose Reveles</h2>
              <span class="usercard-about">About:</span>
              <div class="description">
                With a rich history of expertise and a stellar list of credentials, Jose is your go-to trainer for cultivating 
                unmatched cardiovascular strength and enduring stamina. His qualifications span the fields of exercise physiology,
                sports science, and specialized endurance training, providing a profound understanding of the intricate dynamics of 
                the human cardiovascular system. Jose is renowned for their meticulously crafted cardio and endurance workouts, each 
                designed to push boundaries and maximize your physical potential. Whether you aim to conquer long-distance runs, 
                or simply build a heart that beats with unyielding vigor, Jose is here to guide you.
              </div>
            </div>
          </div>
        </div>
        
        <div class="col">
            <div class="usercard">
              <div class="usercard-avatar">
                <img
                  src="https://ca.slack-edge.com/T0GNFLF6D-U05AVJ1LW0Y-4deeaadea0f5-512"
                  alt="Caroline"
                  class="usercard-img"
                />
              </div>
              <div class="usercard-body">
                <h2 class="usercard-name">Caroline Horne</h2>
              <span class="usercard-about">About:</span>
              <div class="description">
                Caroline, our highly certified trainer dedicated to helping you achieve impressive arm strength and definition. 
                With years of experience and a proven track record in sculpting formidable arms, Caroline is your ultimate resource 
                for upper body transformation. She possesses a deep understanding of muscle physiology and dietary strategies to maximize 
                arm development. Caroline's tailored arm workout programs are meticulously designed to target every aspect of arm muscles, 
                ensuring you reach your desired results.
              </div>
              </div>
            </div>
          </div>
        <div class="col">
          <div class="usercard">
            <div class="usercard-avatar">
              <img
                src="https://ca.slack-edge.com/T0GNFLF6D-U059Z7E4UES-e00cd46f92a1-512"
                alt="Alejandro"
                class="usercard-img"
              />
            </div>
            <div class="usercard-body">
              <h2 class="usercard-name">Alejandro Lopez Torres</h2>
              <span class="usercard-about">About:</span>
              <div class="description">
                Get ready to step into the ring of fitness excellence with our distinguished boxing and boxing fitness maestro, Alejandro. He is renowned for his meticulously crafted boxing and boxing fitness workouts, which seamlessly blend precision, power, and endurance to help you unleash your inner fighter. Whether you aspire to master the art of self-defense, sculpt a physique that radiates strength, or simply embrace a challenge that reshapes both body and mind, Alejandro is your undisputed cornerman.
              </div>
            </div>
          </div>
          
          
        </div>
      </div>
    </div>
  </body>
</template>

<script>
export default {
  name: "meet-trainers",
  data() {
    return {
        meetTrainers:[]
    }
    },
    methods: {
      goToLandingPage() {
        this.$router.push("/")
      }
    }
    
  }
</script>

<style>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}


.description {
  margin-left: 10px;
}


.container {
  max-width: 800px;
  margin: 50px auto;
}
.row {
  
  display: flex;
  margin: -10px;
  flex-wrap: wrap;
}

.col {
  margin: 20px;
  flex-grow: 1;
}

.usercard {
  
  background: white;
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  flex-basis: 0;
  min-height: 250px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  overflow: hidden;
  border-radius: 4px;
}
.usercard-avatar {
  position: relative;
  width: 50%;
  z-index: 49;
  overflow: hidden;
}
.usercard-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: 0.3s;
}

.usercard-body {
  position: relative;
  width: 50%;
  padding: 40px 10px 20px;
}
.usercard-name {
  font-size: 30px;
  margin-bottom: 6px;
  
  color: #ffffff;
      letter-spacing: 0.5px;
      outline: none;
      border: none;
     text-shadow:
        0 0 5px #8f05ffb9,
        0 0 10px #8f05ffb9,
        0 0 15px #8f05ffb9,
        0 0 20px #8f05ff83;
}

 .back-btn {
   align-items: center;
  
  
    background-color: rgb(238, 238, 238);
    color: black;
    border: 10px;
    padding: 15px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
    
    
}
 
  .back-btn:hover {
    display: flex;
    
    background-color: #8F05FF;
    transform: scale(1.05);
        animation: pulse 0.5s ease infinite alternate;
        font-weight: bolder;
        color: white;
  }
 
 back-btn:hover {
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
} 


.usercard-about {
  font-size: 16px;
  font-weight: bold;
  border-radius: 4px;
  background: rgba(#35465c, 0.1);
  color: #35465c;
    
}

:hover.usercard-img {
  transform: scale(1.1) rotate(.5deg);
}
</style>