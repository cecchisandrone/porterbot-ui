<template>
  <div id="app">
    <div class="container-fluid">
      <div class="col-md-6">
        <joystick></joystick>
      </div>  
      <div class="col-md-6">
        <img src="http://porterbot:9090/stream/video.mjpeg"/>
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
