<template>
  <div id="app">
    <div class="container-fluid">
      <div class="col-sm-6">
        <joystick></joystick>
      </div>  
      <div class="col-sm-6">
        <img width="480" src="http://192.168.1.109:9090/stream/video.mjpeg"/>
      </div>
    </div>
  </div>
</template>

<script>
import Joystick from './Joystick.vue'
export default {
  name: 'app',
  data () {
    return {
      msg: 'PorterbotUI'
    }
  },
  components: {
    Joystick
  }
}
</script>

<style>

</style>
