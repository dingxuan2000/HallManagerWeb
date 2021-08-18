<#include "masterTemplate.ftlh">
<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./layui/layui.js"></script>
<script src="./js/URL.js"></script>

<style>
    <#--弹出窗口"确认"键的样式修改-->
    .layui-layer-btn .layui-layer-btn0 {
        border-color: #E8ABAD;
        background-color: #E8ABAD;
        color: #fff;
    }

    .layui-layer-iframe .layui-layer-btn, .layui-layer-page{
        padding-top: 10px;
        background: whitesmoke;
    }
</style>

<#--页面Body主体-->
<div class="layui-card">

    <div class="layui-card-body">
        <table class="layui-hide" id="demo2" lay-filter="test"></table>
    </div>
</div>


<#--添加button-->
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn"  id="add_row" lay-event="add" style="background-color: rgb(183,36,36)">新增</button>
    </div>
</script>


<#--编辑&删除button-->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="del" style="background-color:#B72523">删除 </a>
</script>


<#--新增的弹出窗口-->
<form class="layui-form" action="" id="edit_form" lay-filter="editForm" οnunlοad="window.opener.location.reload();" style="display: none">
    <#--        <input type="hidden" name="user_id"/>-->

        <div class="layui-card" style="margin: 20px;">
            <div class="layui-card-header">基本信息</div>
            <div class="layui-card-body">

                <div class="layui-form-item layui-row">
                    <div class="layui-inline layui-col-md12">
                        <div class="layui-row">
                            <div class="layui-inline layui-col-md6">
                                <label class="layui-form-label">喜宴厅名称:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="hallName" id="hall_name" placeholder="请输入喜宴厅名称" required lay-verify="required" autocomplete="off"
                                           class="layui-input" >
                                </div>
                            </div>
                            <div class="layui-inline layui-col-md6">
                                <label class = "layui-form-label"><span class = "important">*</span>社区：</label>
                                <div class="layui-input-inline" >
                                    <select id="comm_names" name="hall_community" lay-filter="firstChoice" >
                                        <option value="">请选择社区</option>
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
                        </div>
                    </div>

                    <div class="layui-inline layui-col-md6">
                        <div class="layui-row">
                            <label class = "layui-form-label"><span class = "important">*</span>小区：</label>
                            <div class="layui-input-inline" >
                                <select id="house_names" name="hall_house" class="secondChoice">
                                    <option value="">请选择小区</option>
                                    <#if houseManagerList?exists>
                                        <#list houseManagerList as key>
                                            <option value="${key.getComm_id()}-${key.getHouse_name()}-${key.getHouse_id()}" text="${key.getHouse_name()}">

                                            </option>
                                        </#list>
                                    </#if>
                                </select>
                            </div>
                        </div>

                    </div>

                    <div class="layui-inline layui-col-md6" >
                        <label class="layui-form-label">押金:
                        <span style="color: red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="hall_deposit" id="hall_deposit"
                                   placeholder="请输入押金" type="text" required lay-verify="required" autocomplete="off"
                                   class="layui-input" >
                        </div>
                    </div>


                    <div class="layui-inline layui-col-md12">
                        <label class="layui-form-label">地址:</label>
                        <div class="layui-input-block">
                            <input type="text" name="hall_address" id="hall_address" placeholder="请输入地址" required lay-verify="required" autocomplete="off"
                                   class="layui-input" >
                        </div>

                    </div>

                    <div class="layui-inline layui-col-md6" >
                        <label class="layui-form-label">总桌数:</label>
                        <div class="layui-input-block">
                            <input class="layui-input layui-disabled" name="hall_table_num" id="hall_table_num"
                                   style="background-color: whitesmoke" lay-verify="required" autocomplete="off"
                                    readonly required>
                        </div>
                    </div>

                    <div class="layui-inline layui-col-md6" >
                        <label class="layui-form-label">总面积:</label>
                        <div class="layui-input-block">
                            <input class="layui-input layui-disabled" name="hall_area" id="hall_area"
                                   style="background-color: whitesmoke" lay-verify="required" autocomplete="off"
                                    readonly required>
                        </div>
                    </div>

                    <hr class="layui-border-black" />
                    <div class="layui-inline layui-col-md12">
                        <div class="layui-card-header">详细信息
                            <button type="button" id="btnAdd_detail" class="layui-btn layui-btn-warm
                            layui-btn-xs">添加信息</button>
                        </div>
                        <div class="layui-card-body">
                            <table class="layui-table" id="hallDetailTable" lay-filter="hallDetailTable"></table>
                            <div class="layui-form layui-border-box layui-table-view" lay-filter="detailBox" style="height: 250px;">
                                <div class="layui-table-box">
                                    <div class="layui-table-header">
                                        <table class="layui-table">
                                            <thead>
                                                <tr>
                                                    <th style="width: 100px"><div class="layui-table-cell" align="left">层数</div></th>
                                                    <th style="width: 100px"><div class="layui-table-cell" align="left">层/厅</div></th>
                                                    <th style="width: 100px"><div class="layui-table-cell" align="left">桌数</div></th>
                                                    <th style="width: 100px"><div class="layui-table-cell" align="left">租金(元)</div></th>
                                                    <th style="width: 100px"><div class="layui-table-cell" align="left">面积</div></th>
                                                    <th style="width: 100px"><div class="layui-table-cell" align="left">操作</div></th>

                                                </tr>
                                            </thead>
                                        </table>
                                    </div>

                                    <div class="layui-table-body layui-table-main" style="height: 209px;">
                                        <table class="layui-table" id="detailInfo" lay-filter="test">
                                            <tbody id="detail-info">
                                             <#--需要append td, 当点击“添加信息”按钮时-->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>


            </div>

        </div>

