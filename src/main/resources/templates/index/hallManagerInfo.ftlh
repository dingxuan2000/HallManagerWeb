<#include "masterTemplate.ftlh">
<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./layui/layui.js"></script>

<div class="layui-card">

    <div class="layui-card-body">
        <table class="layui-hide" id="demo2" lay-filter="test"></table>
    </div>
</div>

<script>
    //加载模块
    layui.use(function (){
        //得到各种内置组件
        let table = layui.table
        ,format = layui.form
        ,element = layui.element
        ,$ = layui.$;

        //执行一个table示例
        table.render({
            elem: '#demo2'


        })
    })
</script>