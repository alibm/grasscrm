
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" import="java.util.Map" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page language="java"  import="com.gcrm.domain.User"%> 
    <%User user = (User)session.getAttribute("loginUser");%>
    <%request.setAttribute("user",user);%>
	<div style="background:#fafafa;padding:5px;width:100%;border:1px solid #ccc">	
		<a href="javascript:void(0)" id="mb1" class="easyui-menubutton" data-options="menu:'#mm1',iconCls:'icon-sale'"><s:text name='menu.sales.title'/></a>
		<a href="javascript:void(0)" id="mb2" class="easyui-menubutton" data-options="menu:'#mm2',iconCls:'icon-market'"><s:text name='menu.marketing.title'/></a>
		<a href="javascript:void(0)" id="mb3" class="easyui-menubutton" data-options="menu:'#mm3',iconCls:'icon-support'"><s:text name='menu.support.title'/></a>	
		<a href="javascript:void(0)" id="mb4" class="easyui-menubutton" data-options="menu:'#mm4',iconCls:'icon-activity'"><s:text name='menu.activities.title'/></a>
		<a href="javascript:void(0)" id="mb5" class="easyui-menubutton" data-options="menu:'#mm5',iconCls:'icon-collaboration'"><s:text name='menu.collaboration.title'/></a>
		<s:if test="#session.loginUser.view_system == 1"><a href="javascript:void(0)" id="mb6" class="easyui-menubutton" data-options="menu:'#mm6',iconCls:'icon-system'"><s:text name='menu.system.title'/></a></s:if>
		<a href="javascript:void(0)" id="mb7" class="easyui-menubutton" data-options="menu:'#mm7',iconCls:'icon-help'"><s:text name='menu.help.title'/></a>
	</div>
	<div id="mm1" style="width:150px;">
		<div onClick="openPage('/crm/homePage.action')"><s:text name='menu.home.title'/></div>
		<div class="menu-sep"></div>
		<s:if test="#session.loginUser.view_account == 1"><div onClick="openPage('/crm/listAccountPage.action')"><s:text name='menu.accounts.title'/></div></s:if>
		<s:if test="#session.loginUser.view_contact == 1"><div onClick="openPage('/crm/listContactPage.action')"><s:text name='menu.contacts.title'/></div></s:if>
		<s:if test="#session.loginUser.view_opportunity == 1"><div onClick="openPage('/crm/listOpportunityPage.action')"><s:text name='menu.opportunities.title'/></div></s:if>
		<s:if test="#session.loginUser.view_lead == 1"><div onClick="openPage('/crm/listLeadPage.action')"><s:text name='menu.leads.title'/></div></s:if>
		<s:if test="#session.loginUser.view_targetList == 1"><div onClick="openPage('/crm/listTargetListPage.action')"><s:text name='menu.targetLists.title'/></div></s:if>
	</div>
	<div id="mm2" style="width:100px;">
		<s:if test="#session.loginUser.view_account == 1"><div onClick="openPage('/crm/listAccountPage.action')"><s:text name='menu.accounts.title'/></div></s:if>	
		<s:if test="#session.loginUser.view_contact == 1"><div onClick="openPage('/crm/listContactPage.action')"><s:text name='menu.contacts.title'/></div></s:if>
		<s:if test="#session.loginUser.view_campaign == 1"><div onClick="openPage('/crm/listCampaignPage.action')"><s:text name='menu.campaigns.title'/></div></s:if>
		<s:if test="#session.loginUser.view_target == 1"><div onClick="openPage('/crm/listTargetPage.action')"><s:text name='menu.targets.title'/></div></s:if>
		<s:if test="#session.loginUser.view_targetList == 1"><div onClick="openPage('/crm/listTargetListPage.action')"><s:text name='menu.targetLists.title'/></div></s:if>
	</div>
	<div id="mm3" style="width:100px;">
		<s:if test="#session.loginUser.view_contact == 1"><div onClick="openPage('/crm/listContactPage.action')"><s:text name='menu.contacts.title'/></div></s:if>
		<s:if test="#session.loginUser.view_case == 1"><div onClick="openPage('/crm/listCasePage.action')"><s:text name='menu.cases.title'/></div></s:if>
		<s:if test="#session.loginUser.view_targetList == 1"><div onClick="openPage('/crm/listTargetListPage.action')"><s:text name='menu.targetLists.title'/></div></s:if>
	</div>
	<div id="mm4" style="width:100px;">
		<s:if test="#session.loginUser.view_call == 1"><div onClick="openPage('/crm/listCallPage.action')"><s:text name='menu.calls.title'/></div></s:if>	
		<s:if test="#session.loginUser.view_meeting == 1"><div onClick="openPage('/crm/listMeetingPage.action')"><s:text name='menu.meetings.title'/></div></s:if>
		<s:if test="#session.loginUser.view_task == 1"><div onClick="openPage('/crm/listTaskPage.action')"><s:text name='menu.tasks.title'/></div></s:if>
		<s:if test="#session.loginUser.view_targetList == 1"><div onClick="openPage('/crm/listTargetListPage.action')"><s:text name='menu.targetLists.title'/></div></s:if>
	</div>
	<div id="mm5" style="width:100px;">
		<s:if test="#session.loginUser.view_document == 1"><div onClick="openPage('/crm/listDocumentPage.action')"><s:text name='menu.documents.title'/></div></s:if>
		<s:if test="#session.loginUser.view_targetList == 1"><div onClick="openPage('/crm/listTargetListPage.action')"><s:text name='menu.targetLists.title'/></div></s:if>
	</div>
	<s:if test="#session.loginUser.view_system == 1">
	<div id="mm6" style="width:150px;">
	    <div>
	      <span><s:text name='menu.dropdown.title'/></span>
	      <div style="width:170px;">  
			<div onClick="openPage('/system/listAccountTypePage.action')"><s:text name='menu.accountType.title'/></div>
			<div onClick="openPage('/system/listCallStatusPage.action')"><s:text name='menu.callStatus.title'/></div>
			<div onClick="openPage('/system/listCallDirectionPage.action')"><s:text name='menu.callDirection.title'/></div>
			<div onClick="openPage('/system/listReminderOptionPage.action')"><s:text name='menu.reminderOption.title'/></div>
			<div onClick="openPage('/system/listCampaignTypePage.action')"><s:text name='menu.campaignType.title'/></div>
			<div onClick="openPage('/system/listCampaignStatusPage.action')"><s:text name='menu.campaignStatus.title'/></div>
			<div onClick="openPage('/system/listCaseOriginPage.action')"><s:text name='menu.caseOrigin.title'/></div>
			<div onClick="openPage('/system/listCasePriorityPage.action')"><s:text name='menu.casePriority.title'/></div>
			<div onClick="openPage('/system/listCaseReasonPage.action')"><s:text name='menu.caseReason.title'/></div>
			<div onClick="openPage('/system/listCaseStatusPage.action')"><s:text name='menu.caseStatus.title'/></div>
			<div onClick="openPage('/system/listCaseTypePage.action')"><s:text name='menu.caseType.title'/></div>
			<div onClick="openPage('/system/listDocumentCategoryPage.action')"><s:text name='menu.documentCategory.title'/></div>
			<div onClick="openPage('/system/listDocumentStatusPage.action')"><s:text name='menu.documentStatus.title'/></div>
			<div onClick="openPage('/system/listDocumentSubCategoryPage.action')"><s:text name='menu.documentSubCategory.title'/></div>
			<div onClick="openPage('/system/listDocumentTypePage.action')"><s:text name='menu.documentType.title'/></div>
			<div onClick="openPage('/system/listIndustryPage.action')"><s:text name='menu.industry.title'/></div>
			<div onClick="openPage('/system/listLeadSourcePage.action')"><s:text name='menu.leadSource.title'/></div>
			<div onClick="openPage('/system/listLeadStatusPage.action')"><s:text name='menu.leadStatus.title'/></div>
			<div onClick="openPage('/system/listUserStatusPage.action')"><s:text name='menu.userStatus.title'/></div>	
			<div onClick="openPage('/system/listSalesStagePage.action')"><s:text name='menu.salesStage.title'/></div>		
			<div onClick="openPage('/system/listSalutationPage.action')"><s:text name='menu.salutation.title'/></div>				
			<div onClick="openPage('/system/listTaskStatusPage.action')"><s:text name='menu.taskStatus.title'/></div>	
			<div onClick="openPage('/system/listTaskPriorityPage.action')"><s:text name='menu.taskPriority.title'/></div>
			<div onClick="openPage('/system/listTargetListTypePage.action')"><s:text name='menu.targetListType.title'/></div>					
		  </div>
		</div>
		<div class="menu-sep"></div>
		<div onClick="openPage('/system/listCurrencyPage.action')"><s:text name='menu.currency.title'/></div>
		<div onClick="openPage('/system/listUserPage.action')"><s:text name='menu.user.title'/></div>
		<div onClick="openPage('/system/listRolePage.action')"><s:text name='menu.role.title'/></div>
		<div class="menu-sep"></div>
		<div onClick="openPage('/system/editEmailSetting.action')"><s:text name='menu.emailSetting.title'/></div>
	</div>
	</s:if>
	<div id="mm7" style="width:100px;">
		<div onClick="openPage('/help.pdf')"><s:text name='menu.help.title'/></div>
		<div onClick="openPage('/system/aboutPage.action')"><s:text name='menu.about.title'/></div>
	</div>					