<#--<!DOCTYPE html>-->
<#--<html>-->
<#--<head>-->
<#--    <meta charset="utf-8">-->
<#--    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">-->
<#--    <title>hhh</title>-->
<#--    <!-- layui的样式包 &ndash;&gt;-->
<#--    <link rel="stylesheet" href="./layui/css/layui.css" media="all"/>-->
<#--    <!-- layui的js,模块化使用 &ndash;&gt;-->
<#--    <script type="text/javascript" src="./layui/layui.js"></script>-->
<#--</head>-->
<#--<body class="layui-layout-body">-->
<#--<div class="layui-layout layui-layout-admin">-->
<#--    <div class="layui-header">-->
<#--        <div class="layui-logo">hhh</div>-->
<#--        <!-- 头部区域（可配合layui已有的水平导航） &ndash;&gt;-->
<#--        <ul class="layui-nav layui-layout-left">-->
<#--            <li class="layui-nav-item"><a href="">控制台</a></li>-->
<#--            <li class="layui-nav-item"><a href="">商品管理</a></li>-->
<#--            <li class="layui-nav-item"><a href="">用户</a></li>-->
<#--            <li class="layui-nav-item">-->
<#--                <a href="javascript:;">其它系统</a>-->
<#--                <dl class="layui-nav-child">-->
<#--                    <dd><a href="">邮件管理</a></dd>-->
<#--                    <dd><a href="">消息管理</a></dd>-->
<#--                    <dd><a href="">授权管理</a></dd>-->
<#--                </dl>-->
<#--            </li>-->
<#--        </ul>-->
<#--        <ul class="layui-nav layui-layout-right">-->
<#--            <li class="layui-nav-item">-->
<#--                <a href="javascript:;">-->
<#--                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">-->
<#--                    贤心-->
<#--                </a>-->
<#--                <dl class="layui-nav-child">-->
<#--                    <dd><a href="">基本资料</a></dd>-->
<#--                    <dd><a href="">安全设置</a></dd>-->
<#--                </dl>-->
<#--            </li>-->
<#--            <li class="layui-nav-item"><a href="">退了</a></li>-->
<#--        </ul>-->
<#--    </div>-->

<#--    <div class="layui-side layui-bg-black">-->
<#--        <div class="layui-side-scroll">-->
<#--            <!-- 左侧导航区域 freemark渲染 3层 &ndash;&gt;-->
<#--            <ul class="layui-nav layui-nav-tree" lay-filter="admin-side-nav" style="margin-top: 15px;">-->
<#--                <li class="layui-nav-item layui-nav-itemed">-->
<#--                    <a><i class="icon"></i><cite>基本资源管理</cite><span class="layui-nav-more"></span></a>-->
<#--                    <dl class="layui-nav-child">-->
<#--                        <dd><a lay-href="javascript:" class="left_navigation" menu_url="/commManager" menu_name="用户管理" menu_id="2">用户管理</a></dd>-->
<#--                        <dd><a lay-href="javascript:" class="left_navigation" menu_url="/admin/pages/menu/index" menu_name="菜单管理" menu_id="4">菜单管理</a></dd>-->
<#--                        <dd><a lay-href="javascript:" class="left_navigation" menu_url="/admin/pages/role/index" menu_name="角色管理" menu_id="5">角色管理</a></dd>-->
<#--                    </dl>-->
<#--                </li>-->
<#--                <li class="layui-nav-item">-->
<#--                    <a lay-href="javascript:"><i class="icon"></i> <cite>日志管理</cite></a>-->
<#--                </li>-->
<#--            </ul>-->
<#--            <span class="layui-nav-bar" style="top: 187.5px; height: 0px; opacity: 0;"></span></ul>-->
<#--        </div>-->
<#--    </div>-->
<#--    <!-- 内容主体区域 &ndash;&gt;-->
<#--    <div class="layui-body">-->
<#--        <div class="layui-body">-->
<#--            <!--tabs标签&ndash;&gt;-->
<#--            <div class="layui-tab layui-tab-card" lay-filter="head_tabs" lay-allowclose="true">-->
<#--                <ul class="layui-tab-title">-->
<#--                    <!--   <li class="layui-this">test</li>&ndash;&gt;-->
<#--                </ul>-->
<#--                <div class="layui-tab-content" style="height: 150px;">-->
<#--                    <!--<div class="layui-tab-item layui-show">-->
<#--                    </div>&ndash;&gt;-->
<#--                    <!--<div class="layui-tab-item">-->
<#--                        <iframe  style="width: 100%;height: 100%;" scrolling="no" src="test.html" ></iframe>-->
<#--                    </div>&ndash;&gt;-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->

<#--        <div class="layui-footer">-->
<#--            <!-- 底部固定区域 &ndash;&gt;-->
<#--            © layui.com - 底部固定区域-->
<#--        </div>-->
<#--    </div>-->

<#--    <script>-->
<#--        layui.use('element', function(){-->
<#--            //Tab的切换功能，切换事件监听等，需要依赖element模块-->
<#--            var $ = layui.jquery-->
<#--                ,element = layui.element;-->

<#--            //触发事件-->
<#--            var active = {-->
<#--                tabAdd: function(){-->
<#--                    //新增一个Tab项-->
<#--                    var menu_url=$(this).attr('menu_url');-->
<#--                    var menu_name=$(this).attr('menu_name');-->
<#--                    var menu_id=$(this).attr('menu_id')-->
<#--                    //先判断是否已经有了tab-->
<#--                    var arrayObj = new Array();　//创建一个数组-->
<#--                    $(".layui-tab-title").find('li').each(function() {-->
<#--                        var y = $(this).attr("lay-id");-->
<#--                        arrayObj.push(y);-->
<#--                    });-->
<#--                    var have=$.inArray(menu_id, arrayObj);-->
<#--                    if (have>=0) {-->
<#--                        //tab已有标签-->
<#--                        element.tabChange('head_tabs', menu_id); //切换到当前点击的页面-->
<#--                    } else{-->
<#--                        //没有相同tab-->
<#--                        element.tabAdd('head_tabs', {-->
<#--                            title:menu_name-->
<#--                            ,content: '<iframe style="width: 100%;height: 800px;" scrolling="no" src='+menu_url+' ></iframe>'-->
<#--                            ,id: menu_id-->
<#--                        })-->
<#--                        element.tabChange('head_tabs', menu_id); //切换到当前点击的页面-->
<#--                    }-->
<#--                }-->

<#--            };-->

<#--            element.on('tab(head_tabs)', function(data){-->
<#--                var lay_id=$(this).attr("lay-id");-->
<#--                var nav_tree=$(".layui-nav-tree");-->
<#--                //移除其他选中-->
<#--                nav_tree.find("a[menu_id]").parent().removeClass("layui-this");-->
<#--                //选中点击的-->
<#--                var kv="a[menu_id='"+lay_id+"']";-->
<#--                nav_tree.find(kv).parent().addClass("layui-this")-->
<#--            });-->

<#--            $(".left_navigation").click(function(){-->
<#--                var type="tabAdd";-->
<#--                var othis = $(this);-->
<#--                active[type] ? active[type].call(this, othis) : '';-->
<#--            });-->

<#--        });-->
<#--    </script>-->
<#--</div>-->
<#--</body>-->
<#--</html>-->