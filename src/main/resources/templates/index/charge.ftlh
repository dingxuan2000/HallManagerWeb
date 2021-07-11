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


        //向世界问个好
        // layer.msg('Hello World');

        //监听Tab切换
        // element.on('tab(demo2)', function (data) {
        //     layer.tips('切换了 ' + data.index + '：' + this.innerHTML, this, {
        //         tips: 1
        //     });
        // });


        //执行一个 table 实例
        table.render({
            elem: '#demo2'
            , url: '/chargeTypeGetAll'
            , height: 620
            , title: '用户表'
            , page: true //开启分页
            , toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // , totalRow: true //开启合计行
            , cols: [[ //表头

                {field: 'charge_id', title: '类型编码', width: 150, sort: true, fixed: 'left'}
                , {field: 'charge_name', title: '类型名称', width: 150}
                , {field: 'charge_unit', title: '计价单位', width: 150}
                // , {field: 'change', title: '操作', width: 150}
            ]]
        });

        //监听头工具栏事件
        // table.on('toolbar(test)', function (obj) {
        //     var checkStatus = table.checkStatus(obj.config.id)
        //         , data = checkStatus.data; //获取选中的数据
        //     switch (obj.event) {
        //         case 'add':
        //             layer.msg('添加');
        //             break;
        //         case 'update':
        //             if (data.length === 0) {
        //                 layer.msg('请选择一行');
        //             } else if (data.length > 1) {
        //                 layer.msg('只能同时编辑一个');
        //             } else {
        //                 layer.alert('编辑 [id]：' + checkStatus.data[0].id);
        //             }
        //             break;
        //         case 'delete':
        //             if (data.length === 0) {
        //                 layer.msg('请选择一行');
        //             } else {
        //                 layer.msg('删除');
        //             }
        //             break;
        //     }
        //     ;
        // });

        //监听行工具事件
        // table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        //     var data = obj.data //获得当前行数据
        //         , layEvent = obj.event; //获得 lay-event 对应的值
        //     if (layEvent === 'detail') {
        //         layer.msg('查看操作');
        //     } else if (layEvent === 'more') {
        //         //下拉菜单
        //         dropdown.render({
        //             elem: this //触发事件的 DOM 对象
        //             , show: true //外部事件触发即显示
        //             , data: [{
        //                 title: '编辑'
        //                 , id: 'edit'
        //             }, {
        //                 title: '删除'
        //                 , id: 'del'
        //             }]
        //             , click: function (menudata) {
        //                 if (menudata.id === 'del') {
        //                     layer.confirm('真的删除行么', function (index) {
        //                         obj.del(); //删除对应行（tr）的DOM结构
        //                         layer.close(index);
        //                         //向服务端发送删除指令
        //                     });
        //                 } else if (menudata.id === 'edit') {
        //                     layer.msg('编辑操作，当前行 ID:' + data.id);
        //                 }
        //             }
        //             , align: 'right' //右对齐弹出（v2.6.8 新增）
        //             , style: 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' //设置额外样式
        //         })
        //     }
        // });
    })
</script>






<script>
    const add = document.getElementById("add");
    const deleteById = document.getElementById("delete");


    add.addEventListener("click", ()=>{
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "http://localhost:8080/addChargeType", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        let data1 = JSON.stringify({
            "charge_name": "Initialized Charge Name",
            "charge_unit": "Initialized Charge Unit",
        });
        xhr.send(data1);
    })


    deleteById.addEventListener("click", ()=>{
        console.log("hello");
        let xhr = new XMLHttpRequest();
        xhr.open("DELETE", "http://localhost:8080/deleteChargeType/1");
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send();
    })


</script>
</body>
</html>