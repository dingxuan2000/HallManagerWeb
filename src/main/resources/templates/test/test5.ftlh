<div class="layui-inline">
    <label class="layui-form-label">代理商</label>
    <div class="layui-input-inline">
        <select name="merchant" id="merchant" value="${pro.merchant_id?default(0)}"  lay-verify="required" lay-search=""
                lay-filter="one_cate">
            <!--<option >请选择</option>-->
        </select>
    </div>

    <!--<div class="layui-form-item">-->
    <label class="layui-form-label"><span style="color:red"></span>商品分类</label>
    <div class="layui-input-inline">
        <select name="protype" id="protype" lay-filter="pid" lay-verify="required"  value="${pro.pro_type?default(0)}" >

            <option value="0">请先选择店铺</option>
        </select>
    </div>
    <!--</div>-->
</div>