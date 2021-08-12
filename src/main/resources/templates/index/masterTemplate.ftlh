<#macro masterTemplate>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>layout 管理系统大布局 - Layui</title>
        <link rel="stylesheet" href="./layui/css/layui.css">
        <link rel="stylesheet" href="./css/nav.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    </head>

    <body>

    <div class="layui-layout layui-layout-admin">
        <div class="layui-header " style="background-color:rgb(183,36,36) ;">

            <ul class="layui-nav">
                <div class="layui-logo layui-hide-xs" style="width: 500px; font-size: 20px; color: white; ">
                    相城高新区【元和街道】安置小区喜宴厅预定管理平台
                </div>

                <li class="layui-nav-item layui-hide layui-show-md-inline-block layui-layout-right">
                    <a href="javascript:;">
                        <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"
                             class="layui-nav-img">
                        用户名
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="">修改密码</a></dd>
                        <dd><a href="">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <div class="layui-side layui-bg-gray" style="width: 250px; border-right:1px ridge rgb(204,103,103);">
            <div class="layui-side-scroll" style="width: 250px">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree layui-bg-gray my_nav" lay-filter="test" style="width: 250px;">
                    <li class="layui-nav-item show_one"
                        style="border-bottom:1px ridge rgb(204,103,103); border-spacing: 10px; ">
                        <a id="demo" class="nav_parent" href="javascript:;" onclick="changeColor('change_icon1','change_text1','#list1');
                        " style="color: rgb(183,60,78);">
                            <i id="change_icon1" class="layui-icon layui-icon-service icon_li"></i>&nbsp;
                            <span id="change_text1" class="text_color">社区登记</span>

                        </a>
                        <dl id="list1" class="layui-nav-child nav_child">
                            <dd class="nav_child2"><a id="list1_font"
                                                      href="/test.html">
                                    预约信息</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item border_bottom show_one">
                        <a class="nav_parent" href="javascript:;"
                           onclick="changeColor('change_icon2','change_text2','#list2');"
                           style="color: rgb(183,60,78);">
                            <i id="change_icon2" class="layui-icon layui-icon-star-fill icon_li"></i>&nbsp;
                            <span id="change_text2" class="text_color">物业登记</span></a>
                        <dl id="list2" class="layui-nav-child nav_child">
                            <dd class="nav_child2"><a id="list2_font"
                                                      href="javascript:;">预约信息</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item border_bottom">
                        <a class="nav_parent" href="javascript:;"
                           onclick="changeColor('change_icon3','change_text3','#list3');"
                           style="color: rgb(183,60,78);">
                            <i id="change_icon3" class="layui-icon layui-icon-form icon_li"></i>&nbsp;
                            <span id="change_text3" class="text_color">基础数据</span></a>
                        <dl id="list3" class="layui-nav-child nav_child list3_select">
                            <dd id="list3_1" class="nav_child2 list3_one"><a
                                        id="list3_font1" class="left_navigation"
                                        menu_url="/hallManager" menu_name="喜宴厅管理" menu_id="4">喜宴厅管理</a></dd>
                            <dd id="list3_2" class="nav_child2 list3_one"><a
                                        id="list3_font2" class="left_navigation"
                                        menu_url="/hallManagerInfo" menu_name="喜宴厅信息" menu_id="5">喜宴厅信息</a></dd>
                            <dd id="list3_3" class="nav_child2 list3_one"><a
                                        id="list3_font3" href="javascript:;">水电气表</a></dd>
                            <dd id="list3_4" class="nav_child2 list3_one"><a
                                        id="list3_font4" href="javascript:;">预定注意事项</a></dd>

                        </dl>
                    </li>
                    <li class="layui-nav-item border_bottom">
                        <a class="nav_parent" href="javascript:;"
                           onclick="changeColor('change_icon4','change_text4','#list4');"
                           style="color: rgb(183,60,78);">
                            <i id="change_icon4" class="layui-icon layui-icon-chart-screen icon_li"></i>&nbsp;
                            <span id="change_text4" class="text_color">统计报表</span></a>
                        <dl id="list4" class="layui-nav-child nav_child">
                            <dd class="nav_child2"><a id="list4_font1"
                                                      href="javascript:;">租金统计</a></dd>
                            <dd class="nav_child2"><a id="list4_font2"
                                                      href="javascript:;">费用统计</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item border_bottom arrow_color">
                        <a class="nav_parent" href="javascript:;"
                           onclick="changeColor('change_icon5','change_text5','#list5');"
                           style="color: rgb(183,60,78);">
                            <i id="change_icon5" class="layui-icon layui-icon-set-fill icon_li"></i>&nbsp;
                            <span id="change_text5" class="text_color">系统设置</span></a>
                        <dl id="list5" class="layui-nav-child nav_child">
                            <dd class="nav_child2"><a id="list5_font1" lay-href="/commManager" class="left_navigation"
                                                      menu_url="/commManager" menu_name="社区管理" menu_id="2"
                                                     >社区管理</a></dd>
                            <dd class="nav_child2"><a id="list5_font2" lay-href="/houseManager" class="left_navigation"
                                                      menu_url="/houseManager" menu_name="小区管理" menu_id="3"
                                                      >小区管理</a></dd>
                            <dd class="nav_child2"><a id="list5_font3"
                                                      href="javascript:;">账户设置</a></dd>
                            <dd class="nav_child2"><a id="list5_font4"
                                                      href="/charge">收费类型</a></dd>
                            <dd class="nav_child2"><a id="list5_font5"
                                                      href="javascript:;">预留时间标准</a></dd>
                        </dl>
                    </li>

                </ul>
            </div>
        </div>


        <#--layui body-->
        <div class="layui-body" style="left: 250px; top: 20px;">
