<!-- 
/** @(#)breadCrumb.jsp
 * Version : 1.0
 * Date: 01 Sep 2009
 *
 * Copyright (c) 2007-2012 Mann-India Technologies Pvt. Ltd.
 * B-267 A, First Floor, GK-I New Delhi-110048, India
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * Mann-India Technologies Pvt. Ltd.("Confidential Information").  You
 * shall not disclose such Confidential Information and shall use it
 * only in accordance with the terms of the license agreement you
 * entered into with Mann-India Technologies Pvt. Ltd.
 * 
 * @author Bhaskar Das
 * 
 */
 
/** 
   Project 		: MimoPortal
   Module  		: Transaction Log
   Program 		: breadCrumb.jsp
   Description 	:JSP for displaying the paths for tabs and submenus as links in tiles.

   REVISION HISTORY
 
    S.No.  				: 
    Author  			: 
    Version             : 1.0
    Date of Revision    : 
    Defect Id           :
    Revision Details    : Initial Release
**/
-->

<jsp:directive.page import="org.apache.struts.action.ActionMapping"/>
<jsp:directive.page import="org.apache.struts.action.Action"/><%@ include file="/global/include.jsp"%>
<%
ActionMapping actionMapping = (ActionMapping)request.getAttribute(Action.MAPPING_KEY);
String path = actionMapping.getPath();
String mode = request.getParameter(actionMapping.getParameter());
%>


<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2" class="breadcrumb">
				<% 
					if(path!=null && path.equals("/fetchTxnLog")){
				
						out.print("<a href='"+request.getContextPath()+"/fetchTxnLog.do'>Home</a> &gt; Transaction Log");
				
					}else if(path!=null && path.equals("/servicePartnerList")){
				
						out.print("<a href='"+request.getContextPath()+"/servicePartnerList.do'>Configuration</a> &gt; Service Provider");
				
					}else if(path!=null && path.equals("/userList")){
				
						out.print("<a href='"+request.getContextPath()+"/userList.do'>Configuration</a> &gt; User");										
				
					}else if(path!=null && path.equals("/changePassword")){
				
						out.print("<a href='"+request.getContextPath()+"/changePassword.do'>Preferences</a> &gt; Change Password");					
				
					}else if(path!=null && path.equals("/roleList")){
				
						out.print("<a href='"+request.getContextPath()+"/roleList.do'>Configuration</a> &gt; Role");
				
					}else if(path!=null && path.equals("/manageProfiles")){
				
						out.print("<a href='"+request.getContextPath()+"/manageProfiles.do'>Configuration</a> &gt; Profile");
				
					}else if(path != null && path.equals("/addEditRole") && mode != null && mode.equals("assign")){
				
						out.print("<a href='"+request.getContextPath()+"/roleList.do'>Configuration</a> &gt; <a href='"+request.getContextPath()+"/roleList.do'>Role</a> &gt; Add New Role");
				
					}else if(path != null && path.equals("/manageAction") && mode != null && mode.equals("createClicked")){
				
						out.print("<a href='"+request.getContextPath()+"/manageProfiles.do'>Configuration</a> &gt; <a href='"+request.getContextPath()+"/manageProfiles.do'>Profile</a> &gt; Add New Profile");
				
					}else if(path != null && path.equals("/addEditRole") && mode != null && mode.equals("edit")){
				
						out.print("<a href='"+request.getContextPath()+"/roleList.do'>Configuration</a> &gt; <a href='"+request.getContextPath()+"/roleList.do'>Role</a> &gt; Edit Role");
				 	
					}else if(path != null && path.equals("/manageAction") && mode != null && mode.equals("editClicked")){
						
						out.print("<a href='"+request.getContextPath()+"/manageProfiles.do'>Configuration</a> &gt; <a href='"+request.getContextPath()+"/manageProfiles.do'>Profile</a> &gt; Edit Profile");
						
					}
				%>
			</td>
		</tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td class="pgHdr">
				<% 
					if (path != null && path.equals("/fetchTxnLog")) {
				%>		
						<bean:message key="txnLogList.header.title.name"/>
				<% 	
					}else if(path != null && path.equals("/servicePartnerList")){
				%>		
						<bean:message key="serviceProviderList.header.title.name"/>
				<%	
					}else if(path != null && path.equals("/userList")){
				%>		
						<bean:message key="userList.header.title.name"/>
				<% 	
					}else if(path != null && path.equals("/roleList")){
				%>		
						<bean:message key="roleList.header.title.name"/>
				<% 		
					}else if(path != null && path.equals("/changePassword")){
				%>		
						<bean:message key="changePswd.header.title.name"/>
				<% 	
					}else if(path != null && path.equals("/manageProfiles")){
				%>	
						<bean:message key="manageProfiles.header.title.name"/>
				<% 		
					}else if(path != null && path.equals("/addEditRole") && mode != null && mode.equals("assign")){
				%>		
						<bean:message key="newRole.header.title.name"/>
				<% 	
					}else if(path != null && path.equals("/manageAction") && mode != null && mode.equals("createClicked")){
				%>		
						<bean:message key="defineProfile.header.title.name"/>
				<% 	
					}else if(path != null && path.equals("/addEditRole") && mode != null && mode.equals("edit")){
				%>		
						<bean:message key="editRole.header.title.name"/>
				<% 
					}else if(path != null && path.equals("/manageAction") && mode != null && mode.equals("editClicked")){
				%>
						<bean:message key="editProfile.header.title.name"/>
				<% 
					}
				%>
			</td>
			<td class="pgHdr" align="right" colspan="3">
				<% 
					if(path != null && path.equals("/fetchTxnLog")){
				%>
						<logic:equal name="viewSpProfileAccess" value="viewSpProfile">
							<a href="javascript:void(0)" onclick="openViewEditSpDetailsPopup(event, 'view')" title="View Service Partner Details">
								<bean:message key="txnLogList.header.link.viewProfile"/>
						</logic:equal>
						<logic:equal name="editSpProfileAccess" value="editSpProfile">
							<a href="javascript:void(0)" onclick="openViewEditSpDetailsPopup(event, 'edit')" title="View/Edit Service Partner Details">
								<bean:message key="txnLogList.header.link.editProfile"/>
							</a>
						</logic:equal>
						<logic:equal name="viewUserProfileAccess" value="viewUserProfile">
							<a href="javascript:void(0)" onclick="openUserProfile(event)">My Profile</a>
						</logic:equal>
				<%
					}else if(path != null && path.equals("/userList")){
				%>
						<img src="<%=request.getContextPath()%>/images/mimoportal/user/add-user.png" style="cursor: pointer;" height="20"
							width="20" title="Add User" onclick="newUser(event);"/>
				
				<%	}else if(path != null && path.equals("/servicePartnerList")){
				
				%>
						<a href="javascript:void(0)" onclick='showAddSp(event, "<bean:message key='addSp.header.title.name'/>")' title="Add Service Partner">
							<bean:message key="serviceProviderList.header.link.addSp"/>
						</a>
				<%
					}else if(path != null && path.equals("/manageProfiles")){
						
				%>
						<a onclick="createProfile()" style="cursor: pointer;" title="Add Profile">
							<bean:message key="manageProfiles.header.link.addProfile"/>
						</a>
				<%	
					}else if(path != null && path.equals("/roleList")){
						
				%>
						<a onclick="newRole();" style="cursor: pointer;" title="New Role">
							<bean:message key="roleList.header.link.addRole"/>
						</a>
				<%						
					}
				%>
			</td>
		</tr>
	</table>
</body>
