<template>
    <div class="layout">
        <Layout>
            <Header>
                <Menu mode="horizontal" theme="dark" active-name="1">
                    <div class="layout-logo">
                        <router-link to="/">
                            <img src="../../public/157475957350331.png" width="100" style="margin-left:-20px;width: 162px;">
                        </router-link>
                    </div>
                    <div class="layout-nav">
                        <MenuItem name="1">
                            <Dropdown trigger="click" style="margin-left:20px">
                                用户名
                                <Icon type="ios-arrow-down"></Icon>
                                <DropdownMenu slot="list">
                                    <DropdownItem>修改密码</DropdownItem>
                                    <DropdownItem>退出</DropdownItem>
                                </DropdownMenu>
                            </Dropdown>
                        </MenuItem>
                        <MenuItem name="2">
                            <Avatar></Avatar>
                        </MenuItem>
                    </div>
                </Menu>
            </Header>
            <Layout>
                <Sider hide-trigger :style="{background: '#fff'}">
                    <Menu active-name="1" theme="light" width="auto" :open-names="['1']">
                        <MenuItem name="1" to="/">
                            <Icon type="ios-home" />
                            首页
                        </MenuItem>
                        <MenuItem name="2" to="/user">
                            <Icon type="ios-people" />
                            用户
                        </MenuItem>
                        <MenuItem name="3" to="/">
                            <Icon type="md-share" />
                            分类
                        </MenuItem>
                        <MenuItem name="4" to="/">
                            <Icon type="md-shirt" />
                            商品
                        </MenuItem> 
                        <MenuItem name="5" to="/">
                            <Icon type="md-reorder" />
                            评论
                        </MenuItem>                           
                        <MenuItem name="6" to="/">
                            <Icon type="ios-list-box" />
                            订单
                        </MenuItem>   
                        <MenuItem name="7" to="/">
                            <Icon type="md-images" />
                            广告
                        </MenuItem>                           
                        <MenuItem name="8" to="/">
                            <Icon type="md-settings" />
                            系统
                        </MenuItem>   
                    </Menu>
                </Sider>
                <Layout :style="{padding: '0 24px 24px'}">
                    <Content :style="{padding: '24px',margin:'20px', minHeight: '280px', background: '#fff'}">
                        <router-view></router-view>
                    </Content>
                    <Footer class="layout-footer-center">2019 &copy; joker后台</Footer>
                </Layout>
            </Layout>
        </Layout>
    </div>
</template>
<script>
    export default {
        
    }
</script>

<style lang="less" scoped>
.layout{
    border: 1px solid #d7dde4;
    background: #f5f7f9;
    position: relative;
    border-radius: 4px;
    overflow: hidden;

    .layout-logo{
        width: 100px;
        height: 30px;
        position: relative;
        float: left;
        top: -46px;
        left: 7px;
    }

    .layout-nav{
        width: 420px;
        margin: 0 auto;
        margin-right: 20px;
    }
    .layout-footer-center{
        text-align: center;
    }
}

</style>