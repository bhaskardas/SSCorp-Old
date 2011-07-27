<!-- 
/** @(#)layout.jsp
 * Version : 1.0
 * Date: 15 Nov 2009
 *
 * @author Bhaskar Das
 * 
 */
 
/** 
   Project 		: SSCorp
   Module  		:  
   Program 		: layout.jsp
   Description 	:JSP for defining the layout of the whole page using tiles.

   REVISION HISTORY
 
    S.No.  				: 
    Author  			: 
    Version             : 1.0
    Date of Revision    : 
    Defect Id           :
    Revision Details    : Initial Release
**/
-->

<%@ page language="java"%>
<%@ include file="/jsp/include.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css" />
		<title>Super Sales Corporation</title>

		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="description" content="Super Sales Corporation" />
		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />

	</head>
	
	<body>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="border">
			<tr>
				<td>
					<tiles:insert attribute="header" />
				</td>
			</tr>
			<tr>
				<td>&nbsp;
					<tiles:insert attribute="menu" />
				</td>
			</tr>
			<tr>
				<td>
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td>&nbsp;
								<%--<tiles:insert attribute="moduleTop" />--%>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<tiles:insert attribute="body" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<tiles:insert attribute="footer" />
				</td>
			</tr>
		</table>
	</body>
</html>
