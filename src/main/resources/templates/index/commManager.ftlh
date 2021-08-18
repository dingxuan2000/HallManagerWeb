<#include "masterTemplate.ftlh" >
<#--<@masterTemplate />-->


<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./layui/layui.js"></script>
<script src="./js/URL.js"></script>


<style>
    <#--弹出窗口"确认"键的样式修改-->
    .layui-layer-btn .layui-layer-btn0 {
        border-color: #B72523;
        background-color: #B72523;
        color: #fff;
    }

    /*按钮大小修改*/
    .layui-layer-btn a {
        height: 38px;
        line-height: 38px;
        margin: 5px 5px 0;
        padding: 0 18px;
        border: 1px solid #dedede;
        background-color: #fff;
        color: #333;
        border-radius: 2px;
        font-size: 14px;
        white-space: nowrap;
        text-align: center;
        cursor: pointer;
        text-decoration: none;
    }

    /*修改按钮位置*/
    .layui-layer-btn {
        text-align: center;
    }

    .layui-layer-content {
        background: white;
    }

    /*--------------新增弹窗里按键上移位置-----------------------------*/
    .layui-layer-iframe .layui-layer-btn, .layui-layer-page .layui-layer-btn {
        padding-top: 0;
    }

</style>

<#--用iframe写子页面，隐藏url-->
<#--<div class="layui-body" style="left: 250px; top: 20px;">-->
<!-- 内容主体区域 -->
<#--    <div class="layui-tab">-->
<#--        <ul class="layui-tab-title">-->
<#--            <li class="layui-icon layui-icon-prev"></li>-->
<#--            <li class="layui-this">-->
<#--                <div class="layui-icon layui-icon-home"></div>-->
<#--            </li>-->
<#--        </ul>-->

<#--        <div class="layui-tab-content layui-show" style="height: 1000px; left: 250px; top: 20px;">-->
<#--            <!--子页面区域&ndash;&gt;-->

<div class="layui-card">
    <div class="layui-card-body">
        <table class="layui-hide" id="demo2" lay-filter="test" style="left: 250px; top: 20px;"></table>

    </div>

</div>
<#--        </div>-->

<#--    </div>-->

<#--</div>-->

<#--添加button-->
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn" id="add_row" lay-event="add" style="background-color: rgb(183,36,36)">
            新增社区</button>
    </div>

</script>

<#--编辑&删除button-->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="del" style="background-color:#B72523">删除 </a>
</script>

<#--新增的弹出窗口-->
<form class="layui-form" action="" id="edit_form" lay-filter="editForm" style="display: none">
    <#--        <input type="hidden" name="user_id"/>-->
    <div class="layui-form-item" style="margin-top:30px">
        <label class="layui-form-label">社区名称</label>
        <div class="layui-input-block">
            <input type="text" name="comm_name" id="comm_name" required lay-verify="required" autocomplete="off"
                   class="layui-input" style="width:600px" >
        </div>
    </div>
</form>

<#--自定义新增表格序号-->
<script type="text/html" id="autoId">
    {{d.LAY_TABLE_INDEX+1}}
</script>


<!--update弹出窗口，可以不用这个，用同一个add弹出窗口-->
<div class="layui-row" id="popUpdateTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" lay-filter="aaa" action="" style="margin-top:20px">
            <!--不加id，更新时找不到id，更新会失败, 添加hidden属性隐藏-->
            <div class="layui-form-item" hidden="true">
                <label class="layui-form-label">编号</label>
                <div class="layui-input-block">
                    <input type="text" name="comm_id" placeholder="请输入编号" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">名字</label>
                <div class="layui-input-block">
                    <input type="text" name="comm_name" required lay-verify="required" placeholder="请输入名字" autocomplete="off"
                           class="layui-input" id="update" style="width:600px">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block" style="margin-left:50%">
                    <button  id = "edit-confirm" class="layui-btn  layui-btn-submit " lay-submit="" lay-filter="demo11">确认</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>


        </form>
    </div>
</div>

<#--<script src="./layui/layui.js"></script>-->
<#--<link rel="stylesheet" href="./layui/css/layui.css">-->
<#--<link rel="stylesheet" href="./css/nav.css">-->
<#--<script src="./js/index.js"></script>-->
<#--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->

