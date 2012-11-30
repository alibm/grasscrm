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

<script type="text/javascript" src="../../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../js/global.js"></script>

<script type="text/javascript">
	function add() {
		var addObjectForm = document.getElementById('addObjectForm');
		addObjectForm.action = "saveMeeting.action";
		addObjectForm.submit();
	}

	function cancel() {
		var addObjectForm = document.getElementById('addObjectForm');
		addObjectForm.action = "listMeetingPage.action";
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
		$('#startDate').datebox('setValue', '<s:property value="startDate"/>');
		$('#endDate').datebox('setValue', '<s:property value="endDate"/>');
		$('#relatedAccountID').combogrid('setValue', '<s:property value="relatedAccountID"/>');
		$('#relatedCaseID').combogrid('setValue', '<s:property value="relatedCaseID"/>');
		$('#relatedContactID').combogrid('setValue', '<s:property value="relatedContactID"/>');
		$('#relatedLeadID').combogrid('setValue', '<s:property value="relatedLeadID"/>');
		$('#relatedOpportunityID').combogrid('setValue', '<s:property value="relatedOpportunityID"/>');
		$('#relatedTargetID').combogrid('setValue', '<s:property value="relatedTargetID"/>');
		$('#relatedTaskID').combogrid('setValue', '<s:property value="relatedTaskID"/>');			
		$('#relatedObject').change(function() {
			checkRelatedObject();
		});
		checkRelatedObject();			
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
				<s:if test="meeting!=null">
					<h2>
						<s:text name="title.updateMeeting" />
					</h2>
				</s:if>
				<s:else>
					<h2>
						<s:text name="title.createMeeting" />
					</h2>
				</s:else>
			</div>

			<div id="feature-content">
				<s:form id="addObjectForm" validate="true" namespace="/jsp/crm"
					method="post">
					<s:hidden name="meeting.id" value="%{meeting.id}" />
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
							<td class="td-label"><label class="record-label"><s:text
										name="meeting.subject.label"></s:text>：</label></td>
							<td class="td-value"><input name="meeting.subject"
								class="easyui-validatebox record-value" data-options="required:true"
								value="<s:property value="meeting.subject" />" /></td>
							<td class="td-label"><label class="record-label"><s:text
										name="meeting.status.label"></s:text>：</label></td>
							<td class="td-value"><s:select name="statusID"
									list="statuses" listKey="id" listValue="name" cssClass="record-value"/></td>
						</tr>
					</table>

					<div class="easyui-tabs">
						<div title="<s:text name='tab.overview'/>" style="padding: 10px;">
							<table style="" cellspacing="10" cellpadding="0" width="100%">
								<tr>
									<td class="td-label"><label class="record-label"><s:text
												name="meeting.start_date.label"></s:text>：</label></td>
									<td class="td-value"><input id="startDate"
										name="startDate" type="text" class="easyui-datetimebox record-value" /></input></td>
									<td class="td-label"><label class="record-label"><s:text
												name="meeting.end_date.label"></s:text>：</label></td>
									<td class="td-value"><input id=endDate name="endDate"
										type="text" class="easyui-datetimebox record-value" /></input></td>
								</tr>
								
								<tr>
									<td class="td-label"><label class="record-label"><s:text
												name="meeting.related_object.label"></s:text>：</label></td>
									<td class="td-value"><s:select name="meeting.related_object"
											id="relatedObject" cssClass="record-value"
											list="#{'Account':'Account','Case':'Case','Contact':'Contact','Lead':'Lead',
											'Opportunity':'Opportunity','Target':'Target','Task':'Task'}" />
									</td>
									<td class="td-label"><label class="record-label"><s:text
												name="meeting.related_record.label"></s:text>：</label></td>
									<td class="td-value">
									<span id="spanAccount"> 
									  <select
											id="relatedAccountID" class="easyui-combogrid record-value"
											name="relatedAccountID" style="width: 250px;"
											data-options="  
							            panelWidth:500,  
							            idField:'id',  
							            textField:'name',  
							            url:'listAccount.action',
							            fit: true,
							            mode:'remote',
							            columns:[[  
							                {field:'id',title:'ID',width:60},  
							                {field:'name',title:'Name',width:100},  
							                {field:'office_phone',title:'Phone',width:120},  
							                {field:'email',title:'Email',width:100}  
							            ]]  
							        ">
										</select>
									</span> 
									<span id="spanCase"> 
									  <select id="relatedCaseID"
											class="easyui-combogrid record-value" name="relatedCaseID"
											style="width: 250px;"
											data-options="  
						            panelWidth:500,  
						            idField:'id',  
						            textField:'name',  
						            url:'listCase.action',
						            fit: true,
						            mode:'remote',
						            columns:[[  
						                {field:'id',title:'ID',width:60},  
						                {field:'subject',title:'Subject',width:100},  
						                {field:'number',title:'Number',width:120}
						            ]]  
						        ">
										</select>
									</span> 
									<span id="spanContact"> 
									  <select id="relatedContactID"
											class="easyui-combogrid record-value" name="relatedContactID"
											style="width: 250px;"
											data-options="  
						            panelWidth:500,  
						            idField:'id',  
						            textField:'name',  
						            url:'listContact.action',
						            fit: true,
						            mode:'remote',
						            columns:[[  
						                {field:'id',title:'ID',width:60},  
						                {field:'name',title:'Name',width:100},
						                {field:'title',title:'Title',width:100}, 
						                {field:'accountName',title:'Account Name',width:100},   
						                {field:'email',title:'Email',width:100},
						                {field:'officePhone',title:'Office Phone',width:100},
						                {field:'user_name',title:'User Name',width:100}
						            ]]  
						        ">
										</select>
									</span>
									<span id="spanLead"> 
									  <select id="relatedLeadID"
											class="easyui-combogrid record-value" name="relatedLeadID"
											style="width: 250px;"
											data-options="  
						            panelWidth:500,  
						            idField:'id',  
						            textField:'name',  
						            url:'listLead.action',
						            fit: true,
						            mode:'remote',
						            columns:[[  
						                {field:'id',title:'ID',width:60},  
						                {field:'name',title:'Name',width:100},
						                {field:'title',title:'Title',width:100}, 
						                {field:'accountName',title:'Account Name',width:100},   
						                {field:'officePhone',title:'Office Phone',width:100},
						                {field:'email',title:'Email',width:100},
						                {field:'user_name',title:'User Name',width:100}
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
						            panelWidth:500,  
						            idField:'id',  
						            textField:'name',  
						            url:'listOpportunity.action',
						            fit: true,
						            mode:'remote',
						            columns:[[  
						                {field:'id',title:'ID',width:60},  
						                {field:'name',title:'Name',width:100},
						                {field:'end_date',title:'End Date',width:100}
						            ]]  
						        ">
										</select>
									</span>	
									<span id="spanTarget"> 
									  <select id="relatedTargetID"
											class="easyui-combogrid record-value" name="relatedTargetID"
											style="width: 250px;"
											data-options="  
						            panelWidth:500,  
						            idField:'id',  
						            textField:'name',  
						            url:'listTarget.action',
						            fit: true,
						            mode:'remote',
						            columns:[[  
						                {field:'id',title:'ID',width:60},  
						                {field:'name',title:'Name',width:100},
						                {field:'title',title:'Title',width:100}, 
						                {field:'accountName',title:'Account Name',width:100},   
						                {field:'officePhone',title:'Office Phone',width:100},
						                {field:'email',title:'Email',width:100},
						                {field:'user_name',title:'User Name',width:100}
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
						            textField:'name',  
						            url:'listTask.action',
						            fit: true,
						            mode:'remote',
						            columns:[[  
						                {field:'id',title:'ID',width:60},  
						                {field:'subject',title:'Subject',width:100},
						                {field:'contact',title:'Contact',width:100}, 
						                {field:'related_object',title:'Related Object',width:100},   
						                {field:'due_date',title:'Due Date',width:100},
						                {field:'user_name',title:'Assigned User',width:100}
						            ]]  
						        ">
										</select>
									</span>																																													
									</td>
								</tr>
								<tr>
									<td class="td-label"><label class="record-label"><s:text
												name="meeting.reminder.label"></s:text>：</label></td>
									<td class="td-value">
									  <s:checkbox id="meeting.reminder_pop"
											name="meeting.reminder_pop" cssClass="record-value" />&nbsp;&nbsp;<label class="record-label"><s:text
												name="meeting.popup.label"></s:text></label>&nbsp;&nbsp;
									  <s:select name="reminderOptionPopID"
											list="reminderOptions" listKey="id" listValue="name"
											cssClass="record-value" /><br/>
									  <s:checkbox id="meeting.reminder_email"
											name="meeting.reminder_email" cssClass="record-value" />&nbsp;&nbsp;<label class="record-label"><s:text
												name="meeting.email.label"></s:text></label>&nbsp;&nbsp;
									  <s:select name="reminderOptionEmailID"
											list="reminderOptions" listKey="id" listValue="name"
											cssClass="record-value" />											
									</td>
								</tr>
								<tr>
									<td class="td-label"><label class="record-label"><s:text
												name="meeting.location.label"></s:text>：</label></td>
									<td class="td-value"><s:textfield name="meeting.location" cssClass="record-value"/>
									</td>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.assigned_to.label"></s:text>：</label></td>
									<td style="text-align: left" width="37.5%" colspan="3"><select
										id="assignedToID" class="easyui-combogrid record-value" name="assignedToID"
										style="width: 250px;"
										data-options="  
							            panelWidth:500,  
							            idField:'id',  
							            textField:'name',  
							            url:'/grass/jsp/system/listUser.action',
							            fit: true,
							            mode:'remote',
							            columns:[[  
							                {field:'id',title:'ID',width:60},  
							                {field:'name',title:'Name',width:100},  
							                {field:'phone',title:'Phone',width:120},  
							                {field:'age',title:'Age',width:100}  
							            ]]  
						        ">
									</select></td>
								</tr>
							</table>
						</div>

						<div title="<s:text name='tab.details'/>" style="padding: 10px;">
							<table style="" cellspacing="10" cellpadding="0" width="100%">
								<tr>
									<td class="td-label" valign="top"><label
										class="record-label"><s:text
												name="entity.description.label"></s:text>：</label></td>
									<td class="td-value" valign="top"><s:textarea
											name="meeting.description" rows="20" cssStyle="width:500px;"
											cssClass="record-value" /></td>
									<td class="td-label"></td>
									<td class="td-value"></td>
								</tr>
								<tr>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.createdBy.label"></s:text>：</label></td>
									<td class="td-value"><label class="record-value"><s:property
												value="createdBy" /></label></td>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.createdOn.label"></s:text>：</label></td>
									<td class="td-value"><label class="record-value"><s:property
												value="createdOn" /></label></td>
								</tr>
								<tr>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.updatedBy.label"></s:text>：</label></td>
									<td class="td-value"><label class="record-value"><s:property
												value="updatedBy" /></label></td>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.updatedOn.label"></s:text>：</label></td>
									<td class="td-value"><label class="record-value"><s:property
												value="updatedOn" /></label></td>
								</tr>
								<tr>
									<td class="td-label"><label class="record-label"><s:text
												name="entity.id.label"></s:text>：</label></td>
									<td class="td-value"><label class="record-value"><s:property
												value="id" /></label></td>
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
												iconCls="icon-ok" style="overflow: auto; padding: 10px;"
												selected="true">
												<a
													href="filterMeetingContactPage.action?id=<s:property value="meeting.id" />"
													target="contentFrame"><label
													class="record-value menuLink"><s:text
															name="menu.contacts.title" /></label></a><br /> <a
													href="filterMeetingLeadPage.action?id=<s:property value="meeting.id" />"
													target="contentFrame"><label
													class="record-value menuLink"><s:text
															name="menu.leads.title" /></label></a>
											</div>
											<div title="<s:text name="menu.system.title"/>"
												iconCls="icon-ok" style="overflow: auto; padding: 10px;">
												<a
													href="filterMeetingUserPage.action?id=<s:property value="meeting.id" />"
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



