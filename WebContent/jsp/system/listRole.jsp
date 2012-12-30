<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf8" />
  <link rel="stylesheet" type="text/css" href="../../themes/default/easyui.css"/>  
  <link rel="stylesheet" type="text/css" href="../../themes/icon.css"/>  
  <link rel="stylesheet" type="text/css" href="../../css/global.css" /> 
  
  <script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>  
  <script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>   
  <script type="text/javascript" src="../../js/datagrid.js"></script> 
  <script type="text/javascript" src="../../js/global.js"></script>   
  
  <script type="text/javascript">
    $(document).ready(function(){
	  $("#delete").click(function() {	
		  many_deleterow("deleteRole.action?seleteIDs=");
	  });	
	  
	  $("#export").click(function() {	
		  many_exportrow("/system/exportRole.action?seleteIDs=");
	  });		  
	  
	  $("#copy").click(function() {	
		  many_copyrow("/system/copyRole.action?seleteIDs=");
	  });
	  
	  $('#tt').datagrid({
		title:"<s:text name='title.grid.roles'/>",
		iconCls:'icon-save',
		width:700,
		height:350,
		pagination:true,
		idField:'id', 
		url:'listRole.action',
		columns:[[
			{field:'ck',checkbox:true},
			{field:'id',title:'ID',width:80,align:'center',sortable:'true'},
			{field:'name',title:'Name',width:80,align:'center',sortable:'true',formatter:function(value,row,index){  
				   new_format_value = "<a href='editRole.action?id=" + row.id + "'>" + value + "</a>";
				   return new_format_value 
             }  
            },
			{field:'sequence',title:'Sequence',width:80,align:'center',sortable:'true'}
		]],
	  });
		
    }); 
  </script>
</head>
<body>
	<div id="page-wrap">

      <s:include value="../header.jsp" />
		
      <s:include value="../menu.jsp" />
		
	  <div id="feature">
		<div id="shortcuts" class="headerList">
		  <b style="white-space:nowrap;color:#444;"><s:text name="title.action" />:&nbsp;&nbsp;</b>
		  <span>
		     <span style="white-space:nowrap;">
		       <a href="editRole.action" class="easyui-linkbutton" iconCls="icon-add" plain="true"><s:text name="action.createRole" /></a>  
		     </span>
		     <span style="white-space:nowrap;">
		       <a id="delete" href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"><s:text name="action.deleteRole" /></a>  
		     </span>
		     <span style="white-space:nowrap;">
		       <a href="javascript:void(0)" id="mtmt" class="easyui-menubutton" data-options="menu:'#mtm1',iconCls:'icon-more'"><s:text name='menu.toolbar.more.title'/></a>
		       	<div id="mtm1" style="width:150px;">
					<div onClick="openwindow('/system/uploadRole.jsp','<s:text name="title.import.role" />')"><s:text name='menu.item.import.title'/></div>
					<div id="export"><s:text name='menu.item.export.title'/></div>
					<div onClick="#" data-options="iconCls:'icon-mail'"><s:text name='menu.item.email.title'/></div>	
					<div onClick="#"><s:text name='menu.item.massupdate.title'/></div>
					<div id="copy"><s:text name='menu.item.copy.title'/></div>
				</div>
		     </span>		     		     
		   </span>
         </div> 
		  <div id="feature-title">
			<h2> <s:text name="title.listRole" /> </h2>	  
		  </div>		
		  <div id="feature-content">
		    <div id="tb" style="padding:5px;height:auto">  
			    <div>  
				   <input id="filter_key" class="easyui-combobox" name="filter_key" style="width:60px;" data-options="
					        required:true,valueField:'label',textField:'value',
							data: [{
								label: 'ID',
								value: 'id',
								selected: true 
							},{label: 'Name',
								value: 'name'
							},{label: 'End Date',
								value: 'end_date'
							}]" />					
									
                    <select id="filter_op" class="easyui-combobox" name="filter_op" style="width:40px;" 
                    data-options="valueField:'value',textField:'label',url:'../combobox_filter_op.json'">
					</select>					
                    <input id="filter_value" style="line-height:20px; border:1px solid #ccc"/>                   
			        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch()" plain="true"><s:text name="button.search" /></a>  
			        <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="reset()" plain="true"><s:text name="button.reset" /></a>  
			    </div>  
			</div>  
		    <table id="tt"></table>	
        
		  </div>
		</div>
		
        <s:include value="../footer.jsp" />
		
	</div>	  
</body>
</html>


 
