import Vue from 'vue'
import App from './App.vue'
import VueSocketIO from 'vue-socket.io';
import 'bootstrap/dist/css/bootstrap.min.css';

Vue.use(VueSocketIO, 'http://192.168.1.109:8080')

new Vue({
  el: '#app',
  render: h => h(App)
})
