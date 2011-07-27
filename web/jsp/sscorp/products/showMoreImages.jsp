<%-- 
    Document   : showMoreImages
    Created on : 28 Mar, 2010, 7:10:00 PM
    Author     : bhaskar
--%>

<%@include file="/jsp/include.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css" />
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/script/products/productDetails.js"></script>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td align="center" valign="middle">
            <logic:present name="productImageList">
                <logic:iterate name="productImageList" id="image" offset="${offset}" length="${imagesPageLength}">
                    <img src="${image}" border="1" title="${productName}" alt="${productName}"/>
                </logic:iterate>
            </logic:present>
            <logic:notPresent name="productImageList">
                <font color="red">Image could not be displayed. Please try again later.</font>
            </logic:notPresent>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td align="center" class="data">
            <b>${productName}</b>
        </td>
    </tr>
</table>

<html:form action="/showMoreImages.do" method="post">
    <html:hidden property="linkClicked"></html:hidden>
    <html:hidden property="offset"></html:hidden>
</html:form>

<c:if test="${productImageListSize > 1}">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td>
                <c:if test="${offset > 0}">
                    <img src="<%=request.getContextPath()%>/images/sscorp/previous.jpg"
                        onclick="getImage('${offset}', 'previous')" style="cursor:pointer"
                        title="Previous image" alt="${productName}"/>
                </c:if>
                &nbsp;
            </td>
            <td align="right">
                <c:if test="${offset < productImageListSize - 1}">
                    <img src="<%=request.getContextPath()%>/images/sscorp/next.jpg"
                        onclick="getImage('${offset}', 'next')" style="cursor:pointer"
                        title="Next image" alt="${productName}"/>
                </c:if>

            </td>
        </tr>
    </table>
</c:if>