<#--            <!-- 内容主体区域 &ndash;&gt;-->
            <div class="layui-tab layui-tab-card" lay-filter="head_tabs" lay-allowclose="true">
                <ul class="layui-tab-title" style="position: fixed;">
<#--                    <li class="layui-icon layui-icon-prev" ></li>-->
<#--                    <li class="layui-icon layui-icon-home"></li>-->

                    <#--                    <li class="layui-this">-->
<#--                        <div class="layui-icon layui-icon-home"></div>-->
<#--                    </li>-->

<#--                    <li lay-id="33">社区管理</li>-->
<#--                    <li lay-id="44">小区管理</li>-->
                </ul>


                <div class="layui-tab-content" style="height: 900px;">
                    <!--子页面区域-->
<#--                    <iframe id="commManage" class="layui-tab-item layui-show" src="" style="width: 1000px; height: 800px;">社区管理页面</iframe>-->
<#--                    <iframe class="layui-tab-item" src="/houseManager">小区管理页面</iframe>-->


                    <!--社区管理tab的iframe子页面-->
<#--                    <table class="layui-hide" id="demo2" lay-filter="test"></table>-->
                </div>


            </div>

        </div>


        <div class="layui-footer "
             style="left: 250px;background-color: white; box-shadow: 0 1px 2px 0 rgb(0 0 0);">
            Copyright&#169; 2021 苏州市相城元惠物业管理有限公司 版权所有

        </div>
    </div>

    <script src="./layui/layui.js"></script>
    <script src="./js/index.js"></script>

    <script>
        layui.use('element', function(){
            //Tab的切换功能，切换事件监听等，需要依赖element模块
            var $ = layui.jquery
                ,element = layui.element;

            //触发事件
            var active = {
                tabAdd: function(){
                    //新增一个Tab项
                    var menu_url=$(this).attr('menu_url');
                    var menu_name=$(this).attr('menu_name');
                    var menu_id=$(this).attr('menu_id');
                    //先判断是否已经有了tab
                    var arrayObj = new Array();　//创建一个数组
                    $(".layui-tab-title").find('li').each(function() {
                        var y = $(this).attr("lay-id");
                        arrayObj.push(y);
                    });
                    var have=$.inArray(menu_id, arrayObj);
                    if (have>=0) {
                        //tab已有标签
                        console.log('I am in the first case!');
                        element.tabChange('head_tabs', menu_id); //切换到当前点击的页面
                    } else{
                        //没有相同tab
                        console.log('I am in the second case!');
                        console.log('The passed url is: '+menu_url);
                        element.tabAdd('head_tabs', {
                            title:menu_name
                            ,content: '<iframe style="width: 100%;height: 800px; margin-top: 20px" scrolling="no" src='+menu_url+' ></iframe>'
                            ,id: menu_id
                        })
                        element.tabChange('head_tabs', menu_id); //切换到当前点击的页面
                    }
                }

            };

            element.on('tab(head_tabs)', function(data){
                var lay_id=$(this).attr("lay-id");
                var nav_tree=$(".layui-nav-tree");
                //移除其他选中
                nav_tree.find("a[menu_id]").parent().removeClass("layui-this");
                //选中点击的
                var kv="a[menu_id='"+lay_id+"']";
                nav_tree.find(kv).parent().addClass("layui-this")
            });

            $(".left_navigation").click(function(){
                var type="tabAdd";
                var othis = $(this);
                active[type] ? active[type].call(this, othis) : '';
            });

        });


    </script>

    </body>

    </html>
</#macro>