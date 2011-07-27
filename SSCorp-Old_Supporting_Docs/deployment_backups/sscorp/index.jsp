<%-- 
    Document   : index
    Created on : 1 Feb, 2010, 9:51:54 PM
    Author     : bhaskar
--%>

<%
String contextPath = request.getContextPath()  + "/home.do";
System.out.println("------------------------>>>>" + contextPath);
response.setStatus(301);
response.setHeader( "Location",  contextPath);
response.setHeader( "Connection", "close" );
//response.sendRedirect(request.getContextPath() + contextPath);

%>

<%--<table border="0" border="100%"><tr>
<th align="right">Request Method:</th>
<td align="left"><%= request.getMethod() %></td></tr><tr>
<th align="right">Servlet Path:</th>
<td align="left"><%= request.getServletPath() %>, </td>
<td><%= request.getContextPath() %>, <%= request.getRequestURL().toString()%></td></tr></table>
--%>