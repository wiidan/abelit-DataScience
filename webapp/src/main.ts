import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

// import i18n
import VueI18n from 'vue-i18n';
import enLocale from 'element-ui/lib/locale/lang/en';
import zhLocale from 'element-ui/lib/locale/lang/zh-CN';

// import custom translations
import dsEnLocale from './locale/en-US';
import dsZhLocale from './locale/zh-CN';

Vue.use(ElementUI);
Vue.use(VueI18n);

Vue.config.productionTip = false;

const messages = {
  en: {
    message: 'hello',
    ...dsEnLocale,
    ...enLocale, // 或者用 Object.assign({ message: 'hello' }, enLocale)
  },
  zh: {
    message: '你好',
    ...dsZhLocale,
    ...zhLocale, // 或者用 Object.assign({ message: '你好' }, zhLocale)
  },
};
// Create VueI18n instance with options
const i18n = new VueI18n({
  locale: 'en', // set locale
  messages, // set locale messages
});

Vue.use(ElementUI, {
  i18n: (key: string, value: string) => i18n.t(key, value),
});

new Vue({
  router,
  store,
  i18n,
  render: (h) => h(App),
}).$mount('#app');
