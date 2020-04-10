import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
// import Element-UI and Style
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
// import i18n
import i18n from './locales';

Vue.use(ElementUI, {
  i18n: (key: string, value: any) => i18n.t(key, value)
});

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  i18n,
  render: h => h(App)
}).$mount('#app');
