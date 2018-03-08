<template>
  <div>
    <div id="joystick" style="width: 400px; height: 400px; position: absolute; border: 2px solid blue">
    </div>
    <div id="result"></div>
    Touch: {{touchStatus}}
  </div>
</template>

<script>
import VirtualJoystick from './virtualJoystick.js'

export default {
  props: {},
  data () {
    return {
      touchStatus: '',
      joystick: null,
      socket: null
    }
  },
  sockets: {
    connect: function(){
      console.log('socket connected')
    }
  },
  mounted () {

    this.joystick = new VirtualJoystick({
      stationaryBase: true,
      baseX: 200,
      baseY: 200,
      limitStickTravel: true,
      stickRadius: 150,
      mouseSupport: true,
      container: document.getElementById('joystick')
    });

    this.joystick.addEventListener('touchStart', this.touchStart)
    this.joystick.addEventListener('touchEnd', this.touchEnd)
    this.joystick.addEventListener('touchMove', this.touchMove)
    
    var that = this
    setInterval(function() {
      var outputEl	= document.getElementById('result');
      outputEl.innerHTML	= '<b>Position:</b> '
        + ' x:'+ that.joystick.deltaX()
        + ' y:'+ that.joystick.deltaY()
        + (that.joystick.right()	? ' right'	: '')
        + (that.joystick.up()	? ' up'		: '')
        + (that.joystick.left()	? ' left'	: '')
        + (that.joystick.down()	? ' down' 	: '')
    }, 100);
    
  },
  methods: {
    touchStart: function() {
      console.log('touchStart')
      this.touchStatus = 'touchStart'
    },
    touchEnd: function() {
      console.log('touchEnd')
      this.touchStatus = 'touchEnd'
      this.joystick.resetDelta()
      var joystickState = {x: 0, y: 0};
      this.$socket.emit('joystickState', joystickState);
    },
    touchMove: function(){
      var joystickState = {x: this.joystick.deltaX(), y: this.joystick.deltaY()};
      this.$socket.emit('joystickState', joystickState);
    }
  }
}
</script>

<style>
</style>