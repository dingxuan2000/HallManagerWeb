<#include "index.ftlh" >
<@masterTemplate />
<div class="layui-body" style="left: 250px; top: 20px;">
    <!-- 内容主体区域 -->
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-icon layui-icon-prev"></li>
            <li class="layui-this">
                <div class="layui-icon layui-icon-home"></div>
            </li>
        </ul>

        <div class="layui-tab-content layui-show" style="height: 1000px;">
            <!--子页面区域-->

            <table class="layui-hide" id="demo2" lay-filter="test"></table>
        </div>
    </div>
</div>

<#--<!DOCTYPE html>-->
<#--<html lang="en">-->
<#--<head>-->
<#--    <meta charset="UTF-8">-->
<#--    <meta http-equiv="X-UA-Compatible" content="IE=edge">-->
<#--    <meta name="viewport" content="width=device-width, initial-scale=1.0">-->
<#--    <title>Document</title>-->
<#--</head>-->
<body>
<#--<h1>hello world. This is for ChargeType Post Method</h1>-->
<button id="add">add</button>
<button id="delete">delete</button>


<script>

    //加载模块
    layui.use(function () { //亦可加载特定模块：layui.use(['layer', 'laydate', function(){
        //得到各种内置组件
        let table = layui.table //表格


        //执行一个 table 实例
        table.render({
            elem: '#demo2'
            , url: '/houseManagerGetAll'
            , height: 620
            , title: '用户表'
            , page: true //开启分页
            , toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // , totalRow: true //开启合计行
            , cols: [[ //表头

                {field: 'house_id', title: '小区编码', width: 150, sort: true, fixed: 'left'}
                , {field: 'house_name', title: '小区名称', width: 150}
                , {field: 'comm_id', title: '社区编码', width: 150}
                , {field: 'comm_name', title: '社区名称', width: 150}
            ]]
        });
    })
</script>






</body>
</html>