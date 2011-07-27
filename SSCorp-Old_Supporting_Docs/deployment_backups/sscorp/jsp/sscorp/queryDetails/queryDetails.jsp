<%-- 
    Document   : queryForm
    Created on : 9 Oct, 2009, 1:08:57 AM
    Author     : bhaskar
--%>
<%@include file="/jsp/include.jsp"%>

<script language="Javascript" type="text/javascript" src="<%=request.getContextPath()%>/script/queryDetails/queryDetailsJS.js"></script>
<script language="Javascript" type="text/javascript" src="<%=request.getContextPath()%>/script/generalScript.js"></script>


<html:form action="/saveQuery.do" method="post">
    <logic:present name="message">
        <table>
            <tr>
                <td colspan="4">
                    <font color="#FFFF99">
                        ${message}
                    </font>
                </td>
            </tr>
        </table>
    </logic:present>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td colspan="4">
                <h3>QueryForm</h3>
            </td>
        </tr>
        <tr>
            <td width="20%">
                &nbsp;
            </td>
            <td colspan="3" align="right">
               <font color="#FFFF99">Fields marked as</font>
               <font color="red">*</font>
               <font color="#FFFF99"> are mandatory.</font>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right" class="data">
                <font color="red">*</font>Gender :
            </td>
            <td width="30%" align="left" class="data" colspan="3">
                <html:select property="gender">
                    <html:option value="">--Gender--</html:option>
                    <html:option value="Mr. ">Mr.</html:option>
                    <html:option value="Ms. ">Ms.</html:option>
                </html:select>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right" class="data">
                <font color="red">*</font>First Name :
            </td>
            <td width="30%" align="left" class="data">
                <html:text property="firstName" value="" maxlength="50"></html:text>
            </td>
            <td width="20%" align="right" class="data">
                Last Name :
            </td>
            <td width="30%" align="left" class="data">
                <html:text property="lastName" value="" maxlength="50"></html:text>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right" class="data">
                Company Name :
            </td>
            <td width="30%" align="left" class="data">
                <html:text property="companyName" maxlength="50" value=""></html:text>
            </td>
            <td width="20%" align="right" class="data">
                Company Website:
            </td>
            <td width="30%" align="left" class="data">
                <html:text property="companyWebsite" maxlength="50" value=""></html:text>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right" class="data">
                <font color="red">*</font>Email Id :
            </td>
            <td width="30%" align="left" class="data" colspan="3">
                <html:text property="emailId" maxlength="100" value=""></html:text>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right" class="data">
                Phone Number :
            </td>
            <td width="30%" align="left" class="data">
                <html:text property="phoneNo" maxlength="20" value=""></html:text>
            </td>
             <td width="20%" align="right" class="data">
                Mobile Number :
            </td>
            <td width="30%" align="left" class="data">
                <html:text property="mobileNo" maxlength="20" value=""></html:text>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right" class="data">
                Subject :
            </td>
            <td width="30%" colspan="3" class="data">
                <html:text property="subject" maxlength="100" value=""></html:text>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right" class="data">
                <font color="red">*</font>Query :
            </td>
            <td width="80%" colspan="3" class="data">
                <html:textarea property="queryString" cols="85" rows="3" value=""></html:textarea>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right" class="data">
                Where did you hear about us?
            </td>
            <td width="30%" colspan="3" class="data">
                <html:text property="hearAboutUs" value=""></html:text>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right" class="data">
                &nbsp;
            </td>
            <td colspan="3" class="data">
                <input type="button" name="sbmtQuery" value="Submit" class="button" onclick="submitQuery()"/>
                <input type="button" name="resetQueryFields" value="Reset" class="button"
                        onclick="resetQueryDetailsFields()"/>
            </td>
        </tr>
    </table>
</html:form>