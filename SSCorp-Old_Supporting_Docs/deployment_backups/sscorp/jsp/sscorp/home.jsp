<%-- 
    Document   : home
    Created on : 3 Oct, 2009, 1:20:36 AM
    Author     : bhaskar
--%>

<%@include file="/jsp/include.jsp"%>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td width="50%">
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <logic:present name="aboutUs">
                        <td width="100%">
                            <h3>About Us</h3>
                            ${aboutUs}
                            <a href="<%=request.getContextPath()%>/companyProfile.do">
                                Read More...
                            </a>
                        </td>
                    </logic:present>
                    <logic:notPresent name="aboutUs">
                        <td width="100%">
                            Cannot Display information due to some error.<br>
                            Please try again later.
                        </td>
                    </logic:notPresent>
                </tr>
                <tr>
                    <td width="100%">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td width="100%">
                        <h3>Contact Details</h3>
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
        <td width="50%" align="center">
            <a href="" style="cursor:pointer">
                <object width="200" height="50">
                    <param name="movie" value="sscorp.swf">
                        <embed src="<%=request.getContextPath()%>/movies/SSCorp_photo_slideshow.swf"
                                width="80%" height="300">
                        </embed>
                </object>
            </a>
        </td>
    </tr>
</table>
