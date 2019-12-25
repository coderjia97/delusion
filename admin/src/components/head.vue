<template>
  <div>
    <h2 class="admin-title">{{title}}</h2>
    <Row>
      <Col :span="left" class="admin-operation">
        <slot name="head-left"></slot>
      </Col>
      <Col :span="right" class="admin-search">
        <slot name="head-right"></slot>
      </Col>
    </Row>
  </div>
</template>
<script>
export default {
    props:{
        title:{
            type:String,
            defatule:'',
        },
        left:{
            type:Number,
            default:6,
        },
        right:{
            type:Number,
            default:18,
        }
    }
};
</script>
<style lang="less">
.admin-title {
  padding-bottom: 9px;
  margin: 20px 0 20px;
  border-bottom: 1px solid #eee;
}
.admin-operation {
  text-align: left;
}
.admin-search {
  text-align: right;
}
.page {
  text-align: right;
  margin: 10px;
}
</style>