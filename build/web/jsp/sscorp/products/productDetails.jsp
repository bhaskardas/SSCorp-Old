<%-- 
    Document   : productDetails
    Created on : 7 Dec, 2009, 7:36:42 AM
    Author     : bhaskar
--%>

<%@include file="/jsp/include.jsp"%>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/script/products/productDetails.js"></script>

<html:form action="/fetchProductDetails.do" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="4" width="100%">
                <h3>Search Products in Categories</h3>
            </td>
        </tr>
        <tr>
            <td width="40%" colspan="2" align="right" class="data">
                <b>Choose a product category:</b>
            </td>
            <td width="60%" align="left" class="data" colspan="2">
               <html:select property="selectedProductCat" onchange="getProduct(this, 'productDetailsPage')">
                    <html:option value="">--select--</html:option>
                    <logic:present name="productCategoryMap">
                        <logic:iterate name="productCategoryMap" id="productCat">
                            <html:option value="${productCat.key}">${productCat.value}</html:option>
                        </logic:iterate>
                    </logic:present>
                </html:select>
            </td>
        </tr>
    </table>
</html:form>

<html:form action="/showNextProductPage.do" method="post">
    <html:hidden property="linkClicked"></html:hidden>
    <html:hidden property="offset"></html:hidden>
</html:form>

<form name="backForm" action="" method="post">

</form>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <logic:present name="productDetails">
        <tr>
            <td width="40%" colspan="3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="40%">
                    <font color="red">Showing product ${offset + 1} - </font>
                    <c:choose>
                        <c:when test="${offset + productPageLength > productListSize}">
                            <font color="red">${productListSize}</font>
                        </c:when>
                        <c:otherwise>
                            <font color="red">${offset + productPageLength}</font>
                        </c:otherwise>
                    </c:choose>
                    <font color="red">of ${productListSize}</font>
                    <c:choose>
                        <c:when test="${offset == 0}">
                            [First/Previous]
                        </c:when>
                        <c:otherwise>
                            [<a onclick="showNextPage('${offset}', 'first')">
                                First
                            </a>
                            /<a onclick="showNextPage('${offset}', 'previous')">
                                Previous
                            </a>]
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${offset >= productListSize - productPageLength}">
                            [Next/Last]
                        </c:when>
                        <c:otherwise>
                            [<a onclick="showNextPage('${offset}', 'next')">
                                Next
                            </a>
                            /<a onclick="showNextPage('${offset}', 'last')">
                                Last
                            </a>]
                        </c:otherwise>
                    </c:choose>
            </td>
            <td colspan="2" align="right">
                <img src="<%=request.getContextPath()%>/images/sscorp/back.jpg"
                    alt="Back to Product Categories"
                    title="Go Back to the Product Category Page."
                    onclick="goBack('<%=request.getContextPath()%>', '/fetchProductCategory.do')"
                    style="cursor:pointer"/>
            </td>
        </tr>
        <tr>
            <td width="40%" colspan="3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="40%" colspan="3">
                <h3>Product List</h3>
            </td>
        </tr>
        <logic:iterate name="productDetails" id="product" length="${productPageLength}" offset="${offset}">
            <tr>
                <td width="40%" align="left" class="data" valign="top">
                    <h4>${product.productName}</h4> <br>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td>
                                <b>Product Size</b> - ${product.productSize}<br>
                                <b>Product Finish</b> - ${product.productFinish}<br>
                                <b>Product Material</b> - ${product.productMaterial}<br><br>
                                <a href="<%=request.getContextPath()%>/showQueryPage.do" class="anchorText"
                                   title="Go to the Inquiry Page">
                                    Ask a Question
                                </a>
                            </td>
                        </tr>
                    </table>
                        
                </td>
                <td width="40%" align="center" class="data" valign="bottom">
                    <img src="${product.photoAttachName}" border="1" title="${product.productName}"
                        alt="${product.productName}"/>
                </td>
                <td width="20%" class="data" valign="middle">
                    &nbsp;
                    <c:if test="${product.isMoreImagesPresent == true}">
                        <a id="${product.productDetailId}" onclick="showMoreImages(this, '<%=request.getContextPath()%>')">
                            <img src="<%=request.getContextPath()%>/images/sscorp/see_more_button.jpg"
                                title="Click to see more images" alt="More Images"/>
                        </a>
                    </c:if>
                </td>
            </tr>
        </logic:iterate>
        <tr>
            <td width="40%" colspan="3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="40%" colspan="3">
                    <font color="red">Showing product ${offset + 1} - </font>
                    <c:choose>
                        <c:when test="${offset + productPageLength > productListSize}">
                            <font color="red">${productListSize}</font>
                        </c:when>
                        <c:otherwise>
                            <font color="red">${offset + productPageLength}</font>
                        </c:otherwise>
                    </c:choose>
                    <font color="red">of ${productListSize}</font>
                    <c:choose>
                        <c:when test="${offset == 0}">
                            [First/Previous]
                        </c:when>
                        <c:otherwise>
                            [<a onclick="showNextPage('${offset}', 'first')">
                                First
                            </a>
                            /<a onclick="showNextPage('${offset}', 'previous')">
                                Previous
                            </a>]
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${offset >= productListSize - productPageLength}">
                            [Next/Last]
                        </c:when>
                        <c:otherwise>
                            [<a onclick="showNextPage('${offset}', 'next')">
                                Next
                            </a>
                            /<a onclick="showNextPage('${offset}', 'last')">
                                Last
                            </a>]
                        </c:otherwise>
                    </c:choose>
            </td>
        </tr>
    </logic:present>
    <logic:notPresent name="productDetails">
        <tr>
            <td colspan="4">
                <font color="red">Data could not be displayed. Try again after some time.</font>
            </td>
        </tr>
    </logic:notPresent>
</table>