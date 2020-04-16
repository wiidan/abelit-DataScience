<template>
  <div>
    <el-row>
      <el-col>
        <div class="block">
          <label for="" class="text-primarytext ma-5">查询时间</label>
          <el-date-picker
            v-model="value2"
            type="datetimerange"
            :picker-options="pickerOptions"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            align="right"
            value-format="timestamp"
            @change="btn"
          ></el-date-picker>
          <el-button icon="el-icon-search" circle class="ma-5"></el-button>
        </div>
      </el-col>
    </el-row>
    <el-row>
      <el-col>
        <el-table
          :data="tableData"
          height="500"
          border
          style="width: 100%"
          :default-sort="{ prop: 'date', order: 'descending' }"
        >
          <el-table-column prop="date" label="工号" width="180"></el-table-column>
          <el-table-column prop="name" label="姓名" width="180"></el-table-column>
          <el-table-column prop="address" label="打卡时间" sortable></el-table-column>
          <el-table-column prop="address" label="体温(参考值)" sortable></el-table-column>
          <el-table-column prop="address" label="打卡地点"></el-table-column>
          <el-table-column prop="address" label="设备IP"></el-table-column>
          <el-table-column prop="address" label="设备号"></el-table-column>
        </el-table>
      </el-col>
    </el-row>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';

@Component
export default class ComponentName extends Vue {
  tableData: Array<object> = [
    {
      date: '2016-05-03',
      name: '王小虎',
      address: '上海市普陀区金沙江路 1518 弄',
    },
    {
      date: '2016-05-02',
      name: '王小虎',
      address: '上海市普陀区金沙江路 1518 弄',
    },
    {
      date: '2016-05-04',
      name: '王小虎',
      address: '上海市普陀区金沙江路 1518 弄',
    },
    {
      date: '2016-05-01',
      name: '王小虎',
      address: '上海市普陀区金沙江路 1518 弄',
    },
    {
      date: '2016-05-08',
      name: '王小虎',
      address: '上海市普陀区金沙江路 1518 弄',
    },
    {
      date: '2016-05-06',
      name: '王小虎',
      address: '上海市普陀区金沙江路 1518 弄',
    },
    {
      date: '2016-05-07',
      name: '王小虎',
      address: '上海市普陀区金沙江路 1518 弄',
    },
  ];
  pickerOptions: any = {
    shortcuts: [
      {
        text: '最近一周',
        onClick(picker: any) {
          const end = new Date();
          const start = new Date();
          start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
          picker.$emit('pick', [start, end]);
        },
      },
      {
        text: '最近一个月',
        onClick(picker: any) {
          const end = new Date();
          const start = new Date();
          start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
          picker.$emit('pick', [start, end]);
        },
      },
      {
        text: '最近三个月',
        onClick(picker: any) {
          const end = new Date();
          const start = new Date();
          start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
          picker.$emit('pick', [start, end]);
        },
      },
    ],
  };
  public value2: string = '';
  btn() {
    console.log(this.value2[0] + '||' + this.value2[1]);
  }
  getData() {
    this.$axios
      .get('/api/feedback/gift')
      .then((res) => {
        console.log(res);
        if (res.status == 200) {
          console.log(Object.keys(res.data[0]).toString());
          let arrTitle = [];
          let resData = res.data;
          for (let i = 0; i < Object.keys(gift_zh.gift_zh).length; i++) {
            arrTitle.push({
              key: Object.keys(gift_zh.gift_zh)[i],
              label: Object.values(gift_zh.gift_zh)[i],
            });
          }

          console.log(arrTitle);

          let filterList = ['title_vipperson', 'title_vipemail', 'title_confirmdate', 'title_viptel'];

          arrTitle = arrTitle.filter((item) => !filterList.includes(item.key));

          // console.log(arrTitle)

          this.fields = arrTitle;
          resData.map((item) => (item.mem_check == 1 ? (item.mem_check = '是') : (item.mem_check = '不是')));
          this.items = res.data;
        }
      })
      .catch((error) => {
        console.log(error);
        alert('填报异常，请检查后再次提交');
      });

    console.log(JSON.stringify(this.form));
  }
}
</script>

<style scoped lang="scss">
@import '@/assets/scss/style.scss';
/* @import url(); 引入css类 */
</style>
