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

<#--自定义新增表格序号-->
<script type="text/html" id="autoId">
    {{d.LAY_TABLE_INDEX+1}}
</script>

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
            ,url: '/joinHallManagerInfo'
            ,height: 700
            ,width: 1200
            ,title: '喜宴厅信息'
            ,page: true //开启分页
            ,cols: [[//表头
                {field: 'id', title: '序号', width: 80, sort: true, fixed: 'left',templet: '#autoId'}
                ,{field: 'hall_detail_floor', title: '层数', width: 100, align: 'left', templet: function(d){
                        return d.hall_detail_floor+d.hall_detail_unit;
                    }}
                ,{field: 'hall_name', title: '喜宴厅名称', width: 100, align: 'left'}
                ,{field: 'hall_address', title: '地址', width: 100, align: 'left'}
                ,{field: 'hall_house', title: '小区名称', width: 200, align: 'left'}
                ,{field: 'hall_community', title: '社区名称', width: 200, align: 'left'}
                ,{field: 'hall_detail_table_num', title: '桌数', width: 50, align: 'left'}
                ,{field: 'hall_detail_area', title: '面积', width: 50, align: 'left'}
                ,{field: 'hall_detail_rent', title: '租金', width: 50, align: 'left'}
                // ,{field: '', title:'图片', width: 100}
            ]]


        })
    })
</script>