<script>

    //加载模块
    layui.use(function () { //亦可加载特定模块：layui.use(['layer', 'laydate', function(){
        //得到各种内置组件
        let table = layui.table //表格
            ,form = layui.form
            ,element = layui.element
            ,$= layui.$;


        //执行一个 table 实例
        table.render({
            elem: '#demo2'
            , url: '/getCommManager'
            , height:700
            , title: '社区管理表'
            , page: true //开启分页
            , toolbar: '#toolbarDemo' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // , totalRow: true //开启合计行
            , cols: [[ //表头

                {field: 'id', title: '序号', width: 80, sort: true, fixed: 'left',templet: '#autoId'}
                , {field: 'comm_name', title: '社区名称'}
                ,{field: 'modified', title:'操作', toolbar:'#barDemo'}


            ]]
        });


        //监听头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                    //BUG: 暂时还是没法把layui-hide改成layui-show.
                    // $('#comm_name').show();
                    // $('#comm_name').addClass("layui-show");


                    //实现打开iframe窗口
                    layer.open({
                        skin: 'comm',
                        type: 1,
                        title: ['新增社区','color:#fff;background-color:#B72523'],
                        area: ['800px', '230px'],
                        shade: 0.8, // 遮罩层透明度
                        //id: 'LAY_layuipro', //设定一个id，防止重复弹出
                        //id: (new Date()).valueOf(),
                        resize: false, //是否允许拉伸
                        //btn: ['确认', '关闭'],
                        moveType: 1, //拖拽模式，0或者1
                        offset: 'auto', //默认垂直水平居中
                        content: $('#edit_form'),
                        btn:['确定', '取消'],
                        yes:function (index, layero){

                            //抓住用户输入的input
                            let commName = document.getElementById("comm_name").value;
                            if(commName == ''){
                                alert("请输入名称");
                            }else {

                                const add = document.getElementById("submit_btn");
                                let xhr = new XMLHttpRequest();
                                xhr.open("POST", urlPrefix+"/addCommManager", true);
                                xhr.setRequestHeader("Content-Type", "application/json");
                                let data1 = JSON.stringify({
                                    "comm_name": commName
                                });
                                xhr.send(data1);
                            }
                            location.reload(); //reload the window again!

                        }
                    });
                //break;

            }
            ;
        });


        //监听行工具事件
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'del') {
                layer.msg('删除操作');
                //显示出数据库中的对应的comm_id,方便我们删除数据库的这一行
                console.log("id is: "+ data.comm_id);

                layer.confirm('确认删除吗', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构

                    //向服务端发送删除指令

                    let xhr = new XMLHttpRequest();
                    xhr.open("DELETE", urlPrefix + "/deleteCommManager/"+data.comm_id);
                    xhr.setRequestHeader("Content-Type", "application/json");
                    xhr.send();


                    layer.close(index);
                    location.reload(); //reload the window again!

                });
            } else if (layEvent === 'edit') {
                layer.msg('编辑操作，当前行 数据库ID:' + data.comm_id);
                updateuser(obj, data);

            }
        });


        //编辑更新用户
        function updateuser(obj, data) {

            //回填数据到表单
            form.val("aaa", {
                "comm_id": data.comm_id
                , "comm_name": data.comm_name

            });
            layer.open({
                //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                //skin: "edit-btn",
                type: 1,
                title: "修改社区信息",
                area: ['800px', '230px'],
                content: $("#popUpdateTest")//引用的弹出层的页面层的方式加载修改界面表单
            });

            console.log("修改原始数据为：", data);
            console.log("id类型", typeof data.comm_id);
            console.log("obj为：", obj);
            form.on('submit(demo11)', function (massage) {

                console.log("message为：", massage);
                console.log(massage.field);
                //var data1 = massage.field;

                let xhr = new XMLHttpRequest();
                xhr.open("PUT", urlPrefix+"/updateCommManager/" + data.comm_id, true);
                xhr.setRequestHeader("Content-Type", "application/json");
                let data1 = JSON.stringify({
                    "comm_id": massage.field.comm_id,
                    "comm_name": massage.field.comm_name
                });
                xhr.send(data1);
                location.reload(); //reload the window again!

            })
        }


    })
</script>
