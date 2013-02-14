<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<link rel="stylesheet" type="text/css"
	href="../../themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../css/global.css" />

<script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../js/global.js"></script>

<script type="text/javascript">
    function save() {
        baseSave("Document");
	}

	function saveClose() {
		baseSaveClose("Document");
	}
	
	function cancel() {
		baseCancel("Document");
	}

	$(document).ready(function() {		
		$('#relatedDocumentID').combogrid('setValue', '<s:property value="relatedDocumentID"/>');
		$('#relatedDocumentID').combogrid('setText', '<s:property value="relatedDocumentText"/>');
		$('#ownerID').combogrid('setValue', '<s:property value="ownerID"/>');
		$('#ownerID').combogrid('setText', '<s:property value="ownerText"/>');		
		$('#assignedToID').combogrid('setValue', '<s:property value="assignedToID"/>');
		$('#assignedToID').combogrid('setText', '<s:property value="assignedToText"/>');
		$('#publishDateS').datebox('setValue', '<s:property value="publishDateS"/>');
		$('#expirationDateS').datebox('setValue', '<s:property value="expirationDateS"/>');
		if ($("#seleteIDs").val()!= ""){
			  $("input:checkbox[name=massUpdate]").css("display",'block');
			  $('#tt').tabs('close', '<s:text name='tab.relations'/>');
		}	
		if ($("#id").val() == ""){
			  $('#tt').tabs('close', '<s:text name='tab.relations'/>');
		}
		if ($("#saveFlag").val() == "true"){
			$.messager.show({  
	          title:'<s:text name="message.title" />',  
	          msg:'<s:text name="message.save" />',  
	          timeout:5000,  
	          showType:'slide'  
	      });  
			$("#saveFlag").val("");
	    }		
	})
</script>

