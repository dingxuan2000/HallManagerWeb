

<form>
    垃圾名称：
    <div class="layui-inline">
        <select id="refusename" name="refusename">
            <option value="">全部</option>
        </select>
    </div>
</form>


<script>
    layui.use(['form', 'table', "laydate", 'layer'], function () {
        var form = layui.form;
        var table = layui.table;
        var layer = layui.layer;

        $.ajax({
            //动态获取下拉选项的接口，返回数据主要是id+name
            url: '/getCommManager2',
            dataType: 'json',
            type: 'get',
            success: function (data) {
                let str="<option value=''>全部</option>";
                for(let i of data){
                    //组装数据
                    str+=`<option value='${i.comm_id}'>${i.comm_name}</option>`;
                }
                //jquery赋值方式
                $("#refusename").html(str);
                //重新渲染生效
                form.render();
            }
        });
    })

</script>