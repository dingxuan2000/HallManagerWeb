<#include "masterTemplate.ftlh" >
<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./layui/layui.js"></script>
<script src="./js/URL.js"></script>
<style>
    /*修改删除确认按钮和新增小区确认按钮颜色*/
    .layui-layer-btn .layui-layer-btn0{
        background-color: #E8ABAD;
        border-color: #E8ABAD;
    }

</style>

<div class="layui-card">
    <div class="layui-card-body">
        <table class="layui-hide" id="demo2" lay-filter="test"></table>

    </div>
</div>


<#--添加button-->
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn"  id="add_row" lay-event="add" style="background-color: rgb(183,36,36)">新增小区</button>
    </div>
</script>

<#--编辑&删除button-->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="del" style="background-color:#B72523">删除 </a>
</script>

<#--新增小区的弹出窗口-->
<form class = "layui-form" id="add_house" style="display: none; padding-top: 10px; padding-right: 20px;">
    <div class = "layui-form-item">
        <label class = "layui-form-label"><span class = "important">*</span>所属社区：</label>
        <div class="layui-input-inline" >
            <select id="comm_names" name="comm_name" >
                <option value="">请选择</option>
                <#if commManagerList?exists>
                    <#list commManagerList as key>
                        <option value="${key.getComm_id()}" text="${key.getComm_name()}">
                            ${key.getComm_name()}
                        </option>
                    </#list>
                </#if>
<#--                <option th:each="result : ${commManagerList}" th:value="${result.comm_id}" th:text="${result.comm_value}"></option>-->
            </select>
        </div>
    </div>
    <div class = "layui-form-item">
        <label class = "layui-form-label">小区名称：</label>
        <div class="layui-input-inline" >
            <input type="text" id="house_name" name="house_name" required placeholder="请输入小区" class="layui-input">
        </div>
    </div>
    <#--    <button id="submit_btn" class="layui-button" lay-filter="house_verify"style="display: none">确认</button>-->
</form>


<!--update弹出窗口，可以不用这个，用同一个add弹出窗口-->
<div class="layui-row" id="popUpdateTest" style="display:none;">
    <div class="layui-col">
        <form class="layui-form layui-from-pane" lay-filter="aaa" action="" style="margin-top:20px">
            <!--不加id，更新时找不到id，更新会失败, 添加hidden属性隐藏-->
            <div class="layui-form-item" hidden="true">
                <label class="layui-form-label">小区编号</label>
                <div class="layui-input-block">
                    <input type="text" name="house_id" placeholder="请输入小区编号" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" hidden="true">
                <label class="layui-form-label">社区编号</label>
                <div class="layui-input-block">
                    <input type="text" name="comm_id" placeholder="请输入社区编号" autocomplete="off" class="layui-input">
                </div>
            </div>


            <div class="layui-form-item">
                <label class = "layui-form-label"><span class = "important">*</span>所属社区：</label>
                <div class="layui-input-inline" >
                    <select id="edit_comm_names" name="comm_name" >
                        <option value="comm_name" text="comm_name" name="comm_name"></option>
                        <#if commManagerList?exists>
                            <#list commManagerList as key>
                                <option value="${key.getComm_id()}" text="${key.getComm_name()}">
                                    ${key.getComm_name()}
                                </option>
                            </#list>
                        </#if>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class = "layui-form-label">小区名称：</label>
                <div class="layui-input-inline">
                    <input type="text" name="house_name" required lay-verify="required" placeholder="请输入小区" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit " lay-submit="" lay-filter="demo11" style="background-color: #E8ABAD">确认修改</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>


        </form>
    </div>
</div>


<#--自定义新增表格序号-->
<script type="text/html" id="autoId">
    {{d.LAY_TABLE_INDEX+1}}
