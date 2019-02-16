<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>表生成管理</title>
	<meta name="decorator" content="ani"/>
	<script type="text/javascript">

		$(document).ready(function() {

		});
		function save() {
            var isValidate = jp.validateForm('#inputForm');//校验表单
            if(!isValidate){
                return false;
			}else{
                jp.loading();
                jp.post("${ctx}/gentable/genTable/save",$('#inputForm').serialize(),function(data){
                    if(data.success){
                        jp.getParent().refresh();
                        var dialogIndex = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                        parent.layer.close(dialogIndex);
                        jp.success(data.msg)

                    }else{
                        jp.error(data.msg);
                    }
                })
			}

        }
	</script>
</head>
<body class="bg-white">
<form id="inputForm" class="form-horizontal" action="/jeeplus/a/gen/genTable/save" method="post" novalidate="novalidate">
	<input id="id" name="id" type="hidden" value="">
	<input id="isSync" name="isSync" type="hidden" value="">
	<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		<tbody>
		<tr>
			<td class="width-15 active"><label class="pull-right"><font color="red">*</font>表名:</label></td>
			<td class="width-35">
				<input id="name" name="name" class="form-control required isRightfulString" type="text" value="${genTable.name}" maxlength="200" aria-required="true">
			</td>
			<td class="width-15 active"><label class="pull-right"><font color="red">*</font>说明:</label></td>
			<td class="width-35">
				<input id="comments" name="comments" class="form-control required" type="text" value="${genTable.comments}" maxlength="200" aria-required="true">
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
				<spancontentTable1 class="help-inline">如果是附表，请指定主表表名和当前表的外键</spancontentTable1>
			</td>
			<td class="width-15 active"><label class="pull-right"><font color="red">*</font>类名:</label></td>
			<td class="width-35">
				<input id="className" name="className" class="form-control required" type="text" value="${genTable.className}" maxlength="200" aria-required="true">
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
				<input id="parentTableFk" name="parentTableFk" class="form-control" type="text" value="${genTable.parentTableFk}" maxlength="200">
			</td>
		</tr>

		</tbody>
	</table>
	<button class="btn btn-white btn-sm" onclick="return addColumn()"><i class="fa fa-plus"> 增加</i></button>
	<button class="btn btn-white btn-sm" onclick="return delColumn()"><i class="fa fa-minus"> 删除</i> </button>
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

			<li class="dropdown pull-right hide tabdrop tab-drop"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-align-justify"></i><b class="caret"></b></a><ul class="dropdown-menu"></ul></li></ul>
		<div class="tab-content">
			<div id="tab-1" class="tab-pane active">
				<div class="panel-body">
					<table id="contentTable1" class="table table-striped table-bordered table-hover  dataTables-example dataTable">
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
						<tr style="cursor: move;">
							<td>
								<input type="hidden" name="columnList[0].sort" value="0" maxlength="200" class="form-control required   digits" aria-required="true">
								<label>0</label>
								<input type="hidden" name="columnList[0].isInsert" value="1">
								<input type="hidden" name="columnList[0].isEdit" value="0">
							</td>
							<td>
								<label class="bootstrap-table-checkbox"><input type="checkbox" name="ck" value="1"><span> </span></label>
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[0].name" value="id">
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[0].comments" value="主键" maxlength="200">
							</td>
							<td>
										<span name="columnList[0].jdbcType" class="required  combox_border" value="varchar(64)" aria-required="true" style="border: 1px solid rgb(229, 230, 231); display: inline-block; position: relative;">
									<input type="text" id="" name="columnList[0].jdbcType" class="combox_input required " value="varchar(64)"><font class="ficomoon icon-angle-bottom combox_button" style="display:inline-block"></font><br><label id="columnList[0].jdbcType-error" class="error" for="columnList[0].jdbcType" style="display: none;"></label><ul style="z-index: 9999; border: 1px solid rgb(103, 152, 209); position: absolute; left: -1px; display: none; top: 37px;" class="combox_select"><li><a href="javascript:void(0)">varchar(64)</a></li><li><a href="javascript:void(0)">nvarchar(64)</a></li><li><a href="javascript:void(0)">integer</a></li><li><a href="javascript:void(0)">double</a></li><li><a href="javascript:void(0)">datetime</a></li><li><a href="javascript:void(0)">longblob</a></li><li><a href="javascript:void(0)">longtext</a></li></ul></span></td>
							<td>
								<div class="icheckbox_square-blue checked" style="position: relative;">
									<input type="checkbox" class="i-checks" name="columnList[0].isPk" value="1" checked="" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;">
									<ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins>
								</div>
							</td>
						</tr>
						<!-- create_by -->
						<tr style="cursor: move;">
							<td>
								<input type="hidden" name="columnList[1].sort" value="1" maxlength="200" class="form-control required   digits" aria-required="true">
								<label>1</label>
								<input type="hidden" name="columnList[1].isInsert" value="1">
								<input type="hidden" name="columnList[1].isEdit" value="0">
							</td>
							<td>
								<label class="bootstrap-table-checkbox"><input type="checkbox" name="ck" value="1"><span> </span></label>
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[1].name" value="create_by">
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[1].comments" value="创建者" maxlength="200">
							</td>
							<td>
										<span name="columnList[1].jdbcType" class="required  combox_border" value="varchar(64)" aria-required="true" style="border: 1px solid rgb(229, 230, 231); display: inline-block; position: relative;">
									<input type="text" id="" name="columnList[1].jdbcType" class="combox_input required " value="varchar(64)"><font class="ficomoon icon-angle-bottom combox_button" style="display:inline-block"></font><br><label id="columnList[1].jdbcType-error" class="error" for="columnList[1].jdbcType" style="display: none;"></label><ul style="z-index: 9999; border: 1px solid rgb(103, 152, 209); position: absolute; left: -1px; display: none; top: 37px;" class="combox_select"><li><a href="javascript:void(0)">varchar(64)</a></li><li><a href="javascript:void(0)">nvarchar(64)</a></li><li><a href="javascript:void(0)">integer</a></li><li><a href="javascript:void(0)">double</a></li><li><a href="javascript:void(0)">datetime</a></li><li><a href="javascript:void(0)">longblob</a></li><li><a href="javascript:void(0)">longtext</a></li></ul></span></td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[1].isPk" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>

						</tr>

						<!-- create_date -->
						<tr style="cursor: move;">
							<td>
								<input type="hidden" name="columnList[2].sort" value="2" maxlength="200" class="form-control required   digits" aria-required="true">
								<label>2</label>
								<input type="hidden" name="columnList[2].isInsert" value="1">
								<input type="hidden" name="columnList[2].isEdit" value="0">
							</td>
							<td>
								<label class="bootstrap-table-checkbox"><input type="checkbox" name="ck" value="1"><span> </span></label>
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[2].name" value="create_date">
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[2].comments" value="创建时间" maxlength="200">
							</td>
							<td>
										<span name="columnList[2].jdbcType" class="required  combox_border" value="datetime" aria-required="true" style="border: 1px solid rgb(229, 230, 231); display: inline-block; position: relative;">
									<input type="text" id="" name="columnList[2].jdbcType" class="combox_input required " value="datetime"><font class="ficomoon icon-angle-bottom combox_button" style="display:inline-block"></font><br><label id="columnList[2].jdbcType-error" class="error" for="columnList[2].jdbcType" style="display: none;"></label><ul style="z-index: 9999; border: 1px solid rgb(103, 152, 209); position: absolute; left: -1px; display: none; top: 37px;" class="combox_select"><li><a href="javascript:void(0)">varchar(64)</a></li><li><a href="javascript:void(0)">nvarchar(64)</a></li><li><a href="javascript:void(0)">integer</a></li><li><a href="javascript:void(0)">double</a></li><li><a href="javascript:void(0)">datetime</a></li><li><a href="javascript:void(0)">longblob</a></li><li><a href="javascript:void(0)">longtext</a></li></ul></span></td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[2].isPk" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>

						</tr>

						<!-- update_by -->
						<tr style="cursor: move;">
							<td>
								<input type="hidden" name="columnList[3].sort" value="3" maxlength="200" class="form-control required   digits" aria-required="true">
								<label>3</label>
								<input type="hidden" name="columnList[3].isInsert" value="1">
								<input type="hidden" name="columnList[3].isEdit" value="1">
							</td>
							<td>
								<label class="bootstrap-table-checkbox"><input type="checkbox" name="ck" value="1"><span> </span></label>
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[3].name" value="update_by">
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[3].comments" value="更新者" maxlength="200">
							</td>
							<td>
										<span name="columnList[3].jdbcType" class="required  combox_border" value="varchar(64)" aria-required="true" style="border: 1px solid rgb(229, 230, 231); display: inline-block; position: relative;">
									<input type="text" id="" name="columnList[3].jdbcType" class="combox_input required " value="varchar(64)"><font class="ficomoon icon-angle-bottom combox_button" style="display:inline-block"></font><br><label id="columnList[3].jdbcType-error" class="error" for="columnList[3].jdbcType" style="display: none;"></label><ul style="z-index: 9999; border: 1px solid rgb(103, 152, 209); position: absolute; left: -1px; display: none; top: 37px;" class="combox_select"><li><a href="javascript:void(0)">varchar(64)</a></li><li><a href="javascript:void(0)">nvarchar(64)</a></li><li><a href="javascript:void(0)">integer</a></li><li><a href="javascript:void(0)">double</a></li><li><a href="javascript:void(0)">datetime</a></li><li><a href="javascript:void(0)">longblob</a></li><li><a href="javascript:void(0)">longtext</a></li></ul></span></td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[3].isPk" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
						</tr>

						<!-- update_date -->
						<tr style="cursor: move;">
							<td>
								<input type="hidden" name="columnList[4].sort" value="4" maxlength="200" class="form-control required   digits" aria-required="true">
								<label>4</label>
								<input type="hidden" name="columnList[4].isInsert" value="1">
								<input type="hidden" name="columnList[4].isEdit" value="1">
							</td>
							<td>
								<label class="bootstrap-table-checkbox"><input type="checkbox" name="ck" value="1"><span> </span></label>
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[4].name" value="update_date">
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[4].comments" value="更新时间" maxlength="200">
							</td>
							<td>
										<span name="columnList[4].jdbcType" class="required  combox_border" value="datetime" aria-required="true" style="border: 1px solid rgb(229, 230, 231); display: inline-block; position: relative;">
									<input type="text" id="" name="columnList[4].jdbcType" class="combox_input required " value="datetime"><font class="ficomoon icon-angle-bottom combox_button" style="display:inline-block"></font><br><label id="columnList[4].jdbcType-error" class="error" for="columnList[4].jdbcType" style="display: none;"></label><ul style="z-index: 9999; border: 1px solid rgb(103, 152, 209); position: absolute; left: -1px; display: none; top: 37px;" class="combox_select"><li><a href="javascript:void(0)">varchar(64)</a></li><li><a href="javascript:void(0)">nvarchar(64)</a></li><li><a href="javascript:void(0)">integer</a></li><li><a href="javascript:void(0)">double</a></li><li><a href="javascript:void(0)">datetime</a></li><li><a href="javascript:void(0)">longblob</a></li><li><a href="javascript:void(0)">longtext</a></li></ul></span></td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[4].isPk" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
						</tr>

						<!-- remarks -->
						<tr style="cursor: move;">
							<td>
								<input type="hidden" name="columnList[5].sort" value="5" maxlength="200" class="form-control required   digits" aria-required="true">
								<label>5</label>
								<input type="hidden" name="columnList[5].isInsert" value="1">
								<input type="hidden" name="columnList[5].isEdit" value="1">
							</td>
							<td>
								<label class="bootstrap-table-checkbox"><input type="checkbox" name="ck" value="1"><span> </span></label>
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[5].name" value="remarks">
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[5].comments" value="备注信息" maxlength="200">
							</td>
							<td>
										<span name="columnList[5].jdbcType" class="required  combox_border" value="nvarchar(255)" aria-required="true" style="border: 1px solid rgb(229, 230, 231); display: inline-block; position: relative;">
									<input type="text" id="" name="columnList[5].jdbcType" class="combox_input required " value="nvarchar(255)"><font class="ficomoon icon-angle-bottom combox_button" style="display:inline-block"></font><br><label id="columnList[5].jdbcType-error" class="error" for="columnList[5].jdbcType" style="display: none;"></label><ul style="z-index: 9999; border: 1px solid rgb(103, 152, 209); position: absolute; left: -1px; display: none; top: 37px;" class="combox_select"><li><a href="javascript:void(0)">varchar(64)</a></li><li><a href="javascript:void(0)">nvarchar(64)</a></li><li><a href="javascript:void(0)">integer</a></li><li><a href="javascript:void(0)">double</a></li><li><a href="javascript:void(0)">datetime</a></li><li><a href="javascript:void(0)">longblob</a></li><li><a href="javascript:void(0)">longtext</a></li></ul></span></td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[5].isPk" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>

						</tr>

						<!-- del_flag -->
						<tr style="cursor: move;">
							<td>
								<input type="hidden" name="columnList[6].sort" value="6" maxlength="200" class="form-control required   digits" aria-required="true">
								<label>6</label>
								<input type="hidden" name="columnList[6].isInsert" value="1">
								<input type="hidden" name="columnList[6].isEdit" value="0">
							</td>
							<td>
								<label class="bootstrap-table-checkbox"><input type="checkbox" name="ck" value="1"><span> </span></label>
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[6].name" value="del_flag">
							</td>
							<td>
								<input type="text" class="form-control" name="columnList[6].comments" value="逻辑删除标记（0：显示；1：隐藏）" maxlength="200">
							</td>
							<td>
										<span name="columnList[6].jdbcType" class="required  combox_border" value="varchar(64)" aria-required="true" style="border: 1px solid rgb(229, 230, 231); display: inline-block; position: relative;">
									<input type="text" id="" name="columnList[6].jdbcType" class="combox_input required " value="varchar(64)"><font class="ficomoon icon-angle-bottom combox_button" style="display:inline-block"></font><br><label id="columnList[6].jdbcType-error" class="error" for="columnList[6].jdbcType" style="display: none;"></label><ul style="z-index: 9999; border: 1px solid rgb(103, 152, 209); position: absolute; left: -1px; display: none; top: 37px;" class="combox_select"><li><a href="javascript:void(0)">varchar(64)</a></li><li><a href="javascript:void(0)">nvarchar(64)</a></li><li><a href="javascript:void(0)">integer</a></li><li><a href="javascript:void(0)">double</a></li><li><a href="javascript:void(0)">datetime</a></li><li><a href="javascript:void(0)">longblob</a></li><li><a href="javascript:void(0)">longtext</a></li></ul></span></td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[6].isPk" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
						</tr>



						</tbody>
					</table>
				</div>
			</div>
			<div id="tab-2" class="tab-pane">
				<div class="panel-body">
					<table id="contentTable2" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
						<thead>
						<tr>
							<th title="数据库字段名" width="15%">列名</th>
							<th title="默认读取数据库字段备注">说明</th>
							<th title="实体对象的属性字段类型" width="15%">Java类型</th>
							<th title="实体对象的属性字段（对象名.属性名|属性名2|属性名3，例如：用户user.id|name|loginName，属性名2和属性名3为Join时关联查询的字段）">Java属性名称 <i class="icon-question-sign"></i></th>
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
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[0].name" value="id">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[0].comments" value="主键" maxlength="200" readonly="readonly">
							</td>
							<td>
								<select name="columnList[0].javaType" class="form-control required m-b" aria-required="true">

									<option value="String" selected="" title="">String</option>

									<option value="Long" title="">Long</option>

									<option value="Integer" title="">Integer</option>

									<option value="Double" title="">Double</option>

									<option value="java.util.Date" title="">Date</option>

									<option value="com.jeeplus.modules.sys.entity.User" title="">User</option>

									<option value="com.jeeplus.modules.sys.entity.Office" title="">Office</option>

									<option value="com.jeeplus.modules.sys.entity.Area" title="">Area</option>

									<option value="This" title="生成当前对象">ThisObj</option>

									<option value="com.jeeplus.modules.test.activiti.entity.TestAudit" title="">TestAudit</option>

								</select>
							</td>
							<td>
								<input type="text" name="columnList[0].javaField" value="id" maxlength="200" class="form-control required " aria-required="true">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[0].isForm" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[0].isList" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[0].isQuery" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[0].queryType" class="form-control required  m-b" aria-required="true">

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
								<select name="columnList[0].showType" class="form-control required  m-b" aria-required="true">

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
								<input type="text" name="columnList[0].dictType" value="" maxlength="200" class="form-control">
							</td>

						</tr>
						<!-- create_by -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[1].name" value="create_by">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[1].comments" value="创建者" maxlength="200" readonly="readonly">
							</td>
							<td>
								<select name="columnList[1].javaType" class="form-control required m-b" aria-required="true">

									<option value="String" selected="" title="">String</option>

									<option value="Long" title="">Long</option>

									<option value="Integer" title="">Integer</option>

									<option value="Double" title="">Double</option>

									<option value="java.util.Date" title="">Date</option>

									<option value="com.jeeplus.modules.sys.entity.User" title="">User</option>

									<option value="com.jeeplus.modules.sys.entity.Office" title="">Office</option>

									<option value="com.jeeplus.modules.sys.entity.Area" title="">Area</option>

									<option value="This" title="生成当前对象">ThisObj</option>

									<option value="com.jeeplus.modules.test.activiti.entity.TestAudit" title="">TestAudit</option>

								</select>
							</td>
							<td>
								<input type="text" name="columnList[1].javaField" value="createBy.id" maxlength="200" class="form-control required " aria-required="true">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[1].isForm" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[1].isList" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[1].isQuery" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[1].queryType" class="form-control required  m-b" aria-required="true">

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
								<select name="columnList[1].showType" class="form-control required  m-b" aria-required="true">

									<option value="input" selected="" title="">单行文本</option>

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
								<input type="text" name="columnList[1].dictType" value="" maxlength="200" class="form-control">
							</td>
						</tr>

						<!-- create_date -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[2].name" value="create_date">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[2].comments" value="创建日期" maxlength="200" readonly="readonly">
							</td>
							<td>
								<select name="columnList[2].javaType" class="form-control required m-b" aria-required="true">

									<option value="String" title="">String</option>

									<option value="Long" title="">Long</option>

									<option value="Integer" title="">Integer</option>

									<option value="Double" title="">Double</option>

									<option value="java.util.Date" selected="" title="">Date</option>

									<option value="com.jeeplus.modules.sys.entity.User" title="">User</option>

									<option value="com.jeeplus.modules.sys.entity.Office" title="">Office</option>

									<option value="com.jeeplus.modules.sys.entity.Area" title="">Area</option>

									<option value="This" title="生成当前对象">ThisObj</option>

									<option value="com.jeeplus.modules.test.activiti.entity.TestAudit" title="">TestAudit</option>

								</select>
							</td>
							<td>
								<input type="text" name="columnList[2].javaField" value="createDate" maxlength="200" class="form-control required " aria-required="true">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[2].isForm" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[2].isList" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[2].isQuery" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[2].queryType" class="form-control required  m-b" aria-required="true">

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
								<select name="columnList[2].showType" class="form-control required  m-b" aria-required="true">

									<option value="input" title="">单行文本</option>

									<option value="textarea" title="">多行文本</option>

									<option value="umeditor" title="">富文本编辑器</option>

									<option value="select" title="">下拉选项</option>

									<option value="radiobox" title="">单选按钮</option>

									<option value="checkbox" title="">复选框</option>

									<option value="dateselect" selected="" title="">日期选择</option>

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
								<input type="text" name="columnList[2].dictType" value="" maxlength="200" class="form-control">
							</td>
						</tr>

						<!-- update_by -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[3].name" value="update_by">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[3].comments" value="更新者" maxlength="200" readonly="readonly">
							</td>
							<td>
								<select name="columnList[3].javaType" class="form-control required m-b" aria-required="true">

									<option value="String" selected="" title="">String</option>

									<option value="Long" title="">Long</option>

									<option value="Integer" title="">Integer</option>

									<option value="Double" title="">Double</option>

									<option value="java.util.Date" title="">Date</option>

									<option value="com.jeeplus.modules.sys.entity.User" title="">User</option>

									<option value="com.jeeplus.modules.sys.entity.Office" title="">Office</option>

									<option value="com.jeeplus.modules.sys.entity.Area" title="">Area</option>

									<option value="This" title="生成当前对象">ThisObj</option>

									<option value="com.jeeplus.modules.test.activiti.entity.TestAudit" title="">TestAudit</option>

								</select>
							</td>
							<td>
								<input type="text" name="columnList[3].javaField" value="updateBy.id" maxlength="200" class="form-control required " aria-required="true">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[3].isForm" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[3].isList" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[3].isQuery" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[3].queryType" class="form-control required  m-b" aria-required="true">

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
								<select name="columnList[3].showType" class="form-control required  m-b" aria-required="true">

									<option value="input" selected="" title="">单行文本</option>

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
								<input type="text" name="columnList[3].dictType" value="" maxlength="200" class="form-control">
							</td>
						</tr>

						<!-- update_date -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[4].name" value="update_date">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[4].comments" value="更新日期" maxlength="200" readonly="readonly">
							</td>
							<td>
								<select name="columnList[4].javaType" class="form-control required m-b" aria-required="true">

									<option value="String" title="">String</option>

									<option value="Long" title="">Long</option>

									<option value="Integer" title="">Integer</option>

									<option value="Double" title="">Double</option>

									<option value="java.util.Date" selected="" title="">Date</option>

									<option value="com.jeeplus.modules.sys.entity.User" title="">User</option>

									<option value="com.jeeplus.modules.sys.entity.Office" title="">Office</option>

									<option value="com.jeeplus.modules.sys.entity.Area" title="">Area</option>

									<option value="This" title="生成当前对象">ThisObj</option>

									<option value="com.jeeplus.modules.test.activiti.entity.TestAudit" title="">TestAudit</option>

								</select>
							</td>
							<td>
								<input type="text" name="columnList[4].javaField" value="updateDate" maxlength="200" class="form-control required " aria-required="true">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[4].isForm" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[4].isList" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[4].isQuery" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[4].queryType" class="form-control required  m-b" aria-required="true">

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
								<select name="columnList[4].showType" class="form-control required  m-b" aria-required="true">

									<option value="input" title="">单行文本</option>

									<option value="textarea" title="">多行文本</option>

									<option value="umeditor" title="">富文本编辑器</option>

									<option value="select" title="">下拉选项</option>

									<option value="radiobox" title="">单选按钮</option>

									<option value="checkbox" title="">复选框</option>

									<option value="dateselect" selected="" title="">日期选择</option>

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
								<input type="text" name="columnList[4].dictType" value="" maxlength="200" class="form-control">
							</td>
						</tr>

						<!-- remarks -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[5].name" value="remarks">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[5].comments" value="备注信息" maxlength="200" readonly="readonly">
							</td>
							<td>
								<select name="columnList[5].javaType" class="form-control required m-b" aria-required="true">

									<option value="String" selected="" title="">String</option>

									<option value="Long" title="">Long</option>

									<option value="Integer" title="">Integer</option>

									<option value="Double" title="">Double</option>

									<option value="java.util.Date" title="">Date</option>

									<option value="com.jeeplus.modules.sys.entity.User" title="">User</option>

									<option value="com.jeeplus.modules.sys.entity.Office" title="">Office</option>

									<option value="com.jeeplus.modules.sys.entity.Area" title="">Area</option>

									<option value="This" title="生成当前对象">ThisObj</option>

									<option value="com.jeeplus.modules.test.activiti.entity.TestAudit" title="">TestAudit</option>

								</select>
							</td>
							<td>
								<input type="text" name="columnList[5].javaField" value="remarks" maxlength="255" class="form-control required " aria-required="true">
							</td>
							<td>
								<div class="icheckbox_square-blue checked" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[5].isForm" value="1" checked="" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue checked" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[5].isList" value="1" checked="" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[5].isQuery" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[5].queryType" class="form-control required  m-b" aria-required="true">

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
								<select name="columnList[5].showType" class="form-control required  m-b" aria-required="true">

									<option value="input" title="">单行文本</option>

									<option value="textarea" selected="" title="">多行文本</option>

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
								<input type="text" name="columnList[5].dictType" value="" maxlength="200" class="form-control">
							</td>
						</tr>

						<!-- del_flag -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[6].name" value="del_flag">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[6].comments" value="逻辑删除标记（0：显示；1：隐藏）" maxlength="200" readonly="readonly">
							</td>
							<td>
								<select name="columnList[6].javaType" class="form-control required m-b" aria-required="true">

									<option value="String" selected="" title="">String</option>

									<option value="Long" title="">Long</option>

									<option value="Integer" title="">Integer</option>

									<option value="Double" title="">Double</option>

									<option value="java.util.Date" title="">Date</option>

									<option value="com.jeeplus.modules.sys.entity.User" title="">User</option>

									<option value="com.jeeplus.modules.sys.entity.Office" title="">Office</option>

									<option value="com.jeeplus.modules.sys.entity.Area" title="">Area</option>

									<option value="This" title="生成当前对象">ThisObj</option>

									<option value="com.jeeplus.modules.test.activiti.entity.TestAudit" title="">TestAudit</option>

								</select>
							</td>
							<td>
								<input type="text" name="columnList[6].javaField" value="delFlag" maxlength="255" class="form-control required " aria-required="true">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[6].isForm" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[6].isList" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[6].isQuery" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[6].queryType" class="form-control required  m-b" aria-required="true">

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
								<select name="columnList[6].showType" class="form-control required  m-b" aria-required="true">

									<option value="input" title="">单行文本</option>

									<option value="textarea" title="">多行文本</option>

									<option value="umeditor" title="">富文本编辑器</option>

									<option value="select" title="">下拉选项</option>

									<option value="radiobox" selected="" title="">单选按钮</option>

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
								<input type="text" name="columnList[6].dictType" value="del_flag" maxlength="200" class="form-control">
							</td>
						</tr>


						</tbody>
					</table>
				</div>
			</div>

			<div id="tab-3" class="tab-pane">
				<div class="panel-body">
					<table id="contentTable3" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
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
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[0].name" value="id">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[0].comments" value="主键" maxlength="200" readonly="readonly">
							</td>
							<td>
								<input type="text" name="columnList[0].fieldLabels" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[0].fieldKeys" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[0].searchLabel" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[0].searchKey" value="" maxlength="200" class="form-control  ">
							</td>


						</tr>
						<!-- create_by -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[1].name" value="create_by">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[1].comments" value="创建者" maxlength="200" readonly="readonly">
							</td>
							<td>
								<input type="text" name="columnList[1].fieldLabels" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[1].fieldKeys" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[1].searchLabel" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[1].searchKey" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>

						<!-- create_date -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[2].name" value="create_date">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[2].comments" value="创建时间" maxlength="200" readonly="readonly">
							</td>
							<td>
								<input type="text" name="columnList[2].fieldLabels" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[2].fieldKeys" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[2].searchLabel" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[2].searchKey" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>

						<!-- update_by -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[3].name" value="update_by">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[3].comments" value="更新者" maxlength="200" readonly="readonly">
							</td>
							<td>
								<input type="text" name="columnList[3].fieldLabels" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[3].fieldKeys" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[3].searchLabel" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[3].searchKey" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>

						<!-- update_date -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[4].name" value="update_date">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[4].comments" value="更新时间" maxlength="200" readonly="readonly">
							</td>
							<td>
								<input type="text" name="columnList[4].fieldLabels" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[4].fieldKeys" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[4].searchLabel" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[4].searchKey" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>

						<!-- remarks -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[5].name" value="remarks">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[5].comments" value="备注信息" maxlength="200" readonly="readonly">
							</td>
							<td>
								<input type="text" name="columnList[5].fieldLabels" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[5].fieldKeys" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[5].searchLabel" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[5].searchKey" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>

						<!-- del_flag -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[6].name" value="del_flag">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[6].comments" value="逻辑删除标记（0：显示；1：隐藏）" maxlength="200" readonly="readonly">
							</td>
							<td>
								<input type="text" name="columnList[6].fieldLabels" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[6].fieldKeys" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[6].searchLabel" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[6].searchKey" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>


						</tbody>
					</table>
				</div>
			</div>


			<div id="tab-4" class="tab-pane">
				<div class="panel-body">
					<table id="contentTable4" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
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
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[0].name" value="id">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[0].comments" value="主键" maxlength="200" readonly="readonly">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[0].isNull" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[0].validateType" class="form-control m-b">

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
								<input type="text" name="columnList[0].minLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[0].maxLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[0].minValue" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[0].maxValue" value="" maxlength="200" class="form-control  ">
							</td>

						</tr>
						<!-- create_by -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[1].name" value="create_by">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[1].comments" value="创建者" maxlength="200" readonly="readonly">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[1].isNull" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[1].validateType" class="form-control m-b">

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
								<input type="text" name="columnList[1].minLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[1].maxLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[1].minValue" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[1].maxValue" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>

						<!-- create_date -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[2].name" value="create_date">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[2].comments" value="创建时间" maxlength="200" readonly="readonly">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[2].isNull" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[2].validateType" class="form-control m-b">

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
								<input type="text" name="columnList[2].minLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[2].maxLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[2].minValue" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[2].maxValue" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>

						<!-- update_by -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[3].name" value="update_by">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[3].comments" value="更新者" maxlength="200" readonly="readonly">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[3].isNull" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[3].validateType" class="form-control m-b">

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
								<input type="text" name="columnList[3].minLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[3].maxLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[3].minValue" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[3].maxValue" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>

						<!-- update_date -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[4].name" value="update_date">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[4].comments" value="更新时间" maxlength="200" readonly="readonly">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[4].isNull" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[4].validateType" class="form-control m-b">

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
								<input type="text" name="columnList[4].minLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[4].maxLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[4].minValue" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[4].maxValue" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>

						<!-- remarks -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[5].name" value="remarks">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[5].comments" value="备注信息" maxlength="200" readonly="readonly">
							</td>
							<td>
								<div class="icheckbox_square-blue checked" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[5].isNull" value="1" checked="" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[5].validateType" class="form-control m-b">

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
								<input type="text" name="columnList[5].minLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[5].maxLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[5].minValue" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[5].maxValue" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>

						<!-- del_flag -->
						<tr>
							<td>
								<input type="text" class="form-control" readonly="readonly" name="page-columnList[6].name" value="del_flag">
							</td>
							<td>
								<input type="text" class="form-control" name="page-columnList[6].comments" value="逻辑删除标记（0：显示；1：隐藏）" maxlength="200" readonly="readonly">
							</td>
							<td>
								<div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" class="i-checks" name="columnList[6].isNull" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
							</td>
							<td>
								<select name="columnList[6].validateType" class="form-control m-b">

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
								<input type="text" name="columnList[6].minLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[6].maxLength" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[6].minValue" value="" maxlength="200" class="form-control  ">
							</td>
							<td>
								<input type="text" name="columnList[6].maxValue" value="" maxlength="200" class="form-control  ">
							</td>
						</tr>


						</tbody>
					</table>
				</div>
			</div>

		</div>


	</div>

</form>
</body>
</html>