</form>

<#--编辑的弹出窗口-->
<form class="layui-form" action="" id="popUpdateTest" lay-filter="aaa" οnunlοad="window.opener.location.reload();" style="display: none">
    <#--        <input type="hidden" name="user_id"/>-->

    <div class="layui-card" style="margin: 20px;">
        <div class="layui-card-header">基本信息</div>
        <div class="layui-card-body">

            <div class="layui-form-item layui-row">
                <!--不加id，更新时找不到id，更新会失败, 添加hidden属性隐藏-->
                <div class="layui-form-item" hidden="true">
                    <label class="layui-form-label">编号</label>
                    <div class="layui-input-block">
                        <input type="text" id="hall_id_update"  name="hall_id" placeholder="请输入编号" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-inline layui-col-md12">
                    <div class="layui-row">
                        <div class="layui-inline layui-col-md6">
                            <label class="layui-form-label">喜宴厅名称:</label>
                            <div class="layui-input-block">
                                <input type="text" id="hall_name_update" name="hallName" placeholder="请输入喜宴厅名称" required lay-verify="required" autocomplete="off"
                                       class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-inline layui-col-md6">
                            <label class = "layui-form-label"><span class = "important">*</span>社区：</label>
                            <div class="layui-input-inline" >
                                <select id="hall_community_update" name="hall_community" lay-filter="firstChoice" >
                                    <option value="">请选择社区</option>
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
                    </div>
                </div>

                <div class="layui-inline layui-col-md6">
                    <div class="layui-row">
                        <label class = "layui-form-label"><span class = "important">*</span>小区：</label>
                        <div class="layui-input-inline" >
                            <select id="hall_house_update" name="hall_house" class="secondChoice">
                                <option value="">请选择小区</option>
                                <#if houseManagerList?exists>
                                    <#list houseManagerList as key>
                                        <option value="${key.getComm_id()}-${key.getHouse_name()}-${key.getHouse_id()}" text="${key.getHouse_name()}">

                                        </option>
                                    </#list>
                                </#if>
                            </select>
                        </div>
                    </div>

                </div>

                <div class="layui-inline layui-col-md6" >
                    <label class="layui-form-label">押金:
                        <span style="color: red">*</span>
                    </label>
                    <div class="layui-input-block">
                        <input type="text" id="hall_deposit_update" name="hall_deposit"
                               placeholder="请输入押金" type="text" required lay-verify="required" autocomplete="off"
                               class="layui-input" >
                    </div>
                </div>


                <div class="layui-inline layui-col-md12">
                    <label class="layui-form-label">地址:</label>
                    <div class="layui-input-block">
                        <input type="text" id="hall_address_update" name="hall_address" placeholder="请输入地址" required lay-verify="required" autocomplete="off"
                               class="layui-input" >
                    </div>

                </div>

                <div class="layui-inline layui-col-md6" >
                    <label class="layui-form-label">总桌数:</label>
                    <div class="layui-input-block">
                        <input class="layui-input layui-disabled" id="hall_table_num_update" name="hall_table_num"
                               style="background-color: whitesmoke" lay-verify="required" autocomplete="off"
                               readonly required>
                    </div>
                </div>

                <div class="layui-inline layui-col-md6" >
                    <label class="layui-form-label">总面积:</label>
                    <div class="layui-input-block">
                        <input class="layui-input layui-disabled" id="hall_area_update" name="hall_area"
                               style="background-color: whitesmoke" lay-verify="required" autocomplete="off"
                               readonly required>
                    </div>
                </div>

                <hr class="layui-border-black" />
                <div class="layui-inline layui-col-md12">
                    <div class="layui-card-header">详细信息
                        <button type="button" id="btnAdd_detail_update" class="layui-btn layui-btn-warm
                            layui-btn-xs">添加信息</button>
                    </div>
                    <div class="layui-card-body">
                        <table class="layui-table" id="hallDetailTableUpdate" lay-filter="hallDetailTable"></table>
                        <div class="layui-form layui-border-box layui-table-view" lay-filter="detailBox" style="height: 250px;">
                            <div class="layui-table-box">
                                <div class="layui-table-header">
                                    <table class="layui-table">
                                        <thead>
                                        <tr>
                                            <th style="width: 100px"><div class="layui-table-cell" align="left">层数</div></th>
                                            <th style="width: 100px"><div class="layui-table-cell" align="left">层/厅</div></th>
                                            <th style="width: 100px"><div class="layui-table-cell" align="left">桌数</div></th>
                                            <th style="width: 100px"><div class="layui-table-cell" align="left">租金(元)</div></th>
                                            <th style="width: 100px"><div class="layui-table-cell" align="left">面积</div></th>
                                            <th style="width: 100px"><div class="layui-table-cell" align="left">操作</div></th>

                                        </tr>
                                        </thead>
                                    </table>
                                </div>

                                <div class="layui-table-body layui-table-main" style="height: 209px;">
                                    <table class="layui-table" id="detailInfoUpdate" lay-filter="test">
                                        <tbody id="detail-info-update">
                                        <#--需要append td, 当点击“添加信息”按钮时-->
                                        <#--用loop得到每个detail Info-->
