<link rel="stylesheet" href="./layui/css/layui.css">
<link rel="stylesheet" href="./css/nav.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./layui/layui.js"></script>

<!-- 商品列表部分 -->
<div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-header layui-bg-black">商品清单</div>
            <div class="layui-card-body">
                <table id="product_list" lay-filter="product_list">
                    <div class="layui-input-inline">
                        <div id="test-laydate-normElem" style="height: 38px; line-height: 38px; cursor: pointer; border-bottom: 1px solid #e2e2e2;" lay-key="14"></div>
                    </div>
                    <thead>
                    <tr>
                        <th lay-data="{field:'prodId', width:100}">商品编号</th>
                        <th lay-data="{field:'prodName', width:160}">商品名称</th>
                        <th lay-data="{field:'prodUnit', width:100}">单位</th>
                        <th lay-data="{field:'prodUnitPrice', width:100}">单价</th>
                        <th lay-data="{field:'prodNum', width:100}">数量</th>
                        <th lay-data="{field:'prodTotalPrice', width:150}">金额</th>
                        <th lay-data="{field:'prodRemark', width:250}">单据备注</th>
                        <th lay-data="{fixed : 'right', title :'操作',toolbar : '#prodlist-table-tool', width : 150}"></th>
                    </tr>
                    </thead>
                    <tbody id = "prodTd">
                    </tbody>
                </table>
            </div>

            <div class="layui-card">
                <!-- 3号表单 -->
                <form id="product_submit" class="layui-form layui-card-header layuiadmin-card-header-auto">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label"><h4>付款金额</h4></label>
                            <div class="layui-input-block">
                                <input id = "prodTotalPrice" type="text" name="needPay" placeholder="请输入"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">退款账户</label>
                            <div class="layui-input-block">
                                <input type="text" id="accountName" name="accountName"
                                       lay-filter="accountName" placeholder="请输入" autocomplete="off"
                                       class="layui-input">
                                <input type="hidden" id="accountId"
                                       name="accountId" lay-filter="accountId">
                            </div>
                        </div>
                        <!-- layui-inline -->
                        <div class="layui-inline">
                            <button id="product_submit" lay-submit lay-filter="product_submit" class="layui-btn layui-btn-normal">销售退货申请</button>
                            <button class="layui-btn layui-btn-warm">再此申请</button>
                        </div>
                    </div>
                    <!-- form-item -->
                </form>
                <!-- ./3号表单  -->
                <div class="layui-card-body"></div>
                <!-- card-body -->
            </div>
        </div>
    </div>
</div>
</div>
</div>

<script>
    form.on('submit(product_submit)', function () {

        var handlerId = $('#employeeId').val();
        var fromCompanyId = $('#companyId').val();
        var warehouseid = $('#houseId').val();
        var accountId = $('#accountId').val();
        var billRemark = $('#remarkName').val();
        var prodTotalPrice1 = 0;

        var tr = $("#prodTd tr");
        for (var i = 0; i <tr.length; i++) {
            var tds = $(tr[i]).find("td");
            var result= new Object();

            result.prodNumber = tds.eq(4).text(),
                result.prodPrice = tds.eq(3).text(),
                prodTotalPrice1 += Number(tds.eq(5).text()),
                result.prodTotalPrice=prodTotalPrice1,
                result.remark = tds.eq(6).text(),
                result.productId = tds.eq(0).text(),

                billDetailList.push(result);
            $('#prodTotalPrice').val(prodTotalPrice);

        }
        var bill = {billRemark,	prodTotalPrice,accountId,fromCompanyId,handlerId,warehouseid};
        bill.saleReturnBillDetailVOList = billDetailList;

        var saleReturnBillTotalVO = JSON.stringify(bill);

        $('#prodTotalPrice').val(prodTotalPrice);

        $.ajax({
            url: context_path + '/saleReturnBill/saveBill',
            type: "post",
            contentType : "application/json;charsetset=UTF-8",//必须
            data: saleReturnBillTotalVO,
            dataType: 'json',
            success: function () {
                layer.open({
                    content: '<h2>申请提交成功</h2>',
                    yes: function(index, layero){
                        //do something
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    }
                });

            },
            error: function(){
                layer.open({
                    content: '<h2>申请提交失败</h2>',
                    yes: function(index, layero){
                        //do something
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    }
                });
            }
        });

        return false;
    });

</script>
