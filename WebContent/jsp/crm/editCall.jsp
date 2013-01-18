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
	function add() {
		var addObjectForm = document.getElementById('addObjectForm');
		if ($("#seleteIDs").val()!= ""){
			addObjectForm.action = "massUpdateCall.action";
		}else{
			addObjectForm.action = "saveCall.action";
		}		
		addObjectForm.submit();
	}

	function cancel() {
		var addObjectForm = document.getElementById('addObjectForm');
		addObjectForm.action = "listCallPage.action";
		addObjectForm.submit();
	}

	function checkRelatedObject() {
		var relatedObject = $('#relatedObject').children('option:selected')
				.val();
		if (relatedObject == 'Account') {
			$("span[id^='span']").css("display", "none");
			$('#spanAccount').css("display", "block");
		} else if (relatedObject == 'Case') {
			$("span[id^='span']").css("display", "none");
			$('#spanCase').css("display", "block");
		} else if (relatedObject == 'Contact') {
			$("span[id^='span']").css("display", "none");
			$('#spanContact').css("display", "block");
		} else if (relatedObject == 'Lead') {
			$("span[id^='span']").css("display", "none");
			$('#spanLead').css("display", "block");
		} else if (relatedObject == 'Opportunity') {
			$("span[id^='span']").css("display", "none");
			$('#spanOpportunity').css("display", "block");
		} else if (relatedObject == 'Target') {
			$("span[id^='span']").css("display", "none");
			$('#spanTarget').css("display", "block");
		} else if (relatedObject == 'Task') {
			$("span[id^='span']").css("display", "none");
			$('#spanTask').css("display", "block");
		}
	}	
	
	$(document).ready(function() {
		$('#assignedToID').combogrid('setValue', '<s:property value="assignedToID"/>');
		$('#assignedToID').combogrid('setText', '<s:property value="assignedToText"/>');
		$('#startDate').datebox('setValue', '<s:property value="startDate"/>');
		$("#relatedObject ").val('<s:property value="call.related_object"/>');
		$('#relatedAccountID').combogrid('setValue', '<s:property value="relatedAccountID"/>');
		$('#relatedAccountID').combogrid('setText', '<s:property value="relatedAccountText"/>');
		$('#relatedCaseID').combogrid('setValue', '<s:property value="relatedCaseID"/>');
		$('#relatedCaseID').combogrid('setText', '<s:property value="relatedCaseText"/>');
		$('#relatedContactID').combogrid('setValue', '<s:property value="relatedContactID"/>');
		$('#relatedContactID').combogrid('setText', '<s:property value="relatedContactText"/>');
		$('#relatedLeadID').combogrid('setValue', '<s:property value="relatedLeadID"/>');
		$('#relatedLeadID').combogrid('setText', '<s:property value="relatedLeadText"/>');
		$('#relatedOpportunityID').combogrid('setValue', '<s:property value="relatedOpportunityID"/>');
		$('#relatedOpportunityID').combogrid('setText', '<s:property value="relatedOpportunityText"/>');
		$('#relatedTargetID').combogrid('setValue', '<s:property value="relatedTargetID"/>');
		$('#relatedTargetID').combogrid('setText', '<s:property value="relatedTargetText"/>');
		$('#relatedTaskID').combogrid('setValue', '<s:property value="relatedTaskID"/>');	
		$('#relatedTaskID').combogrid('setText', '<s:property value="relatedTaskText"/>');
		$('#relatedObject').change(function() {
			checkRelatedObject();
		});
		checkRelatedObject();	
		if ($("#seleteIDs").val()!= ""){
			  $("input:checkbox[name=massUpdate]").css("display",'block');
			  $('#tt').tabs('close', '<s:text name='tab.relations'/>');
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
				<span> <span style="white-space: nowrap;"> <a href="#"
						class="easyui-linkbutton" iconCls="icon-ok" onclick="add()"
						plain="true"><s:text name="button.save" /></a>
				</span> <span style="white-space: nowrap;"> <a href="#"
						class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancel()"
						plain="true"><s:text name="button.cancel" /></a>
				</span>
				</span>
			</div>

			<div id="feature-title">
				<s:if test="call!=null">
					<h2>
						<s:text name="title.updateCall" />
					</h2>
				</s:if>
				<s:else>
				  <s:if test="seleteIDs!=null">
					<h2>
						<s:text name="title.massUpdateCall" />
					</h2>
				  </s:if>
				  <s:else>				    
					<h2>
						<s:text name="title.createCall" />
					</h2>
				  </s:else>	
				</s:else>
			</div>

			<div id="feature-content">
				<s:form id="addObjectForm" validate="true" namespace="/jsp/crm"
					method="post">
					<s:hidden name="call.id" value="%{call.id}" />
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
										name="massUpdate" type="checkbox" class="massUpdate" value="subject"/></td>
							<td class="td-label"><label class="record-label"><s:text
										name="call.subject.label"></s:text>：</label></td>
							<td class="td-value"><input name="call.subject"
								class="easyui-validatebox record-value"
								data-options="required:true"
								value="<s:property value="call.subject" />" /></td>
						    <td class="td-mass-update"><input id="massUpdate"
										name="massUpdate" type="checkbox" class="massUpdate" value="direction"/></td>
							<td class="td-label"><label class="record-label"><s:text
										name="call.direction.label"></s:text>：</label></td>
							<td class="td-value"><s:select name="directionID"
											list="directions" listKey="id" listValue="name"
											cssClass="record-value" /></input></td>
						</tr>
					</table>

					<div class="easyui-tabs">
						<div title="<s:text name='tab.overview'/>" style="padding: 10px;">
							<table style="" cellspacing="10" cellpadding="0" width="100%">
								<tr>
								    <td class="td-mass-update"><input id="massUpdate"
												name="massUpdate" type="checkbox" class="massUpdate" value="status"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="call.status.label"></s:text>：</label></td>
									<td class="td-value"><s:select name="statusID"
											list="statuses" listKey="id" listValue="name"
											cssClass="record-value" /></td>
								    <td class="td-mass-update"><input id="massUpdate"
												name="massUpdate" type="checkbox" class="massUpdate" value="start_date"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="call.start_date.label"></s:text>：</label></td>
									<td class="td-value"><input id="startDate"
										name="startDate" type="text"
										class="easyui-datetimebox record-value" /></input></td>
								</tr>

								<tr>
								    <td class="td-mass-update"><input id="massUpdate"
												name="massUpdate" type="checkbox" class="massUpdate" value="related_object"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="call.related_object.label"></s:text>：</label></td>
									<s:text id="accountText" name="entity.account.label"/>			
									<td class="td-value">
										<select id="relatedObject" name="call.related_object" style="width:150px;">  
										    <option value="Account"><s:text name="entity.account.label" /></option>  
										    <option value="Case"><s:text name="entity.case.label" /></option>  
										    <option value="Contact"><s:text name="entity.contact.label" /></option>
										    <option value="Lead"><s:text name="entity.lead.label" /></option>
										    <option value="Opportunity"><s:text name="entity.opportunity.label" /></option>
										    <option value="Target"><s:text name="entity.target.label" /></option>
										    <option value="Task"><s:text name="entity.task.label" /></option>
										</select>  									
									</td>
								    <td class="td-mass-update"><input id="massUpdate"
												name="massUpdate" type="checkbox" class="massUpdate" value="related_record"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="call.related_record.label"></s:text>：</label></td>
									<td class="td-value">
									<span id="spanAccount"> 
									  <select
											id="relatedAccountID" class="easyui-combogrid record-value"
											name="relatedAccountID" style="width: 250px;"
											data-options="  
							            panelWidth:520,  
							            idField:'id',  
							            textField:'name',  
							            url:'listAccount.action',
							            loadMsg: '<s:text name="datagrid.loading" />',
							            pagination : true,
							            pageSize: 10,
							            pageList: [10,30,50],
									    fit: true,
							            mode:'remote',
							            columns:[[  
							                {field:'id',title:'<s:text name="entity.id.label" />',width:60},  
							                {field:'name',title:'<s:text name="entity.name.label" />',width:100},  
							                {field:'office_phone',title:'<s:text name="account.office_phone.label" />',width:120},  
							                {field:'email',title:'<s:text name="account.email.label" />',width:100},
							                {field:'assigned_to.name',title:'<s:text name="entity.assigned_to.label" />',width:100}  
							            ]]  
							        ">
										</select>
									</span> 
									<span id="spanCase"> 
									  <select id="relatedCaseID"
											class="easyui-combogrid record-value" name="relatedCaseID"
											style="width: 250px;"
											data-options="  
						            panelWidth:520,  
						            idField:'id',  
						            textField:'subject',  
						            url:'listCase.action',
						            loadMsg: '<s:text name="datagrid.loading" />',
						            pagination : true,
						            pageSize: 10,
						            pageList: [10,30,50],
								    fit: true,
						            mode:'remote',
						            columns:[[  
						                {field:'id',title:'<s:text name="entity.id.label" />',width:60,align:'center',sortable:'true'},  
						                {field:'subject',title:'<s:text name="case.subject.label" />',width:100,align:'center',sortable:'true'},  
										{field:'account.name',title:'<s:text name="entity.account.label" />',width:80,align:'center',sortable:'true'},
										{field:'priority.name',title:'<s:text name="case.priority.label" />',width:80,align:'right',sortable:'true'},
										{field:'status.name',title:'<s:text name="case.status.label" />',width:80,align:'center',sortable:'true'},
										{field:'assigned_to.name',title:'<s:text name="entity.assigned_to.label" />',width:80,align:'center',sortable:'true'}
						            ]]  
						        ">
										</select>
									</span> 
									<span id="spanContact"> 
									  <select id="relatedContactID"
											class="easyui-combogrid record-value" name="relatedContactID"
											style="width: 250px;"
											data-options="  
						            panelWidth:520,  
						            idField:'id',  
						            textField:'name',  
						            url:'listContact.action',
						            loadMsg: '<s:text name="datagrid.loading" />',
						            pagination : true,
						            pageSize: 10,
						            pageList: [10,30,50],
								    fit: true,
						            mode:'remote',
						            columns:[[  
										{field:'id',title:'<s:text name="entity.id.label" />',width:80,align:'center',sortable:'true'},
										{field:'name',title:'<s:text name="entity.name.label" />',width:80,align:'center',sortable:'true'},
										{field:'title',title:'<s:text name="contact.title.label" />',width:80,align:'center',sortable:'true'},
										{field:'account.name',title:'<s:text name="entity.account.label" />',width:80,align:'right',sortable:'true'},
										{field:'email',title:'<s:text name="contact.email.label" />',width:80,align:'center',sortable:'true'},
										{field:'office_phone',title:'<s:text name="contact.office_phone.label" />',width:80,align:'center',sortable:'true'},
										{field:'assigned_to.name',title:'<s:text name="entity.assigned_to.label" />',width:80,align:'center',sortable:'true'}
						            ]]  
						        ">
										</select>
									</span>
									<span id="spanLead"> 
									  <select id="relatedLeadID"
											class="easyui-combogrid record-value" name="relatedLeadID"
											style="width: 250px;"
											data-options="  
						            panelWidth:520,  
						            idField:'id',  
						            textField:'name',  
						            url:'listLead.action',
						            loadMsg: '<s:text name="datagrid.loading" />',
						            pagination : true,
						            pageSize: 10,
						            pageList: [10,30,50],
								    fit: true,
						            mode:'remote',
						            columns:[[  
										{field:'id',title:'<s:text name="entity.id.label" />',width:80,align:'center',sortable:'true'},
										{field:'name',title:'<s:text name="entity.name.label" />',width:80,align:'center',sortable:'true'},
										{field:'title',title:'<s:text name="lead.title.label" />',width:80,align:'center',sortable:'true'},
										{field:'account.name',title:'<s:text name="entity.account.label" />',width:80,align:'right',sortable:'true'},
										{field:'office_phone',title:'<s:text name="lead.office_phone.label" />',width:80,align:'center',sortable:'true'},
										{field:'email',title:'<s:text name="lead.email.label" />',width:80,align:'center',sortable:'true'},
										{field:'assigned_to.name',title:'<s:text name="entity.assigned_to.label" />',width:80,align:'center',sortable:'true'}
						            ]]  
						        ">
										</select>
									</span>	
									</span>	
									<span id="spanOpportunity"> 
									  <select id="relatedOpportunityID"
											class="easyui-combogrid record-value" name="relatedOpportunityID"
											style="width: 250px;"
											data-options="  
						            panelWidth:520,  
						            idField:'id',  
						            textField:'name',  
						            url:'listOpportunity.action',
						            loadMsg: '<s:text name="datagrid.loading" />',
						            pagination : true,
						            pageSize: 10,
						            pageList: [10,30,50],
								    fit: true,
						            mode:'remote',
						            columns:[[  
										{field:'id',title:'<s:text name="entity.id.label" />',width:80,align:'center',sortable:'true'},
										{field:'name',title:'<s:text name="entity.name.label" />',width:80,align:'center',sortable:'true'},
										{field:'account.name',title:'<s:text name="entity.account.label" />',width:80,align:'center',sortable:'true'},
										{field:'sales_stage.name',title:'<s:text name="opportunity.salesStage.label" />',width:80,align:'right',sortable:'true'},
										{field:'opportunity_amount',title:'<s:text name="opportunity.opportunity_amount.label" />',width:80,align:'center',sortable:'true'},
										{field:'assigned_to.name',title:'<s:text name="entity.assigned_to.label" />',width:80,align:'center',sortable:'true'}
						            ]]  
						        ">
										</select>
									</span>	
									<span id="spanTarget"> 
									  <select id="relatedTargetID"
											class="easyui-combogrid record-value" name="relatedTargetID"
											style="width: 250px;"
											data-options="  
						            panelWidth:520,  
						            idField:'id',  
						            textField:'name',  
						            url:'listTarget.action',
						            loadMsg: '<s:text name="datagrid.loading" />',
						            pagination : true,
						            pageSize: 10,
						            pageList: [10,30,50],
								    fit: true,
						            mode:'remote',
						            columns:[[  
										{field:'id',title:'<s:text name="entity.id.label" />',width:80,align:'center',sortable:'true'},
										{field:'name',title:'<s:text name="entity.name.label" />',width:80,align:'center',sortable:'true'},
										{field:'title',title:'<s:text name="target.title.label" />',width:80,align:'center',sortable:'true'},
										{field:'account.name',title:'<s:text name="entity.account.label" />',width:80,align:'right',sortable:'true'},
										{field:'office_phone',title:'<s:text name="target.office_phone.label" />',width:80,align:'center',sortable:'true'},
										{field:'email',title:'<s:text name="target.email.label" />',width:80,align:'center',sortable:'true'},
										{field:'assigned_to.name',title:'<s:text name="entity.assigned_to.label" />',width:80,align:'center',sortable:'true'}
						            ]]  
						        ">
										</select>
									</span>										
									<span id="spanTask"> 
									  <select id="relatedTaskID"
											class="easyui-combogrid record-value" name="relatedTaskID"
											style="width: 250px;"
											data-options="  
						            panelWidth:500,  
						            idField:'id',  
						            textField:'subject',  
						            url:'listTask.action',
						            loadMsg: '<s:text name="datagrid.loading" />',
						            pagination : true,
						            pageSize: 10,
						            pageList: [10,30,50],
								    fit: true,
						            mode:'remote',
						            columns:[[  
										{field:'id',title:'<s:text name="entity.id.label" />',width:80,align:'center',sortable:'true'},
										{field:'subject',title:'<s:text name="task.subject.label" />',width:80,align:'center',sortable:'true'},
										{field:'contact.name',title:'<s:text name="task.contact.label" />',width:80,align:'center',sortable:'true'},
										{field:'related_object',title:'<s:text name="task.related_object.label" />',width:80,align:'center',sortable:'true'},
										{field:'due_date',title:'<s:text name="task.due_date.label" />',width:80,align:'center',sortable:'true'},			
										{field:'assigned_to.name',title:'<s:text name="entity.assigned_to.label" />',width:80,align:'center',sortable:'true'}
						            ]]  
						        ">
										</select>
									</span>																																													
									</td>
								</tr>
								<tr>
								    <td class="td-mass-update"><input id="massUpdate"
												name="massUpdate" type="checkbox" class="massUpdate" value="reminder_pop"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="call.reminder.label"></s:text>：</label></td>
									<td class="td-value">
									  <s:checkbox id="call.reminder_pop"
											name="call.reminder_pop" cssClass="record-value" />&nbsp;&nbsp;<label class="record-label"><s:text
												name="call.popup.label"></s:text></label>&nbsp;&nbsp;
									  <s:select name="reminderOptionPopID"
											list="reminderOptions" listKey="id" listValue="name"
											cssClass="record-value" /><br/>
									  <s:checkbox id="call.reminder_email"
											name="call.reminder_email" cssClass="record-value" />&nbsp;&nbsp;<label class="record-label"><s:text
												name="call.email.label"></s:text></label>&nbsp;&nbsp;
									  <s:select name="reminderOptionEmailID"
											list="reminderOptions" listKey="id" listValue="name"
											cssClass="record-value" />		
									</td>
						            <td class="td-mass-update"></td>
									<td class="td-label"></td>
									<td class="td-value"></td>										
								</tr>
								<tr>
								    <td class="td-mass-update"><input id="massUpdate"
												name="massUpdate" type="checkbox" class="massUpdate" value="assigned_to"/></td>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.assigned_to.label"></s:text>：</label></td>
									<td class="td-value" colspan="3"><select id="assignedToID"
										class="easyui-combogrid record-value" name="assignedToID"
										style="width: 250px;"
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

						<div title="<s:text name='tab.details'/>" style="padding: 10px;">
							<table style="" cellspacing="10" cellpadding="0" width="100%">
								<tr>
						            <td class="td-mass-update"><input id="massUpdate"
										name="massUpdate" type="checkbox" class="massUpdate" value="description"/></td>
									<td class="td-label" valign="top"><label
										class="record-label"><s:text
												name="entity.description.label"></s:text>：</label></td>
									<td class="td-value" valign="top"><s:textarea
											name="call.description" rows="20" cssStyle="width:450px;"
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

						<div title="<s:text name='tab.invitees'/>" style="padding: 10px;">
							<table style="" cellspacing="10" cellpadding="0" width="100%">
								<tr>
									<td width="20%" valign="top">
										<div class="easyui-accordion" style="width: 200px;">
											<div title="<s:text name="menu.sales.title"/>"
												style="overflow: auto; padding: 10px;"
												selected="true">
												<a
													href="filterCallContactPage.action?id=<s:property value="call.id" />"
													target="contentFrame"><label
													class="record-value menuLink"><s:text
															name="menu.contacts.title" /></label></a><br /> <a
													href="filterCallLeadPage.action?id=<s:property value="call.id" />"
													target="contentFrame"><label
													class="record-value menuLink"><s:text
															name="menu.leads.title" /></label></a>
											</div>
											<div title="<s:text name="menu.system.title"/>"
												style="overflow: auto; padding: 10px;">
												<a
													href="filterCallUserPage.action?id=<s:property value="call.id" />"
													target="contentFrame"><label
													class="record-value menuLink"><s:text
															name="menu.user.title" /></label></a>
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