</head>
<body>
	<div id="page-wrap">

		<s:include value="../header.jsp" />

		<s:include value="../menu.jsp" />

		<div id="feature">
			<div id="shortcuts" class="headerList">
				<span> <span style="white-space: nowrap;"> <a id="save_accept_btn" href="#"
						class="easyui-linkbutton" iconCls="icon-save-accept" onclick="save()"
						plain="true"><s:text name="button.save" /></a>
				</span>			
				<span> <span style="white-space: nowrap;"> <a id="save_go_btn" href="#"
						class="easyui-linkbutton" iconCls="icon-save-go" onclick="saveClose()"
						plain="true"><s:text name="button.saveClose" /></a>
				</span> <span style="white-space: nowrap;"> <a id="cancel_btn" href="#"
						class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancel()"
						plain="true"><s:text name="button.cancel" /></a>
				</span>
				</span>
			</div>

			<div id="feature-title">
				<s:if test="document!=null && document.id!=null">
					<h2>
						<s:text name="title.updateDocument" />
					</h2>
				</s:if>
				<s:else>
				  <s:if test="seleteIDs!=null && seleteIDs!= ''">
					<h2>
						<s:text name="title.massUpdateDocument" />
					</h2>
				  </s:if>
				  <s:else>				    
					<h2>
						<s:text name="title.createDocument" />
					</h2>
				  </s:else>	
				</s:else>
			</div>

			<div id="feature-content">
				<s:form id="addObjectForm" validate="true" namespace="/jsp/crm"
					method="post" enctype="multipart/form-data">
					<s:hidden id="id" name="document.id" value="%{document.id}" />
					<s:hidden id="saveFlag" name="saveFlag"/>					
					<s:hidden name="relationKey" id="relationKey" value="%{relationKey}" />	
			        <s:hidden name="relationValue" id="relationValue" value="%{relationValue}" />	
			        <s:hidden id="seleteIDs" name="seleteIDs" value="%{seleteIDs}" />
			        			        
					<table style="" cellspacing="10" cellpadding="0" width="100%">
						<s:actionerror />
						<s:if test="hasFieldErrors()">
							<tr>
								<td align="left" colspan="4"><s:actionerror /> <s:iterator
										value="fieldErrors" status="st">
										<s:if test="#st.index  == 0">
											<s:iterator value="value">
												<font color="red"> <s:property escape="false" /></font>
											</s:iterator>
										</s:if>
									</s:iterator></td>
							</tr>
						</s:if>
					</table>

					<table style="padding: 10px;" cellspacing="10" cellpadding="0"
						width="100%">
						<tr>
						    <td class="td-mass-update"><input id="massUpdate"
										name="massUpdate" type="checkbox" class="massUpdate" value="name"/></td>
							<td class="td-label"><label class="record-label"><s:text
										name="entity.name.label"></s:text>：</label></td>
							<td class="td-value"><input name="document.name"
								class="easyui-validatebox record-value"
								data-options="required:true"
								value="<s:property value="document.name" />" /></td>
						    <td class="td-mass-update"></td>
							<td class="td-label"><label class="record-label"><s:text
										name="document.file.label"></s:text>：</label></td>
							<td class="td-value">
								<s:url id="url" action="downloadDocument.action?id=%{document.id}"/>
								<s:a href="%{url}"><s:property value="document.fileName" /></s:a>
								<s:file name="upload" label="File" />
							</td>
						</tr>
						<tr>
				            <td class="td-mass-update"><input id="massUpdate"
								name="massUpdate" type="checkbox" class="massUpdate" value="owner"/></td>
							<td class="td-label"><label class="record-label"><s:text
										name="entity.owner.label"></s:text>：</label></td>
							<td class="td-value"><select id="ownerID"
								class="easyui-combogrid record-value" name="ownerID"
								style="width: 180px;"
								data-options="  
					            panelWidth:520,  
					            idField:'id',  
					            textField:'name',  
					            url:'/grass/jsp/system/listUser.action',
		                        loadMsg: '<s:text name="datagrid.loading" />',
		                        pagination : true,
		                        pageSize: 10,
		                        pageList: [10,30,50],
				                fit: true,
					            mode:'remote',
					            columns:[[  
					                {field:'id',title:'<s:text name="entity.id.label" />',width:60},  
					                {field:'name',title:'<s:text name="entity.name.label" />',width:100},  
					                {field:'title',title:'<s:text name="user.title.label" />',width:120},  
					                {field:'department',title:'<s:text name="user.department.label" />',width:100},
					                {field:'status.name',title:'<s:text name="user.status.label" />',width:100}   
					            ]]  
					        ">
							</select></td>
						    <td class="td-mass-update"></td>
							<td class="td-label"></td>
							<td class="td-value"></td>
						</tr>						
					</table>

					<div id="tt" class="easyui-tabs">
						<div title="<s:text name='tab.overview'/>" style="padding: 10px;">
							<table style="" cellspacing="10" cellpadding="0" width="100%">
								<tr>
						            <td class="td-mass-update"><input id="massUpdate"
										        name="massUpdate" type="checkbox" class="massUpdate" value="status"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="document.status.label"></s:text>：</label></td>
									<td class="td-value"><s:select name="statusID"
											list="statuses" listKey="id" listValue="name"
											cssClass="record-value" /></td>
						            <td class="td-mass-update"><input id="massUpdate"
										        name="massUpdate" type="checkbox" class="massUpdate" value="revision"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="document.revision.label"></s:text>：</label></td>
									<td class="td-value"><input name="document.revision"
										type="text" class="easyui-numberbox record-value"
										value="<s:property value="document.revision" />"
										data-options="min:0,precision:0"></input></td>
								</tr>

								<tr>
						            <td class="td-mass-update"><input id="massUpdate"
										        name="massUpdate" type="checkbox" class="massUpdate" value="publish_date"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="document.publish_date.label"></s:text>：</label></td>
									<td class="td-value"><input id="publishDateS"
										name="publishDateS" type="text"
										class="easyui-datebox record-value" /></input></td>
						            <td class="td-mass-update"><input id="massUpdate"
										        name="massUpdate" type="checkbox" class="massUpdate" value="expiration_date"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="document.expiration_date.label"></s:text>：</label></td>
									<td class="td-value"><input id="expirationDateS"
										name="expirationDateS" type="text"
										class="easyui-datebox record-value" /></input></td>
								</tr>

								<tr>
						            <td class="td-mass-update"><input id="massUpdate"
										        name="massUpdate" type="checkbox" class="massUpdate" value="category"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="document.category.label"></s:text>：</label></td>
									<td class="td-value"><s:select name="categoryID"
											list="categories" listKey="id" listValue="name"
											cssClass="record-value" /></td>
						            <td class="td-mass-update"><input id="massUpdate"
										        name="massUpdate" type="checkbox" class="massUpdate" value="sub_category"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="document.sub_category.label"></s:text>：</label></td>
									<td class="td-value"><s:select name="subCategoryID"
											list="subCategories" listKey="id" listValue="name"
											cssClass="record-value" /></td>
								</tr>

								<tr>
						            <td class="td-mass-update"><input id="massUpdate"
										        name="massUpdate" type="checkbox" class="massUpdate" value="related_document"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="document.related_document.label"></s:text>：</label></td>
									<td class="td-value"><select id="relatedDocumentID"
										class="easyui-combogrid record-value" name="relatedDocumentID"
										style="width: 180px;"
										data-options="  
						            panelWidth:520,  
						            idField:'id',  
						            textField:'name',  
						            url:'listDocument.action',
						            loadMsg: '<s:text name="datagrid.loading" />',
						            pagination : true,
						            pageSize: 10,
						            pageList: [10,30,50],
						            fit: true,
						            mode:'remote',
						            columns:[[  
				                      {field:'id',title:'<s:text name="entity.id.label" />',width:80},
				                      {field:'name',title:'<s:text name="entity.name.label" />',width:80},
				                      {field:'publish_date',title:'<s:text name="document.publish_date.label" />',width:80},
				                      {field:'category.name',title:'<s:text name="document.category.label" />',width:80},
				                      {field:'assigned_to.name',title:'<s:text name="entity.assigned_to.label" />',width:80}
						            ]]  
						        ">
									</select></td>
						            <td class="td-mass-update"><input id="massUpdate"
										        name="massUpdate" type="checkbox" class="massUpdate" value="assigned_to"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.assigned_to.label"></s:text>：</label></td>
									<td class="td-value"><select id="assignedToID"
										class="easyui-combogrid record-value" name="assignedToID"
										style="width: 180px;"
										data-options="  
							            panelWidth:520,  
							            idField:'id',  
							            textField:'name',  
							            url:'/grass/jsp/system/listUser.action',
							            loadMsg: '<s:text name="datagrid.loading" />',
							            pagination : true,
							            pageSize: 10,
							            pageList: [10,30,50],
							            fit: true,
							            mode:'remote',
							            columns:[[  
							                {field:'id',title:'<s:text name="entity.id.label" />',width:60},  
							                {field:'name',title:'<s:text name="entity.name.label" />',width:100},  
							                {field:'title',title:'<s:text name="user.title.label" />',width:120},  
							                {field:'department',title:'<s:text name="user.department.label" />',width:100},
							                {field:'status.name',title:'<s:text name="user.status.label" />',width:100}   
							            ]]  
						        ">
									</select></td>
								</tr>
							</table>
						</div>

						<div title="<s:text name='tab.descriptions'/>"
							style="padding: 10px;">
							<table style="" cellspacing="10" cellpadding="0" width="100%">
								<tr>
						            <td class="td-mass-update"><input id="massUpdate"
										        name="massUpdate" type="checkbox" class="massUpdate" value="description"/></td>
									<td class="td-label" valign="top"><label
										class="record-label"><s:text
												name="entity.description.label"></s:text>：</label></td>
									<td class="td-value" valign="top"><s:textarea
											name="document.description" rows="20" cssStyle="width:450px;"
											cssClass="record-value" /></td>
						            <td class="td-mass-update"></td>
									<td class="td-label"></td>
									<td class="td-value"></td>
								</tr>
								<tr>
						            <td class="td-mass-update"></td>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.createdBy.label"></s:text>：</label></td>
									<td class="td-value"><label class="record-value"><s:property
												value="createdBy" /></label></td>
						            <td class="td-mass-update"></td>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.createdOn.label"></s:text>：</label></td>
									<td class="td-value"><label class="record-value"><s:property
												value="createdOn" /></label></td>
								</tr>
								<tr>
						            <td class="td-mass-update"></td>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.updatedBy.label"></s:text>：</label></td>
									<td class="td-value"><label class="record-value"><s:property
												value="updatedBy" /></label></td>
						            <td class="td-mass-update"></td>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.updatedOn.label"></s:text>：</label></td>
									<td class="td-value"><label class="record-value"><s:property
												value="updatedOn" /></label></td>
								</tr>
								<tr>
						            <td class="td-mass-update"></td>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.id.label"></s:text>：</label></td>
									<td class="td-value"><label class="record-value"><s:property
												value="id" /></label></td>
						            <td class="td-mass-update"></td>
									<td class="td-label"></td>
									<td class="td-value"></td>
								</tr>								
							</table>
						</div>

						<div title="<s:text name='tab.relations'/>" style="padding: 10px;">
							<table style="" cellspacing="10" cellpadding="0" width="100%">
								<tr>
									<td width="20%" valign="top">
										<div class="easyui-accordion" style="width: 200px;">
											<div title="<s:text name="menu.sales.title"/>"
												style="overflow: auto; padding: 10px;"
												selected="true">
												<a
													href="filterDocumentAccountPage.action?id=<s:property value="document.id" />"
													target="contentFrame"><label
													class="record-value menuLink"><s:text
															name="menu.accounts.title" /></label></a><br /> <a
													href="filterDocumentContactPage.action?id=<s:property value="document.id" />"
													target="contentFrame"><label
													class="record-value menuLink"><s:text
															name="menu.contacts.title" /></label></a><br /> <a
													href="filterDocumentOpportunityPage.action?id=<s:property value="document.id" />"
													target="contentFrame"><label
													class="record-value menuLink"><s:text
															name="menu.opportunities.title" /></label></a>
											</div>
											<div title="<s:text name="menu.support.title"/>"
												style="overflow: auto; padding: 10px;">
												<a
													href="filterDocumentCasePage.action?id=<s:property value="document.id" />"
													target="contentFrame"><label
													class="record-value menuLink"><s:text
															name="menu.cases.title" /></label></a>
											</div>
										</div>
									</td>
									<td width="80%" valign="top"><Iframe name="contentFrame"
											id="contentFrame" scrolling="no" frameborder="0" width="100%"
											height="360"></iframe></td>
								</tr>
							</table>
						</div>


					</div>
				</s:form>
			</div>
		</div>

		<s:include value="../footer.jsp" />

	</div>
</body>
</html>



