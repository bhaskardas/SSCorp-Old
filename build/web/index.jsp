<%-- 
    Document   : index
    Created on : 1 Feb, 2010, 9:51:54 PM
    Author     : bhaskar
--%>

<%
String contextPath = request.getContextPath()  + "/home.do";
response.setStatus(301);
response.setHeader( "Location",  contextPath);
response.setHeader( "Connection", "close" );
%>
