<%-- 
    Document   : projectList
    Created on : 3 Jan, 2010, 7:50:43 PM
    Author     : bhaskar
--%>
<%@include file="/jsp/include.jsp"%>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/script/generalScript.js"></script>

<html:form action="/fetchProjectList.do" method="post">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="100%" colspan="4">
                <h3>Search Project Categories</h3>
            </td>
        </tr>
        <tr>
            <td width="40%" align="right" class="data" colspan="2">
                <b>Choose a project category</b>:
            </td>
            <td width="60%" align="left" class="data" colspan="2">
                <html:select property="selectedProjCategory" onchange="getProjects4Category(this)">
                    <html:option value="">--select--</html:option>
                    <logic:present name="projCategoryList">
                        <html:options collection="projCategoryList" labelProperty="projectCategory" property="projectCatId"/>
                    </logic:present>
                </html:select>
            </td>
        </tr>
    </table>
</html:form>

<html:form action="/showNextProjectsPage.do" method="post">
    <html:hidden property="linkClicked"></html:hidden>
    <html:hidden property="offset"></html:hidden>
</html:form>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
           &nbsp;
        </td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <logic:present name="projectMap">
        <tr>
            <td width="100%" colspan="3">
                    <font color="red">Showing project category ${offset + 1} - </font>
                    <c:choose>
                        <c:when test="${offset + projectPageLength > projectMapSize}">
                            <font color="red">${projectMapSize}</font>
                        </c:when>
                        <c:otherwise>
                            <font color="red">${offset + projectPageLength}</font>
                        </c:otherwise>
                    </c:choose>
                    <font color="red">of ${projectMapSize}</font>
                    <c:choose>
                        <c:when test="${offset == 0}">
                            [First/Previous]
                        </c:when>
                        <c:otherwise>
                            [<a onclick="showNextProjectPage(${offset}, 'first')">
                                First
                            </a>
                            /<a onclick="showNextProjectPage(${offset}, 'previous')">
                                Previous
                            </a>]
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${offset >= projectMapSize - projectPageLength}">
                            [Next/Last]
                        </c:when>
                        <c:otherwise>
                            [<a onclick="showNextProjectPage(${offset}, 'next')">
                                Next
                            </a>
                            /<a onclick="showNextProjectPage(${offset}, 'last')">
                                Last
                            </a>]
                        </c:otherwise>
                    </c:choose>
            </td>
        </tr>
        <tr>
            <td colspan="3">
               &nbsp;
            </td>
        </tr>
        <tr>
            <td width="40%">
                <h3>Project Category</h3>
            </td>
            <td width="30%">
                <h3>Projects</h3>
            </td>
            <td width="30%">
                <h3>City/State</h3>
            </td>
        </tr>
        <logic:iterate name="projectMap" id="projCategoryName" offset="${offset}" length="${projectPageLength}">
            <tr>
                <td width="40%" colspan="3" align="left" class="data">
                    <b>${projCategoryName.key}</b>
                </td>
            </tr>
            <c:set var="projectName" value="${projCategoryName.value}"></c:set>
            <logic:iterate name="projectName" id="pn">
                <tr>
                    <td width="40%" align="right">
                        &nbsp;
                    </td>
                    <td width="30%" class="data">
                        ${pn.key}
                    </td>
                    <td width="30%" class="data">
                        ${pn.value}
                    </td>
                </tr>
            </logic:iterate>
        </logic:iterate>
        <tr>
            <td colspan="3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="3">
                    <font color="red">Showing project category ${offset + 1} - </font>
                    <c:choose>
                        <c:when test="${offset + projectPageLength > projectMapSize}">
                            <font color="red">${projectMapSize}</font>
                        </c:when>
                        <c:otherwise>
                            <font color="red">${offset + projectPageLength}</font>
                        </c:otherwise>
                    </c:choose>
                    <font color="red">of ${projectMapSize}</font>
                    <c:choose>
                        <c:when test="${offset == 0}">
                            [First/Previous]
                        </c:when>
                        <c:otherwise>
                            [<a onclick="showNextProjectPage(${offset}, 'first')">
                                First
                            </a>
                            /<a onclick="showNextProjectPage(${offset}, 'previous')">
                                Previous
                            </a>]
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${offset >= projectMapSize - projectPageLength}">
                            [Next/Last]
                        </c:when>
                        <c:otherwise>
                            [<a onclick="showNextProjectPage(${offset}, 'next')">
                                Next
                            </a>
                            /<a onclick="showNextProjectPage(${offset}, 'last')">
                                Last
                            </a>]
                        </c:otherwise>
                    </c:choose>
            </td>
        </tr>
    </logic:present>
    <logic:notPresent name="projectMap">
        <tr>
            <td align="center" colspan="3" width="100%">
                <b>Data could not be displayed right now. Please try again later.</b>
            </td>
        </tr>
    </logic:notPresent>
</table>