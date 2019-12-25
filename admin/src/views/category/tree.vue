<template>
    <div>
        <Button type="info" style="margin:0 5px;float:left" @click="$router.go(-1)">返回</Button>
        <Tree :data="tree" style="float:left;margin-left:50px;margin-top:50px;"></Tree>
    </div>
</template>

<script>
export default {
    data() {
        return {
            tree : [],
        }
    }, 

    mounted() {
        this.getTree();
    },

    methods: {
        async getTree() {
            let res = await this.$api.category.treeList();
            if(res){
                this.tree =res;
            }
             console.log(res);
        }
       
    },
}
</script>
<style lang="less" scoped>
    
</style>