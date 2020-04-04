<template>
  <div id="app">
    <div class="container-fluid">
      <div style="width: 450px; height: 450px; border: 2px solid blue" class="col-sm-6">
        <input type="checkbox" id="checkbox" v-model="checked">
        <label for="checkbox">Enable camera view</label>
        <joystick></joystick>        
      </div>        
      <div v-if="checked" class="col-sm-6">
        <img width="480" src="http://192.168.1.20:9090/stream/video.mjpeg"/>        
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
      msg: 'PorterbotUI',
      checked: false
    }
  },
  components: {
    Joystick
  }
}
</script>

<style>

</style>
