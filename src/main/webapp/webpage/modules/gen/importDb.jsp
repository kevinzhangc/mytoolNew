<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>表生成管理</title>
	<meta name="decorator" content="ani"/>
	<script type="text/javascript">
		function doSubmit(table, index){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
			if(validateForm.form()){
				save();
				return true;
			}

			return false;
		}

		function save() {

                jp.loading();
				var checkText=document.getElementsByName("tableName");
				var selectvalue=new Array();   //  selectvalue为radio中选中的值
				for(var i=0;i<checkText.length;i++){
					if(checkText[i].checked==true) {
						selectvalue.push(checkText[i].value);
					}
				}

                jp.post("${ctx}/gentable/genTable/save",{"names":selectvalue},function(data){
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
	</script>
</head>

<body class="bg-white" style="">


<div class="wrapper wrapper-content">

	<div class="wrapper wrapper-content">

		<!-- 搜索 -->
		<div class="accordion-group">
			<div id="collapseTwo" class="accordion-body collapse in">
				<div class="accordion-inner">
					<form id="searchForm" class="form form-horizontal well clearfix" action="/genTable/importTableFromDB" method="post">
						<div class="col-xs-12 col-sm-6 col-md-4">
							<label class="label-item single-overflow pull-left" title="表名：">名称：</label>
							<input id="name" name="name" class=" form-control input-sm" type="text" value="" maxlength="50">
						</div>
						<div class="col-xs-12 col-sm-6 col-md-4">
							<div style="margin-top:26px">
								<a id="search" class="btn btn-primary btn-rounded  btn-bordered btn-sm"><i class="fa fa-search"></i> 查询</a>
								<a id="reset" class="btn btn-primary btn-rounded  btn-bordered btn-sm"><i class="fa fa-refresh"></i> 重置</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- create table from db -->


		<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
			<thead>
			<tr>
				<th> <input type="checkbox" class="i-checks"></th>
				<th  class="sort-column doctorId">名称</th>
				<th  class="sort-column doctorName">描述</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${tableList}" var="table">
					<tr>
						<td> <input type="checkbox" value="${table.name}"  name="tableName" class="i-checks"></td>
						<td >
								${table.name}
						</td>
						<td >
								${table.comments}
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


	</div>
</div>

</body>
</html>