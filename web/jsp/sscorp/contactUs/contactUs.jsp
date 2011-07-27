<%-- 
    Document   : contactUs
    Created on : 4 Jan, 2010, 11:03:33 PM
    Author     : bhaskar
--%>

<%@include file="/jsp/include.jsp"%>

<h3>Contact Details</h3>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td width="20%">
            <img src="<%=request.getContextPath()%>/images/sscorp/ContactUs.jpg" height="100" width="100"/>
        </td>
        <td width="80%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100%">

                        <logic:present name="companyProfile">
                            <b>${companyProfile.companyName}</b><br>
                        </logic:present>
                        <logic:present name="contactDetails">
                            <logic:iterate name="contactDetails" id="cd">
                                ${cd.streetAddress},<br>
                                ${cd.city} - ${cd.zipCode},<br>
                                ${cd.province}, ${cd.country}<br>
                            </logic:iterate>
                        </logic:present>
                        <logic:notPresent name="contactDetails">
                            Contact Details could not be displayed right now. <br>
                        </logic:notPresent>
                        <logic:present name="companyProfile">
                            Phone - ${companyProfile.companyPhone}<br>
                            Fax - ${companyProfile.faxNumber}<br>
                            Email Id - ${companyProfile.emailId}
                        </logic:present>
                    </td>
                </tr>
                <tr>
                    <td width="100%">
                        &nbsp;
                    </td>
                </tr>
                <%--<tr>
                    <td width="100%">
                        <b>Mobile Numbers :</b><br>
                        <logic:present name="mobileNumberList">
                            <logic:iterate name="mobileNumberList" id="mobile">
                                ${mobile.mobileOwnerName} -
                                +${mobile.mobileNumber}<br>
                            </logic:iterate>
                        </logic:present>
                        <logic:notPresent name="mobileNumberList">
                            Mobile Numbers could not be displayed right now.
                        </logic:notPresent>
                    </td>
                </tr>--%>
            </table>
        </td>
    </tr>
</table>