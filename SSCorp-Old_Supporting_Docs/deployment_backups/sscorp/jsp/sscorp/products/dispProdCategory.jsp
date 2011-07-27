<%-- 
    Document   : dispProdCategory
    Created on : 14 Mar, 2010, 5:45:35 PM
    Author     : bhaskar
--%>

<%@include file="/jsp/include.jsp"%>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/script/products/productDetails.js"></script>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td width="100%" colspan="4">
            <h3>Product Categories</h3>
        </td>
    </tr>
</table>

<html:form action="/fetchProductDetails.do" method="post">
    <html:hidden property="selectedProductCat"></html:hidden>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <logic:present name="productCategoryList">
            <logic:iterate name="productCategoryList" id="prodCat">
                <tr>
                    <td width="20%" class="data" align="right">
                        <b>${prodCat.productCategoryName}</b>
                    </td>
                    <td width="30%" class="data" align="left">
                        <a id="${prodCat.productCategoryId}" onclick="getProduct(this, 'productCategoryPage');">
                            <img src="${prodCat.photoAttachName}" border="1" alt="${prodCat.productCategoryName}"
                                title="${prodCat.productCategoryName}"/>
                        </a>
                    </td>
                    <td width="30%" align="left" class="data" colspan="2">
                        <a id="${prodCat.productCategoryId}" onclick="getProduct(this, 'productCategoryPage');">
                            <img src="<%=request.getContextPath()%>/images/sscorp/see_more_button.jpg"
                            alt="Click to see the products under this category"
                            title="Click to see the products under this category" style="cursor:pointer"/>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
            </logic:iterate>
        </logic:present>
        <logic:notPresent name="productCategoryList">
            <tr>
                <td colspan="3" class="data" align="center">
                    <font color="red">Data could not be displayed. Try again after some time.</font>
                </td>
            </tr>
        </logic:notPresent>
    </table>
</html:form>