</script>


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
            ,url: '/houseManagerGetAll'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,height: 700
            ,width:880
            , title: '小区管理表'
            , page: true //开启分页
            //, toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // , totalRow: true //开启合计行
            , cols: [[ //表头

                {field: 'id', title: '序号', width: 80, sort: true, fixed: 'left',templet: '#autoId'}
                , {field: 'house_name', title: '小区名称', width: 200}
                ,{field: 'comm_id', title: '社区编码', width: 200}
                , {field: 'comm_name', title: '社区名称', width: 200}
                ,{field: 'modified', title:'操作', width: 200, toolbar:'#barDemo'}
                // 对应上面的id 'barDemo'
            ]]
        });




        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            let data = obj.data;
            switch (obj.event) {
                case 'add':

                    layer.open({
                        type:1,
                        id: (new Date()).valueOf(),
                        title: ["新增小区",'color:#fff;background-color:#B72523'],
                        area: ['550px', '260px'],
                        btn:['确认'],
                        content: $("#add_house"),
                        yes:function (index, layero){

                            let myselect = document.getElementById("comm_names");//拿到select对象
                            let index2 = myselect.selectedIndex;//selectedIndex代表的是你所选中项的index
                            let commId = myselect.options[index2].value;//拿到选中项options的value
                            let commName = myselect.options[index2].text;//拿到选中项options的text
                            let houseName = document.getElementById("house_name").value;


                            if(houseName == ''|| commName == ''){
                                alert("请输入名称");
                            }else{
                                const add = document.getElementById("submit_btn");
                                let xhr = new XMLHttpRequest();
                                xhr.open("POST", urlPrefix + "/addHouseManager", true);
                                xhr.setRequestHeader("Content-Type", "application/json");
                                let data2 = JSON.stringify({
                                    "comm_id": commId,
                                    "comm_name": commName,
                                    "house_name": houseName

                                });
                                xhr.send(data2);
                                // let currWindow = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                                // parent.layer.close(currWindow); //再执行关闭
                            }
                            location.reload(); //reload the window again!

                        }
                    });



                //})

            };

        });

        //监听行工具事件
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'del') {
                layer.msg('删除操作');
                //显示出数据库中的对应的comm_id,方便我们删除数据库的这一行
                console.log("id is: "+ data.house_id);

                layer.confirm('确认删除吗', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构

                    //向服务端发送删除指令

                    let xhr = new XMLHttpRequest();
                    xhr.open("DELETE", urlPrefix+"/deleteHouseManager/"+data.house_id);
                    xhr.setRequestHeader("Content-Type", "application/json");
                    xhr.send();


                    layer.close(index);
                    location.reload(); //reload the window again!

                });
            } else if (layEvent === 'edit') {
                layer.msg('编辑操作，当前行 数据库ID:' + data.house_id);
                updateuser(obj, data);

            }
        });

        //编辑更新用户
        function updateuser(obj, data) {

            //回填数据到表单
            form.val("aaa", {
                "comm_id": data.comm_id
                ,"comm_name": data.comm_name
                , "house_name": data.house_name
                , "house_id": data.house_id

            });
            layer.open({
                //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                type: 1,
                title: "修改小区信息",
                area: ['550px', '260px'],
                content: $("#popUpdateTest")//引用的弹出层的页面层的方式加载修改界面表单
            });

            console.log("修改原始数据为：", data);
            console.log("obj为：", obj);
            form.on('submit(demo11)', function (massage) {

                console.log("message为：", massage);
                console.log(massage.field);
                //var data1 = massage.field;

                let myselect = document.getElementById("edit_comm_names");//拿到select对象
                let editIndex = myselect.selectedIndex;//selectedIndex代表的是你所选中项的index
                let editCommId = myselect.options[editIndex].value;//拿到选中项options的value
                let editCommName = myselect.options[editIndex].text;//拿到选中项options的text


                let xhr = new XMLHttpRequest();
                xhr.open("PUT", urlPrefix+"/updateHouseManager/" + data.house_id, true);
                xhr.setRequestHeader("Content-Type", "application/json");
                let data1 = JSON.stringify({
                    "comm_id": editCommId,
                    "comm_name": editCommName,
                    "house_name": massage.field.house_name,
                    "house_id": massage.field.house_id
                });
                xhr.send(data1);
                location.reload(); //reload the window again!

            })
        };


    })
</script>
