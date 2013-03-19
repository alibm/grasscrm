<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.gcrm.util.DateTimeUtil"%>
<%@ page language="java"  import="com.gcrm.domain.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf8" />
  <link rel="stylesheet" type="text/css" href="../../css/global.css" /> 
  <link rel="stylesheet" type="text/css" media="screen" href="../../css/redmond/jquery-ui-1.9.2.custom.css" />
  <link rel="stylesheet" type="text/css" media="screen" href="../../css/ui.multiselect.css" />
  <link rel="stylesheet" type="text/css" media="screen" href="../../css/ui.jqgrid.css" />
  <link rel="stylesheet" type="text/css"
	href="../../themes/default/easyui.css" />  
  <link rel="stylesheet" type="text/css" href="../../themes/icon.css"/>  
  
  <script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>  
  <script type="text/javascript" src="../../js/datagrid-<%=(String)session.getAttribute("locale")%>.js"></script> 
  <script type="text/javascript" src="../../js/global.js"></script>
  <script type="text/javascript" src="../../js/jquery-ui-1.9.2.custom.min.js"></script>
  <script type="text/javascript" src="../../js/ui.multiselect.js"></script>
  <script type="text/javascript" src="../../js/jquery.jqGrid.min.js"></script>
  <script type="text/javascript" src="../../js/jquery.easyui.min.js"></script> 
  <script type="text/javascript" src="../../js/i18n/grid.locale-<%=(String)session.getAttribute("locale")%>.js"></script>
  <script type="text/javascript" src="../../js/locale/easyui-lang-<%=(String)session.getAttribute("locale")%>.js"></script>
  
  <script type="text/javascript">
    $(document).ready(function(){
	  $("#delete").click(function() {	
		  many_deleterow("deleteCall.action?seleteIDs=");
	  });	

	  $("#massUpdate").click(function() {	
		  many_massUpdaterow("/crm/editCall.action?seleteIDs=");
	  });
	  
	  $("#export").click(function() {	
		  many_exportrow("/crm/exportCall.action?seleteIDs=");
	  });	  

	  $("#copy").click(function() {	
		  many_copyrow("/crm/copyCall.action?seleteIDs=");
	  });
	  	  
	  var mygrid = jQuery("#grid").jqGrid({
			datatype: "json", 
			url:'listCallFull.action', 
			mtype: 'POST',
			height: "auto",
		   	colNames:['<s:text name="entity.id.label" />','<s:text name="call.direction.label" />',
		  		   	'<s:text name="entity.subject.label" />','<s:text name="entity.status.label" />',
		  		   	'<s:text name="entity.start_date.label" />','<s:text name="entity.assigned_to.label" />',
		  		   	'<s:text name="entity.createdBy.label" />','<s:text name="entity.updatedBy.label" />',
		  		   	'<s:text name="entity.createdOn.label" />','<s:text name="entity.updatedOn.label" />'],
		   	colModel:[
		   		{name:'id',index:'id', width:120, key: true,sorttype:"int",resizable:true, hidden:true},
		   		{name:'direction.name',index:'direction.name', width:150, resizable:true, formatter:urlFmatter},
		   		{name:'subject',index:'subject', width:150, resizable:true, formatter:urlFmatter},
		   		{name:'status.name',index:'status.name', width:150, resizable:true, formatter:urlFmatter},
		   		{name:'start_date',index:'start_date', width:150, resizable:true, formatter:urlFmatter, stype:'select', 
			   		editoptions:{value:"<%=DateTimeUtil.getSelectOptions()%>"}},
		   		{name:'assigned_to.name',index:'assigned_to.name', width:150, resizable:true, formatter:urlFmatter},
		   		{name:'created_by.name',index:'created_by.name', width:150, resizable:true, hidden:true, formatter:urlFmatter},
		   		{name:'updated_by.name',index:'updated_by.name', width:150, resizable:true, hidden:true, formatter:urlFmatter},
		   		{name:'created_on',index:'created_on', width:150, resizable:true, hidden:true, formatter:urlFmatter, stype:'select', 
			   		editoptions:{value:"<%=DateTimeUtil.getSelectOptions()%>"}},
		   		{name:'updated_on',index:'updated_on', width:150, resizable:true, hidden:true, formatter:urlFmatter, stype:'select', 
				   		editoptions:{value:"<%=DateTimeUtil.getSelectOptions()%>"}}   		
		   	],
		   	pager: 'pager', 
		   	imgpath: 'image/images', 
		   	rowNum:15, 
		   	viewrecords: true, 
		   	rowList:[15,50,100], 
		   	multiselect: true, 
		   	caption: "<s:text name='title.grid.calls'/>"
		});
		function urlFmatter (cellvalue, options, rowObject)
		{  
		   var par='<%=((User)session.getAttribute("loginUser")).getUpdate_call()%>';
		   if (par == 1){
			   new_format_value = "<a href='editCall.action?id=" + rowObject[0] + "'>" + cellvalue + "</a>";
		   }else {
			 new_format_value = cellvalue;
		   }			
		   return new_format_value
		};	
		
		jQuery("#grid").jqGrid('navGrid','#pager',{del:false,add:false,edit:false,refresh:false,search:false});
		jQuery("#grid").jqGrid('navButtonAdd',"#pager",{caption:"",title:"<s:text name='grid.button.toggle.title'/>", buttonicon :'ui-icon-pin-s',
			onClickButton:function(){
				mygrid[0].toggleToolbar();
			} 
		});		
		jQuery("#grid").jqGrid('navButtonAdd',"#pager",{caption:"",title:"<s:text name='grid.button.advancedSearch.title'/>",buttonicon :'ui-icon-search',
			onClickButton:function(){
				jQuery("#grid").jqGrid('searchGrid', {multipleSearch:true} );
			} 
		});	
		jQuery("#grid").jqGrid('navButtonAdd',"#pager",{caption:"",title:"<s:text name='grid.button.clear.title'/>",buttonicon :'ui-icon-refresh',
			onClickButton:function(){
				var postdata = jQuery("#grid").jqGrid('getGridParam','postData');
				postdata.filters = "";
				mygrid[0].clearToolbar()
			} 
		});
		jQuery("#grid").jqGrid('navButtonAdd','#pager',{caption: "",title: "<s:text name='grid.button.reorderColumn.title'/>",
		    onClickButton : function (){
		    	jQuery("#grid").jqGrid('columnChooser');
		    }
		});		
		jQuery("#grid").jqGrid('filterToolbar');
		
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
			<s:if test="#request.user.create_call == 1">
		      <span style="white-space:nowrap;">
		        <a href="editCall.action" class="easyui-linkbutton" iconCls="icon-add" plain="true"><s:text name="action.createCall" /></a>  
		      </span>
			  </s:if>
			  <s:if test="#request.user.delete_call == 1">	
		      <span style="white-space:nowrap;">
		        <a id="delete" href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"><s:text name="action.deleteCall" /></a>  
		      </span>
			</s:if>
		     <span style="white-space:nowrap;">
		       <a href="javascript:void(0)" id="mtmt" class="easyui-menubutton" data-options="menu:'#mtm1',iconCls:'icon-more'"><s:text name='menu.toolbar.more.title'/></a>
		       	<div id="mtm1" style="width:150px;">
				  <s:if test="#request.user.create_call == 1 || #request.user.update_call == 1">
					<div data-options="iconCls:'icon-import'" onClick="openwindow('/crm/upload.jsp?entityName=Call&namespace=crm&title=' + '<s:text name="title.import.call" />')">
					  <s:text name='menu.item.import.title'/>
					</div>
				  </s:if>	  
				  <s:if test="#request.user.view_call == 1">
					<div data-options="iconCls:'icon-export'" id="export"><s:text name='menu.item.export.title'/></div>
				  </s:if>	
				  <s:if test="#request.user.update_call == 1">
					<div data-options="iconCls:'icon-update'" id="massUpdate">
					  <s:text name='menu.item.massupdate.title' />
					</div>
				  </s:if>
				  <s:if test="#request.user.create_call == 1">
					<div data-options="iconCls:'icon-copy'" id="copy"><s:text name='menu.item.copy.title'/></div>
				  </s:if>
				</div>
		     </span>		     		     
		   </span>
         </div> 
		  <div id="feature-title">
			<h2> <s:text name="title.listCall" /> </h2>	   
		  </div>		
		  <div id="feature-content">
			<table style="" cellspacing="10" cellpadding="0" width="100%">
			  <s:if test="hasActionErrors()"> 
				<tr>
				  <td align="left" colspan="4"><font color="red"><s:actionerror /></font></td>
				</tr>	
			  </s:if>   
			</table>		  
			<table id="grid" class="scroll" cellpadding="0" cellspacing="0"></table>
	        <div id="pager" class="scroll"></div>
	        <div id="filter" style="margin-left:30%;display:none"><s:text name="title.listCall" /></div>
		  </div>
		</div>
		
        <s:include value="../footer.jsp" />
		
	</div>	  
</body>
</html>


 
