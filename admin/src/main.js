import Vue from 'vue'
import App from './App.vue'
import router from './router'
import iview from 'iview';
import 'iview/dist/styles/iview.css';
import api from './api';

Vue.config.productionTip = false
Vue.use(iview);
Vue.use(api);

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
