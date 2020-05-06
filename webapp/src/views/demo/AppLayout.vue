<template>
  <el-container direction="vertaical">
    <el-aside
      >Aside

      <div class="block">
        <span class="demonstration">默认</span>
        <el-slider v-model="value1"></el-slider>
      </div>
      <div class="block">
        <span class="demonstration">自定义初始值</span>
        <el-slider v-model="value2"></el-slider>
      </div>
      <div class="block">
        <span class="demonstration">隐藏 Tooltip</span>
        <el-slider v-model="value3" :show-tooltip="false"></el-slider>
      </div>
      <div class="block">
        <span class="demonstration">格式化 Tooltip</span>
        <el-slider v-model="value4" :format-tooltip="formatTooltip"></el-slider>
      </div>
      <div class="block">
        <span class="demonstration">禁用</span>
        <el-slider v-model="value5" disabled></el-slider>
      </div>
    </el-aside>
    <el-container direction="vertaical">
      <el-header>Header</el-header>
      <el-main
        >Main
        <router-view></router-view>
      </el-main>
      <el-footer>Footer</el-footer>
    </el-container>
  </el-container>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
@Component
export default class ComponentName extends Vue {
  @Prop() private msg!: string;
}
</script>

<style scoped lang="scss">
/* @import url(); 引入css类 */
.el-header {
  background-color: #353538;
  color: #f5e2e2;
  text-align: center;
  line-height: 60px;
  position: fixed;
  width: 100%;
  z-index: 999;
  left: 200px;
}

.el-footer {
  background-color: #353538;
  color: #f5e2e2;
  text-align: center;
  line-height: 60px;
}

.el-aside {
  background-color: #404092;
  color: #f5e2e2;
  text-align: center;
  line-height: 200px;
  width: 200px !important;
  position: fixed;
  overflow: hidden;
  overflow-y: auto;
  height: 100vh;
}

.el-main {
  background-color: #e9eef3;
  color: #333;
  text-align: center;
  //   height: 100%;
  margin-top: 60px;
  margin-left: 200px;
}
.el-container {
  height: 100%;
}
</style>
