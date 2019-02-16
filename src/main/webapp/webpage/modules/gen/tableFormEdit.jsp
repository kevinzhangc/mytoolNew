<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>
<html>
<head>
    <title>表生成管理</title>
    <meta name="decorator" content="ani"/>
    <script type="text/javascript">

        $(document).ready(function () {
            $('input.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });

        function save() {
            var isValidate = jp.validateForm('#inputForm');//校验表单
            if (!isValidate) {
                return false;
            } else {
                jp.loading();
                jp.post("${ctx}/gentable/genTable/save", $('#inputForm').serialize(), function (data) {
                    if (data.success) {
                        jp.getParent().refresh();
                        var dialogIndex = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                        parent.layer.close(dialogIndex);
                        jp.success(data.msg)

                    } else {
                        jp.error(data.msg);
                    }
                })
            }

        }
    </script>
</head>
<body class="bg-white">
<form id="inputForm" class="form-horizontal" action="/jeeplus/a/gen/genTable/save" method="post"
      novalidate="novalidate">
    <input id="id" name="id" type="hidden" value="">
    <input id="isSync" name="isSync" type="hidden" value="">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td class="width-15 active"><label class="pull-right"><font color="red">*</font>表名:</label></td>
            <td class="width-35">
                <input id="name" name="name" class="form-control required isRightfulString" type="text"
                       value="${genTable.name}" maxlength="200" aria-required="true">
            </td>
            <td class="width-15 active"><label class="pull-right"><font color="red">*</font>说明:</label></td>
            <td class="width-35">
                <input id="comments" name="comments" class="form-control required" type="text"
                       value="${genTable.comments}" maxlength="200" aria-required="true">
            </td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right"><font color="red">*</font>主键策略:</label></td>
            <td class="width-35">
                <select id="genIdType" name="genIdType" class="form-control m-b">
                    <option value="1" <c:if test="${genTable.genIdType ==1}">selected</c:if>>UUID</option>
                    <option value="2" <c:if test="${genTable.genIdType ==2}">selected</c:if>>自增长</option>
                </select>
            </td>
            <td class="width-15 active"></td>
            <td class="width-35">
            </td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right">表类型</label></td>
            <td class="width-35">
                <select id="tableType" name="tableType" class="form-control m-b">
                    <option value="0" <c:if test="${genTable.tableType =='0'}">selected</c:if>>单表</option>
                    <option value="1" <c:if test="${genTable.tableType =='1'}">selected</c:if>>主表</option>
                    <option value="2" <c:if test="${genTable.tableType =='2'}">selected</c:if>>附表</option>
                    <option value="3" <c:if test="${genTable.tableType =='3'}">selected</c:if>>树结构表</option>
                    <option value="4" <c:if test="${genTable.tableType =='4'}">selected</c:if>>左树(主表)</option>
                    <option value="5" <c:if test="${genTable.tableType =='5'}">selected</c:if>>右表(附表)</option>
                </select>
                <span class="help-inline">如果是附表，请指定主表表名和当前表的外键</span>
            </td>
            <td class="width-15 active"><label class="pull-right"><font color="red">*</font>类名:</label></td>
            <td class="width-35">
                <input id="className" name="className" class="form-control required" type="text"
                       value="${genTable.className}" maxlength="200" aria-required="true">
            </td>

        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right">主表表名:</label></td>
            <td class="width-35">
                <select id="parentTable" name="parentTable" class="form-control">
                    <option value="">无</option>
                    <%--<option value="gen_scheme">gen_scheme  :  生成方案</option>--%>
                    <%--<option value="gen_table">gen_table  :  业务表</option>--%>
                    <%--<option value="gen_table_column">gen_table_column  :  业务表字段</option>--%>
                    <%--<option value="gen_template">gen_template  :  代码模板表</option>--%>
                    <%--<option value="test_activiti_audit">test_activiti_audit  :  薪酬调整申请</option>--%>
                    <%--<option value="test_activiti_expense">test_activiti_expense  :  费用报销申请</option>--%>
                    <%--<option value="test_activiti_leave">test_activiti_leave  :  请假流程表</option>--%>
                    <%--<option value="test_car">test_car  :  车辆</option>--%>
                    <%--<option value="test_car_kind">test_car_kind  :  车系</option>--%>
                    <%--<option value="test_category">test_category  :  商品类型</option>--%>
                    <%--<option value="test_continent">test_continent  :  五大洲</option>--%>
                    <%--<option value="test_country">test_country  :  国家</option>--%>
                    <%--<option value="test_course">test_course  :  课程</option>--%>
                    <%--<option value="test_data_child">test_data_child  :  火车票</option>--%>
                    <%--<option value="test_data_child2">test_data_child2  :  飞机票</option>--%>
                    <%--<option value="test_data_child3">test_data_child3  :  汽车票</option>--%>
                    <%--<option value="test_data_main">test_data_main  :  票务代理</option>--%>
                    <%--<option value="test_goods">test_goods  :  商品</option>--%>
                    <%--<option value="test_leave">test_leave  :  请假单</option>--%>
                    <%--<option value="test_note">test_note  :  富文本测试</option>--%>
                    <%--<option value="test_pic">test_pic  :  图片管理</option>--%>
                    <%--<option value="test_student">test_student  :  学生</option>--%>
                    <%--<option value="test_student_course">test_student_course  :  学生课程记录</option>--%>
                    <%--<option value="test_tree">test_tree  :  组织机构</option>--%>
                    <%--<option value="test_tuofeng">test_tuofeng  :  驼峰测试; InnoDB free: 33792 kB</option>--%>
                    <%--<option value="test_validation">test_validation  :  校验测试表单</option>--%>
                </select>
            </td>
            <td class="width-15 active"><label class="pull-right">当前表外键：</label></td>
            <td class="width-35">
                <input id="parentTableFk" name="parentTableFk" class="form-control" type="text"
                       value="${genTable.parentTableFk}" maxlength="200">
            </td>
        </tr>

        </tbody>
    </table>
    <button class="btn btn-white btn-sm" onclick="return addColumn()"><i class="fa fa-plus"> 增加</i></button>
    <button class="btn btn-white btn-sm" onclick="return delColumn()"><i class="fa fa-minus"> 删除</i></button>
    <br>

    <div class="tabs-container">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 数据库属性</a>
            </li>
            <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">页面属性</a>
            </li>
            <li class=""><a data-toggle="tab" href="#tab-4" aria-expanded="false">页面校验</a>
            </li>
            <li class=""><a data-toggle="tab" href="#tab-3" aria-expanded="false">grid选择框（自定义java对象）</a>
            </li>

            <li class="dropdown pull-right hide tabdrop tab-drop"><a class="dropdown-toggle" data-toggle="dropdown"
                                                                     href="#"><i
                    class="glyphicon glyphicon-align-justify"></i><b class="caret"></b></a>
                <ul class="dropdown-menu"></ul>
            </li>
        </ul>
        <div class="tab-content">
            <div id="tab-1" class="tab-pane active">
                <div class="panel-body">
                    <table id="contentTable1"
                           class="table table-striped table-bordered table-hover  dataTables-example dataTable">
                        <thead>
                        <tr style="cursor: move;">
                            <th width="40px">序号</th>
                            <th>操作</th>
                            <th title="数据库字段名">列名</th>
                            <th title="默认读取数据库字段备注">说明</th>
                            <th title="数据库中设置的字段类型及长度">物理类型</th>
                            <th title="是否是数据库主键">主键</th>
                            <!-- <th title="字段是否可为空值，不可为空字段自动进行空值验证">可空</th> -->
                            <!--<th title="选中后该字段被加入到insert语句里">插入</th>
                            <th title="选中后该字段被加入到update语句里">编辑</th>  -->
                        </tr>
                        </thead>
                        <tbody>

                        <!-- id -->
                        <c:forEach items="${genTable.columnList}" var="columnList" varStatus="item">
                            <tr style="cursor: move;">
                                <td>
                                    <input type="hidden" name="columnList['${item.index}'].sort"
                                           value="${columnList.sort}" maxlength="200"
                                           class="form-control required   digits" aria-required="true">
                                    <label>${item.index}</label>
                                    <input type="hidden" name="columnList['${item.index}'].isInsert"
                                           value="${columnList.sort}">
                                    <input type="hidden" name="columnList['${item.index}'].isEdit"
                                           value="${columnList.isEdit}">
                                </td>
                                <td>
                                    <label class="bootstrap-table-checkbox"><input type="checkbox"
                                                                                   name="ck"><span> </span></label>
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="columnList['${item.index}'].name"
                                           value="${columnList.name}">
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="columnList['${item.index}'].comments"
                                           value="${columnList.comments}" maxlength="200">
                                </td>
                                <td>
                                    <select id="columnList['${item.index}'].jdbcType"
                                            name="columnList['${item.index}'].jdbcType"
                                            class="form-control required  m-b" aria-required="true">
                                        <option value="varchar(64)"
                                                <c:if test="${columnList.jdbcType =='varchar(64)'}">selected</c:if>>
                                            varchar(64)
                                        </option>
                                        <option value="nvarchar(64)"
                                                <c:if test="${columnList.jdbcType =='nvarchar(64)'}">selected</c:if>>
                                            nvarchar(64)
                                        </option>
                                        <option value="integer"
                                                <c:if test="${columnList.jdbcType =='integer'}">selected</c:if>>integer
                                        </option>
                                        <option value="double"
                                                <c:if test="${columnList.jdbcType =='double'}">selected</c:if>>double
                                        </option>
                                        <option value="datetime"
                                                <c:if test="${columnList.jdbcType =='datetime'}">selected</c:if>>
                                            datetime
                                        </option>
                                        <option value="longblob"
                                                <c:if test="${columnList.jdbcType =='longblob'}">selected</c:if>>
                                            longblob
                                        </option>
                                        <option value="longtext"
                                                <c:if test="${columnList.jdbcType =='longtext'}">selected</c:if>>
                                            longtext
                                        </option>
                                    </select>
                                </td>
                                <td>
                                        <input type="checkbox" class="i-checks" name="columnList['${item.index}'].isPk" value="${columnList.isPk}" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="tab-2" class="tab-pane">
                <div class="panel-body">
                    <table id="contentTable2"
                           class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                        <thead>
                        <tr>
                            <th title="数据库字段名" width="15%">列名</th>
                            <th title="默认读取数据库字段备注">说明</th>
                            <th title="实体对象的属性字段类型" width="15%">Java类型</th>
                            <th title="实体对象的属性字段（对象名.属性名|属性名2|属性名3，例如：用户user.id|name|loginName，属性名2和属性名3为Join时关联查询的字段）">
                                Java属性名称 <i class="icon-question-sign"></i></th>
                            <th title="选中后该字段被加入到查询列表里">表单</th>
                            <th title="选中后该字段被加入到查询列表里">列表</th>
                            <th title="选中后该字段被加入到查询条件里">查询</th>
                            <th title="该字段为查询字段时的查询匹配放松" width="15%">查询匹配方式</th>
                            <th title="字段在表单中显示的类型" width="15%">显示表单类型</th>
                            <th title="显示表单类型设置为“下拉框、复选框、点选框”时，需设置字典的类型">字典类型</th>
                        </tr>
                        </thead>
                        <tbody>


                        <!-- id -->
                        <c:forEach items="${genTable.columnList}" var="columnList" varStatus="item">
                            <tr>
                                <td>
                                    <input type="text" class="form-control" readonly="readonly"
                                           name="page-columnList['${item.index}'].name" value="${columnList.name}">
                                </td>
                                <td>
                                    <input type="text" class="form-control"
                                           name="page-columnList['${item.index}'].comments"
                                           value="${columnList.comments}" maxlength="200" readonly="readonly">
                                </td>
                                <td>
                                    <select name="columnList['${item.index}'].javaType"
                                            class="form-control required m-b" aria-required="true">

                                        <option value="String" selected="" title="">String</option>

                                        <option value="Long" title="">Long</option>

                                        <option value="Integer" title="">Integer</option>

                                        <option value="Double" title="">Double</option>

                                        <option value="java.util.Date" title="">Date</option>

                                        <option value="com.jeeplus.modules.sys.entity.User" title="">User</option>

                                        <option value="com.jeeplus.modules.sys.entity.Office" title="">Office</option>

                                        <option value="com.jeeplus.modules.sys.entity.Area" title="">Area</option>

                                        <option value="This" title="生成当前对象">ThisObj</option>

                                        <option value="com.jeeplus.modules.test.activiti.entity.TestAudit" title="">
                                            TestAudit
                                        </option>

                                    </select>
                                </td>
                                <td>
                                    <input type="text" name="columnList['${item.index}'].javaField"
                                           value="${columnList.javaField}" maxlength="200"
                                           class="form-control required " aria-required="true">
                                </td>
                                <td>
                              <input
                                            type="checkbox" class="i-checks" name="columnList['${item.index}'].isForm"
                                            value="${columnList.isForm}"
                                            style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;">

                                </td>
                                <td>
                                   <input
                                            type="checkbox" class="i-checks" name="columnList['${item.index}'].isList"
                                            value="${columnList.isList}"
                                            style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;">
                                </td>
                                <td>
                               <input
                                            type="checkbox" class="i-checks" name="columnList['${item.index}'].isQuery"
                                            value="${columnList.isQuery}"
                                            style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;">
                                </td>
                                <td>
                                    <select name="columnList['${item.index}'].queryType"
                                            class="form-control required  m-b" aria-required="true">

                                        <option value="=" title="">=</option>

                                        <option value="!=" title="">!=</option>

                                        <option value=">" title="">&gt;</option>

                                        <option value=">=" title="">&gt;=</option>

                                        <option value="<" title="">&lt;</option>

                                        <option value="<=" title="">&lt;=</option>

                                        <option value="between" title="">Between</option>

                                        <option value="like" title="">Like</option>

                                        <option value="left_like" title="">Left Like</option>

                                        <option value="right_like" title="">Right Like</option>

                                    </select>
                                </td>
                                <td>
                                    <select name="columnList['${item.index}'].showType"
                                            class="form-control required  m-b" aria-required="true">

                                        <option value="input" title="">单行文本</option>

                                        <option value="textarea" title="">多行文本</option>

                                        <option value="umeditor" title="">富文本编辑器</option>

                                        <option value="select" title="">下拉选项</option>

                                        <option value="radiobox" title="">单选按钮</option>

                                        <option value="checkbox" title="">复选框</option>

                                        <option value="dateselect" title="">日期选择</option>

                                        <option value="userselect" title="">人员选择</option>

                                        <option value="officeselect" title="">部门选择</option>

                                        <option value="areaselect" title="">区域选择</option>

                                        <option value="cityselect" title="">省市区三级联动</option>

                                        <option value="treeselect" title="">树选择控件</option>

                                        <option value="fileselect" title="">文件上传选择</option>

                                        <option value="gridselect" title="">grid选择框</option>

                                    </select>
                                </td>
                                <td>
                                    <input type="text" name="columnList['${item.index}'].dictType"
                                           value="${columnList.dictType}" maxlength="200" class="form-control">
                                </td>

                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>
            </div>

            <div id="tab-3" class="tab-pane">
                <div class="panel-body">
                    <table id="contentTable3"
                           class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                        <thead>
                        <tr>
                            <th title="数据库字段名" width="15%">列名</th>
                            <th title="默认读取数据库字段备注">说明</th>
                            <th title="实体对象的属性字段说明">JAVA属性标签(例如：名字|年龄|备注)<i class="icon-question-sign"></i></th>
                            <th title="选中后该字段被加入到查询列表里">JAVA属性名称(例如：name|age|remarks)</th>
                            <th title="选中后该字段被加入到查询列表里">检索标签(例如：名字|年龄)</th>
                            <th title="选中后该字段被加入到查询条件里">检索key(例如：name|age)</th>

                        </tr>
                        </thead>
                        <tbody>


                        <!-- id -->
                        <c:forEach items="${genTable.columnList}" var="columnList" varStatus="item">
                        <tr>
                            <td>
                                <input type="text" class="form-control" readonly="readonly"
                                       name="page-columnList['${item.index}'].name" value="id">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="page-columnList['${item.index}'].comments"
                                       value="${columnList.comments}" maxlength="200" readonly="readonly">
                            </td>
                            <td>
                                <input type="text" name="columnList['${item.index}'].fieldLabels" value=""
                                       maxlength="200" class="form-control  ">
                            </td>
                            <td>
                                <input type="text" name="columnList['${item.index}'].fieldKeys" value="" maxlength="200"
                                       class="form-control  ">
                            </td>
                            <td>
                                <input type="text" name="columnList['${item.index}'].searchLabel" value=""
                                       maxlength="200" class="form-control  ">
                            </td>
                            <td>
                                <input type="text" name="columnList['${item.index}'].searchKey" value="" maxlength="200"
                                       class="form-control  ">
                            </td>


                        </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>


            <div id="tab-4" class="tab-pane">
                <div class="panel-body">
                    <table id="contentTable4"
                           class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                        <thead>
                        <tr>
                            <th title="数据库字段名" width="15%">列名</th>
                            <th title="默认读取数据库字段备注">说明</th>
                            <th title="字段是否可为空值，不可为空字段自动进行空值验证">可空</th>
                            <th title="校验类型">校验类型<i class="icon-question-sign"></i></th>
                            <th title="最小长度">最小长度</th>
                            <th title="最大长度">最大长度</th>
                            <th title="最小值">最小值</th>
                            <th title="最大值">最大值</th>
                        </tr>
                        </thead>
                        <tbody>


                        <!-- id -->
                        <c:forEach items="${genTable.columnList}" var="columnList" varStatus="item">
                            <tr>
                                <td>
                                    <input type="text" class="form-control" readonly="readonly"
                                           name="page-columnList['${item.index}'].name" value="${columnList.name}">
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="page-columnList['${item.index}'].comments"
                                           value="${columnList.comments}" maxlength="200" readonly="readonly">
                                </td>
                                <td>
                                    <input type="checkbox"
                                              class="i-checks"
                                              name="columnList['${item.index}'].isNull"
                                              value="${columnList.isNull}"
                                              style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;">

                                </td>
                                <td>
                                    <select name="columnList['${item.index}'].validateType" class="form-control m-b">

                                        <option value="" title=""></option>

                                        <option value="string" title="">字符串</option>

                                        <option value="email" title="">电子邮件</option>

                                        <option value="url" title="">网址</option>

                                        <option value="date" title="">日期</option>

                                        <option value="dateISO" title="">日期(ISO)</option>

                                        <option value="creditcard" title="">信用卡号</option>

                                        <option value="isMobile" title="">手机号码</option>

                                        <option value="isPhone" title="">电话号码</option>

                                        <option value="isTel" title="">手机/电话</option>

                                        <option value="isQq" title="">QQ号码</option>

                                        <option value="isIdCardNo" title="">身份证号码</option>

                                        <option value="number" title="">数字</option>

                                        <option value="digits" title="">整数</option>

                                        <option value="isIntGtZero" title="">整数(大于0)</option>

                                        <option value="isIntGteZero" title="">整数(大于等于0)</option>

                                        <option value="isIntLtZero" title="">整数(小于0)</option>

                                        <option value="isIntLteZero" title="">整数(小于等于0)</option>

                                        <option value="isFloatGtZero" title="">浮点数(大于0)</option>

                                        <option value="isFloatGteZero" title="">浮点数(大于等于0)</option>

                                        <option value="isFloatLtZero" title="">浮点数(小于0)</option>

                                        <option value="isFloatLteZero" title="">浮点数(小于等于0)</option>

                                        <option value="isZipCode" title="">邮政编码</option>

                                        <option value="isPwd" title="以字母开头，长度在6-12之间，只能包含字符、数字和下划线">密码</option>

                                        <option value="stringCheck" title="只能包含中文、英文、数字、下划线等字符">中文/英文/数字/下划线</option>

                                        <option value="isEnglish" title="">英语</option>

                                        <option value="isChinese" title="">汉子</option>

                                        <option value="isChineseChar" title="匹配中文(包括汉字和字符)">汉英字符</option>

                                        <option value="isRightfulString" title="判断是否为合法字符(a-zA-Z0-9-_)">合法字符</option>

                                    </select>
                                </td>
                                <td>
                                    <input type="text" name="columnList['${item.index}'].minLength" value="${columnList.minLength}" maxlength="200"
                                           class="form-control  ">
                                </td>
                                <td>
                                    <input type="text" name="columnList['${item.index}'].maxLength" value="${columnList.maxLength}" maxlength="200"
                                           class="form-control  ">
                                </td>
                                <td>
                                    <input type="text" name="columnList['${item.index}'].minValue" value="${columnList.minValue}" maxlength="200"
                                           class="form-control  ">
                                </td>
                                <td>
                                    <input type="text" name="columnList['${item.index}'].maxValue" value="${columnList.maxValue}" maxlength="200"
                                           class="form-control  ">
                                </td>
                            </tr>
                        </c:forEach>



                        </tbody>
                    </table>
                </div>
            </div>

        </div>


    </div>

</form>
</body>
</html>