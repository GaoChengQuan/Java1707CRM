<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		/*展示数据的datagrid表格*/
		$("#datagrid").datagrid({
			url:'${ctx}/customerLoss/findAll.action',//只查询已分配咨询师的
			method:'get',
			fit:true,
			singleSelect:false,
			toolbar:'#toolbar',
			rownumbers:true,
			fitColumns:true,
			pagination:true,
			columns:[[    
			     {field:'cb',checkbox:true,align:'center'},    
			     {field:'id',title:'编号',width:50,align:'center'},    
			     {field:'customerName',title:'客户名称',width:100,align:'center'},    
			     {field:'customerManager',title:'客户经理',width:80,align:'center'},    
			     {field:'lastOrderTime',title:'上次下单日期',width:80,align:'center'},    
			     {field:'confirmLossTime',title:'确认流失日期',width:80,align:'center'},    
			     {field:'status',title:'客户状态',width:80,align:'center',formatter:function(value,row,index){
			    	 //状态 0 暂缓流失 1 确认流失
			    	 if(value==0){
			    		 return "暂缓流失";
			    	 }else if(value==1){
			    		 return "确认流失";
			    	 }
			     }},    
			     {field:'lossReason',title:'流失原因',width:80,align:'center'},    
			     {field:'a',title:'操作',width:80,align:'center',formatter:function(value,row,index){
			    	 if(row.status==1){
			    		 return "客户确认流失";
			    	 }else{
			    		 return "<a href='javascript:openCustomerReprieve("+row.id+")'>暂缓流失</a>";
			    	 }
			     }},    
			]]  
		});
		
		/*添加和修改弹出的dialog */
		$("#dialog").dialog({
			closed:'true',
			buttons:[
				{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
						doSave();
					}
				},
				{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
						$("#dialog").dialog("close");
					}
				}
				
			]
			
		});
	});

	/* 查找 */
	function doSearch(){
		$("#datagrid").datagrid("load",{
			'customerName':$("#s_customerName").val(),
			'customerManager':$("#s_customerManager").val(),
			'status':$("#s_status").val(),
		})
	}
	
	//可以修改添加开发项
	function openCusDevPlanTab(id){
		 window.parent.openTab('客户开发计划项管理','${ctx}/cusDevPlan/index.action?customerLossId='+id,'icon-khkfjh');
	}
	 
	
</script>
</head>
<body>
	<table id="datagrid"></table>
	
	<!-- toolbar 开始 -->
	<div id="toolbar">
		<!-- <div>
			<a class="easyui-linkbutton" href="javascript:openAddDialog()" iconCls="icon-add">添加</a>
			<a class="easyui-linkbutton" href="javascript:openUpdateDialog()" iconCls="icon-edit">修改</a>
			<a class="easyui-linkbutton" href="javascript:doDelete()" iconCls="icon-remove">删除</a>
		</div> -->
		<div>
		       客户名称：<input type="text" id="s_customerName"/>
		       客户经理：<input type="text" id="s_customerManager"/>
		       客户状态：<select type="text" id="s_status" class="easyui-combobox"
		     		panelHeight="auto" editable="false">
		     		<option value="">请选择...</option>	
 					<option value="0">暂缓流失</option>
 					<option value="1">确认流失</option>	
		     	</select>
		  <a href="javascript:doSearch();" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
	</div>
	<!-- toolbar 结束 -->
	
</body>
</html>