<#--                                        <#if hallManagerDetailList?exists>-->
<#--                                            <#list hallManagerDetailList as key>-->
<#--                                                <#if key.getHallManager().getHall_id() == -->
<#--                                                <tr>-->
<#--                                                    <td style='width: 100px;'><input class='layui-table-cell'style='width: 80px;' value="${key.getHall_detail_floor()}"></td>-->
<#--                                                </tr>-->
<#--                                            </#list>-->
<#--                                        </#if>-->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>


        </div>

    </div>

    <#--编辑窗口的确认修改和重置buttons-->
    <div class="layui-form-item" style="margin-top:40px">
        <div class="layui-input-block">
            <button  id = "edit-confirm" class="layui-btn  layui-btn-submit " lay-submit="" lay-filter="demo11">确认修改</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>

</form>

<#--自定义新增表格序号-->
<script type="text/html" id="autoId">
    {{d.LAY_TABLE_INDEX+1}}
</script>


<script>

    //新增弹窗: 当点击“添加信息”按钮时，call this function, 必须用id call, 我用class失败了！！
    $('#btnAdd_detail').click(function(){
        var tr = "<tr>"+
            " <td data-field='layer' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-1-layer'style='width: 80px;'></td>"+
            " <td data-field='unit'><div class='layui-table-cell' style='width:85px'>" +
            " <select id='unit-select'><option value='层'>层</option><option value='厅'>厅</option></select>" +
            "</div></td>"+
            " <td data-field='num' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-1-num' style='width: 80px;' align='center'></td>"+
            " <td data-field='rent' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-1-rent' style='width: 80px;' align='center'></td>"+
            " <td data-field='area' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-1-area' style='width: 80px;' align='center'></td>"+
            " <td data-field='delete' data-edit='text' style='width: 100px;' class='detailDel' onclick='del(this)'><div class='layui-table-cell laytable-cell-1-delete'>" +
            " <a type='button' class='layui-btn layui-btn-danger layui-btn-xs'>删除</a>" +
            "</div></td>"+
            "</tr>";
        $('#detail-info').append(tr);

    });

    //编辑弹窗: 当点击“添加信息”按钮时，call this function
    $('#btnAdd_detail_update').click(function(){
        var tr = "<tr>"+
            " <td data-field='layer' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-2-layer'style='width: 80px;'></td>"+
            " <td data-field='unit'><div class='layui-table-cell' style='width:85px'>" +
            " <select id='unit-select2'><option value='层'>层</option><option value='厅'>厅</option></select>" +
            "</div></td>"+
            " <td data-field='num' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-2-num' style='width: 80px;' align='center'></td>"+
            " <td data-field='rent' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-2-rent' style='width: 80px;' align='center'></td>"+
            " <td data-field='area' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-2-area' style='width: 80px;' align='center'></td>"+
            " <td data-field='delete' data-edit='text' style='width: 100px;' class='detailDel' onclick='del(this)'><div class='layui-table-cell laytable-cell-2-delete'>" +
            " <a type='button' class='layui-btn layui-btn-danger layui-btn-xs'>删除</a>" +
            "</div></td>"+
            "</tr>";
        $('#detail-info-update').append(tr);

    });

    //删除hallDetailTable里的一行
    function del(obj){
        $(obj).parent().remove();
    }


    //加载模块
    layui.use(function(){
        //得到各种内置组件
        let table = layui.table
        ,form = layui.form
        ,element = layui.element
        ,$ = layui.$;

        //执行一个table实例
        table.render({
            elem: '#demo2'
            ,url: '/hallManagerGetAll'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,height: 700
            ,width:1200
            , title: '喜宴厅管理表'
            , page: true //开启分页
            //, toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // , totalRow: true //开启合计行
            , cols: [[ //表头

                {field: 'id', title: '序号', width: 80, sort: true, fixed: 'left',templet: '#autoId'}
                ,{field: 'hall_name', title: '喜宴厅名称', width: 100, align: 'left'}
                ,{field: 'hall_area', title: '面积', width: 50, align: 'left'}
                ,{field: 'hall_table_num', title: '桌数', width: 50, align: 'left'}
                ,{field: 'hall_deposit', title: '押金', width: 50, align: 'left'}
                ,{field: 'hall_address', title: '地址', width: 100, align: 'left'}
                // ,{field: '', title:'图片', width: 100}
                ,{field: 'hall_house', title: '小区名称', width: 200, align: 'left'}
                ,{field: 'hall_community', title: '社区名称', width: 200, align: 'left'}
                ,{field: 'modified', title:'操作', width: 200, toolbar:'#barDemo'}
                // 对应上面的id 'barDemo'
            ]]

        });


        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            let data = obj.data;
            switch(obj.event){
                case 'add':
                    //clear all the 小区下拉菜单的options,暂时不要了，看能不能解决bug
                    // var secondSelect = document.getElementById("house_names");
                    // for(var j = 0; j<secondSelect.length; j++){
                    //     secondSelect[j].innerHTML = "";
                    // }

                    layer.open({
                        type: 1,
                        title: ['新增喜宴厅','color:#fff;background-color:#B72523;margin-top:-5px'],
                        area: ['700px', '600px'],
                        shade: 0.8, // 遮罩层透明度
                        resize: true, //是否允许拉伸
                        moveType: 0, //拖拽模式，0或者1
                        offset: 'auto', //默认垂直水平居中
                        content: $('#edit_form'),
                        btn:['确定'],
                        yes:function (index, layero){

                            //抓住下拉菜单中用户选择的社区和小区
                            let myselect = document.getElementById("comm_names");//拿到select对象
                            let index2 = myselect.selectedIndex;//selectedIndex代表的是你所选中项的index
                            let commId = myselect.options[index2].value;//拿到选中项options的value
                            let commName = myselect.options[index2].text;//拿到选中项options的text

                            //PROBLEM: 小区下拉菜单的信息，经常抓不住，出现bug!!!
                            var selectIndex = document.getElementById("house_names").selectedIndex;
                            var houseName = document.getElementById("house_names").options[selectIndex].text;

                            // let myselect2 = document.getElementById("house_names");//拿到select 小区对象
                            // let index3 = myselect2.selectedIndex;
                            // let houseName = myselect2.options[index3].text;


                            //抓住所有inputs
                            let hallName = document.getElementById("hall_name").value; //喜宴厅名称
                            let deposit = document.getElementById("hall_deposit").value;//押金
                            let address = document.getElementById("hall_address").value;//地址

                            //loop hallDetailTable的桌数和面积，累计加起来！
                            let detailTable = document.getElementById("detailInfo"); //抓住hallDetailTable
                            let tds = document.getElementsByTagName('td');
                            let tableTotal = 0;
                            let areaTotal = 0;




                            //用一个array去存detailTable里的东西
                            let arrDetail = [];

                            //得到每一行详细信息的data,然后以集合数据传到后端
                            for(var i = 0; i<detailTable.rows.length; i++){

                                //详细信息的下拉菜单
                                var myselect3 = document.getElementById("unit-select");
                                console.log("myselect3--"+ myselect3);
                                var index4 = myselect3.selectedIndex;
                                //get each Detail data
                                var hall_detail_floor = document.getElementsByClassName("laytable-cell-1-layer")[i].value;
                                var hall_detail_unit = myselect3.options[index4].value;
                                var hall_detail_table_num = document.getElementsByClassName("laytable-cell-1-num")[i].value;
                                var hall_detail_rent = document.getElementsByClassName("laytable-cell-1-rent")[i].value;
                                var hall_detail_area = document.getElementsByClassName("laytable-cell-1-area")[i].value;

                                //TODO: create a hallManagerDetail object, and assign its values
                                var hallDetail = new Object();
                                hallDetail.hall_detail_floor = hall_detail_floor;
                                hallDetail.hall_detail_unit = hall_detail_unit;
                                hallDetail.hall_detail_table_num = hall_detail_table_num;
                                hallDetail.hall_detail_rent = hall_detail_rent;
                                hallDetail.hall_detail_area = hall_detail_area;
                                //push into the array
                                arrDetail.push(hallDetail);

                                //console.log("each row num: " + detailTable.rows[i].cells[2].innerHTML.innerHTML); //third column: 桌数
                                console.log("test num: "+ document.getElementsByClassName("laytable-cell-1-num")[i].value);
                                tableTotal = tableTotal + Number(document.getElementsByClassName("laytable-cell-1-num")[i].value);
                                areaTotal = areaTotal + Number(document.getElementsByClassName("laytable-cell-1-area")[i].value);
                            }

                            console.log("hallName--"+ hallName);
                            console.log("hallCommunity--" + commName);
                            console.log("hallHouse--"+ houseName);
                            console.log("hallAddress--" + address);
                            console.log("hallArea--"+areaTotal);
                            console.log("hallTable--" + tableTotal);
                            console.log("hallDeposit--"+deposit);



                            if(hallName == '' || commName == '' || houseName == '' || deposit == '' || address==''){
                                alert("请输入名称");
                            }else {

                                //const add = document.getElementById("submit_btn");
                                let xhr = new XMLHttpRequest();
                                xhr.open("POST", urlPrefix + "/addHallManager", true);
                                xhr.setRequestHeader("Content-Type", "application/json");
                                let data1 = JSON.stringify({
                                    "hall_name": hallName,
                                    "hall_community": commName,
                                    "hall_house": houseName,
                                    "hall_address": address,
                                    "hall_area": areaTotal,
                                    "hall_table_num": tableTotal,
                                    "hall_deposit": deposit,
                                    "hallManagerDetailList": arrDetail
                                });
                                xhr.send(data1);
                                location.reload();

                            }
                            location.reload(); //reload the window again!

                        }
                    });
            }

        });

        //监听社区下拉菜单的选择
        form.on('select(firstChoice)', function(data){
            //clear all the 小区下拉菜单的options
            var secondSelect = document.getElementById("house_names");
            for(var j = 0; j<secondSelect.length; j++){
                secondSelect[j].innerHTML = "";
            }

            let community = data.value;
            console.log("test--"+community);
            let options = document.getElementById("house_names");
            if(options.length > 0){
                for(let i = 0; i<options.length; i++){

                    var arr = options[i].value.split("-");
                    var commId = arr[0];
                    console.log("commId--" + commId);
                    var houseName = arr[1];
                    var houseId = arr[2];
                    console.log("housename-- " + houseName);
                    if(commId == community){
                        console.log("I reached here!");
                        $('.secondChoice').append("<option value='"+houseId+"'>" + houseName + "<\option>");
                    }
                }

            }else{
                $('.secondChoice').empty();
            }
            form.render();
            layui.form.render("select");


        });


        //监听大table的删除和编辑button
        //监听行工具事件
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'del') {
                //显示出数据库中的对应的comm_id,方便我们删除数据库的这一行
                //console.log("id is: "+ data.hall_name);

                layer.confirm('确认删除吗', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构

                    //向服务端发送删除指令

                    var xhr = new XMLHttpRequest();
                    xhr.open("DELETE", urlPrefix + "/deleteHallbyId/"+data.hall_id);
                    xhr.setRequestHeader("Content-Type", "application/json");
                    xhr.send();

                    location.reload(); //reload the window again!
                    layer.close(index);


                });

            } else if (layEvent === 'edit') {
                layer.msg('编辑操作，当前行 数据库ID:' + data.hall_name);
                //layer.msg('编辑操作，当前行 数据库的detail unit: ' + data.hall_detail_unit); //出不来 undefined
                updateuser(obj, data);

            }
        });


        //TODO: 编辑喜宴厅信息，稍后写
        function updateuser(obj, data) {

            //回填数据到表单
            form.val("aaa", {
                "hall_id": data.hall_id
                , "hallName": data.hall_name
                , "hall_community": data.hall_community
                , "hall_house": data.hall_house
                , "hall_deposit": data.hall_deposit
                , "hall_address": data.hall_address
                , "hall_table_num": data.hall_table_num
                , "hall_area": data.hall_area

            });

            // 清空详细信息的表单，防止累计append!! 很重要！！
            $('#detail-info-update tr').remove();
            // 回填详细数据到表单
            // 通过data.hall_id拿到对应的详细信息List, 然后依次append到table(#detail-info-update)中
            $.get('http://localhost:8080/joinHallManagerInfo', function (responseText) {
                //console.log(responseText.data);
                //use a list to store the data, and loop each data to append the value onto each <td> tag, and then append it to the table
                var arrDetailInfo = responseText.data;
                for (var i = 0; i < arrDetailInfo.length; i++) {
                    //当hall_id一致时，才可以append td
                    if(arrDetailInfo[i].hall_id == data.hall_id){
                        console.log(arrDetailInfo[i].hall_detail_floor);
                        var trUpdate =
                            //"<tbody id='detail-info-update'>" +
                            "<tr>" +
                            " <td data-field='layer' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-2-layer'style='width: 80px;' value='" + arrDetailInfo[i].hall_detail_floor + "'></td>" +
                            " <td data-field='unit'><div class='layui-table-cell' style='width:85px'>" +
                            " <select id='unit-select2'><option value='层'>层</option><option value='厅'>厅</option></select>" +
                            "</div></td>" +
                            " <td data-field='num' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-2-num' style='width: 80px;' align='center' value='" + arrDetailInfo[i].hall_detail_table_num + "'></td>" +
                            " <td data-field='rent' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-2-rent' style='width: 80px;' align='center' value='" + arrDetailInfo[i].hall_detail_rent + "'></td>" +
                            " <td data-field='area' data-edit='text' style='width: 100px;'><input class='layui-table-cell laytable-cell-2-area' style='width: 80px;' align='center' value='" + arrDetailInfo[i].hall_detail_area + "'></td>" +
                            " <td data-field='delete' data-edit='text' style='width: 100px;' class='detailDel' onclick='del(this)'><div class='layui-table-cell laytable-cell-2-delete'>" +
                            " <a type='button' class='layui-btn layui-btn-danger layui-btn-xs'>删除</a>" +
                            "</div></td>" +
                            "</tr>";
                        $('#detailInfoUpdate').append(trUpdate);
                    }

                }


            })

            layer.open({
                //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                type: 1,
                title: ['修改喜宴厅信息', 'color:#fff;background-color:#B72523;margin-top:-5px'],
                area: ['700px', '600px'],
                shade: 0.8, // 遮罩层透明度
                resize: true, //是否允许拉伸
                moveType: 0, //拖拽模式，0或者1
                content: $("#popUpdateTest")//引用的弹出层的页面层的方式加载修改界面表单
            });

            console.log("修改原始数据为：", data);

            //当点击“确认修改”button后，collect each entry's data and update to the backend
            form.on('submit(demo11)', function (massage) {

                console.log("message为：", massage);

                //抓住下拉菜单中用户选择的社区和小区
                let myselectUpdate = document.getElementById("hall_community_update");//拿到select对象
                let index2Update = myselectUpdate.selectedIndex;//selectedIndex代表的是你所选中项的index
                let commIdUpdate = myselectUpdate.options[index2Update].value;//拿到选中项options的value
                let commNameUpdate = myselectUpdate.options[index2Update].text;//拿到选中项options的text
                console.log("hallCommunityUpdate--" + commNameUpdate);


                //SOLVED PROBLEM: 小区下拉菜单的信息，经常抓不住，出现bug!!! SOLVED
                var selectIndexUpdate = document.getElementById("hall_house_update").selectedIndex;
                var houseNameUpdate = document.getElementById("hall_house_update").options[selectIndexUpdate].text;
                console.log("hallHouseUpdate--"+ houseNameUpdate);

                // let myselect2 = document.getElementById("house_names");//拿到select 小区对象
                // let index3 = myselect2.selectedIndex;
                // let houseName = myselect2.options[index3].text;


                //抓住所有inputs
                let hallNameUpdate = document.getElementById("hall_name_update").value; //喜宴厅名称
                console.log("hallNameUpdate--"+ hallNameUpdate);

                let depositUpdate = document.getElementById("hall_deposit_update").value;//押金
                console.log("hallDepositUpdate--"+depositUpdate);

                let addressUpdate = document.getElementById("hall_address_update").value;//地址
                console.log("hallAddressUpdate--" + addressUpdate);


                //loop hallDetailTable的桌数和面积，累计加起来！
                let detailTableUpdate = document.getElementById("detailInfoUpdate"); //抓住hallDetailTable
                let tdsUpdate = document.getElementsByTagName('td');
                let tableTotalUpdate = 0;
                let areaTotalUpdate = 0;


                //用一个array去存detailTable里的东西
                let arrDetailUpdate = [];

                //得到每一行详细信息的data,然后以集合数据传到后端
                for (var i = 0; i < detailTableUpdate.rows.length; i++) {

                    //详细信息的下拉菜单
                    var myselect3Update = document.getElementById("unit-select2");
                    var index4Update = myselect3Update.selectedIndex;
                    //get each Detail data
                    var hall_detail_floorUpdate = document.getElementsByClassName("laytable-cell-2-layer")[i].value;
                    console.log("hall_detail_floorUpdate --- " + hall_detail_floorUpdate);

                    var hall_detail_unitUpdate = myselect3Update.options[index4Update].value;
                    console.log("hall_detail_unitUpdate --- " + hall_detail_unitUpdate);

                    var hall_detail_table_numUpdate = document.getElementsByClassName("laytable-cell-2-num")[i].value;
                    console.log("hall_detail_table_numUpdate --- " + hall_detail_table_numUpdate);

                    var hall_detail_rentUpdate = document.getElementsByClassName("laytable-cell-2-rent")[i].value;
                    console.log("hall_detail_rentUpdate --- " + hall_detail_rentUpdate);

                    var hall_detail_areaUpdate = document.getElementsByClassName("laytable-cell-2-area")[i].value;
                    console.log("hall_detail_areaUpdate --- " + hall_detail_areaUpdate);

                    //TODO: create a hallManagerDetail object, and assign its values
                    var hallDetailUpdate = new Object();
                    hallDetailUpdate.hall_detail_floor = hall_detail_floorUpdate;
                    hallDetailUpdate.hall_detail_unit = hall_detail_unitUpdate;
                    hallDetailUpdate.hall_detail_table_num = hall_detail_table_numUpdate;
                    hallDetailUpdate.hall_detail_rent = hall_detail_rentUpdate;
                    hallDetailUpdate.hall_detail_area = hall_detail_areaUpdate;
                    //push into the array
                    arrDetailUpdate.push(hallDetailUpdate);

                    //console.log("each row num: " + detailTable.rows[i].cells[2].innerHTML.innerHTML); //third column: 桌数
                    console.log("test num: " + document.getElementsByClassName("laytable-cell-2-num")[i].value);
                    tableTotalUpdate = tableTotalUpdate + Number(document.getElementsByClassName("laytable-cell-2-num")[i].value);
                    areaTotalUpdate = areaTotalUpdate + Number(document.getElementsByClassName("laytable-cell-2-area")[i].value);
                }

                console.log("hallNameUpdate--"+ hallNameUpdate);
                console.log("hallCommunityUpdate--" + commNameUpdate);
                console.log("hallHouseUpdate--"+ houseNameUpdate);
                console.log("hallAddressUpdate--" + addressUpdate);
                console.log("hallAreaUpdate--"+areaTotalUpdate);
                console.log("hallTableUpdate--" + tableTotalUpdate);
                console.log("hallDepositUpdate--"+depositUpdate);


                if (hallNameUpdate == '' || commNameUpdate == '' || houseNameUpdate == '' || depositUpdate == '' || addressUpdate == '') {
                    alert("请输入名称");
                } else {

                    //const add = document.getElementById("submit_btn");
                    var xhr = new XMLHttpRequest();
                    xhr.open("PUT", urlPrefix+"/updateHallManager/" + data.hall_id, true);
                    xhr.setRequestHeader("Content-Type", "application/json");
                    let dataUpdate = JSON.stringify({
                        "hall_id": data.hall_id,
                        "hall_name": hallNameUpdate,
                        "hall_community": commNameUpdate,
                        "hall_house": houseNameUpdate,
                        "hall_address": addressUpdate,
                        "hall_area": areaTotalUpdate,
                        "hall_table_num": tableTotalUpdate,
                        "hall_deposit": depositUpdate,
                        "hallManagerDetailList": arrDetailUpdate
                    });
                    xhr.send(dataUpdate);
                    //window.location.reload(); //reload the window again!
                }
                location.reload();
                // })
            });


        }
        })
</script>
