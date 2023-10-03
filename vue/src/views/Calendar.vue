<template>
  <div class="frame">
  <div class="center">
		<div class="container">
			<div class="date">
				<span class="day">Friday</span>
				<span class="number">15</span>
			</div>
			
			<div class="date">
				<span class="day">Saturday</span>
				<span class="number">16</span>
			</div>
			
			
			<div class="date">
				<span class="day">Sunday</span>
				<span class="number">17</span>
			</div>
			
			<div class="date">
				<span class="day">Monday</span>
				<span class="number">18</span>
			</div>
		</div>
  </div>
</div>
</template>

<script>
export default {

}
</script>

<style>

@import url(https://fonts.googleapis.com/css?family=Open+Sans:700,300);

/* // use only the available space inside the 400x400 frame */
.frame {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  height: 400px;
  margin-top: -200px;
  margin-left: -200px;
  border-radius: 2px;
	box-shadow: 4px 8px 16px 0 rgba(0,0,0,0.1);
	overflow: hidden;
  background: #fff;
  color: #333;
	font-family: 'Open Sans', Helvetica, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.container{
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-template-rows: repeat(2, 1fr);
	text-align: center;
}

.center {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
}

.date{
	display: flex;
	flex-direction: column;
	justify-content: center;
	height: 200px;
	width: 200px;
	background: #ED6B86;
	color: white;
			transition: 0.3s;
        transform: scale(0.95);
    }




.number{
	font-size: 4rem;
	font-weight: 900;
}
</style>