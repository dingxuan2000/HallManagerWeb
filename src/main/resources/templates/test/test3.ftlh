<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>


    <form class="layui-form">
        <div class="layui-form-item">
            <input type="text" id="subTitle" name="subTitle" lay-verify="required" class="layui-input">
        </div>
        <div class="layui-form-item">
            <button class="layui-btn" lay-submit lay-filter="formDemo">添加</button>
        </div>
    </form>

    <script>

      form.on('submit(formDemo)', function (data) {
        layer.msg(JSON.stringify(data.field));

        //JSON.stringify(data.field)   这是表单中所有的数据

        var articleFrom = data.field.articleFrom;

        var articleSummary = data.field.articleSummary;

      })
    </script>

</body>
</html>