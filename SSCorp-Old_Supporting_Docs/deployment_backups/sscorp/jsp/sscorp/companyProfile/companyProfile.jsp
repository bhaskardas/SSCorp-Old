<%-- 
    Document   : companyProfile
    Created on : 16 Nov, 2009, 7:36:09 AM
    Author     : bhaskar
--%>

<%@include file="/jsp/include.jsp"%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="100%">
            <h3>About Us</h3>
            <logic:present name="aboutUs">
                ${aboutUs}
            </logic:present>
            <logic:notPresent name="aboutUs">
                Cannot display data due to some problem. <br>
                Please Try again later.
            </logic:notPresent>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td width="100%">
            <h3>Infrastructure and Manufacturing</h3>
            <logic:present name="infrastructure">
                ${infrastructure}
            </logic:present>
            <logic:notPresent name="infrastructure">
                Cannot display data due to some problem. <br>
                Please Try again later.
            </logic:notPresent>
        </td>
    </tr>
    <tr>
        <td width="100%">
            &nbsp;
        </td>
    </tr>
    <tr>
        <td width="100%">
            <h3>Our Achievements</h3>
            <logic:present name="achievementList">
                <logic:present name="achievmentsHeading">
                    ${achievmentsHeading}
                </logic:present>
            </logic:present>
            <logic:notPresent name="achievementList">
                Cannot display data due to some problem. <br>
                Please Try again later.
            </logic:notPresent>
        </td>
    </tr>
    <tr>
        <td width="100%">
            &nbsp;
        </td>
    </tr>
    <tr>
        <td width="100%">
            <logic:present name="achievementList">
                <logic:iterate name="achievementList" id="achievements">
                    - <b>${achievements.achievementName}</b>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="5%">
                                &nbsp;
                            </td>
                            <td width="95%">
                                ${achievements.achievementDesc}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </logic:iterate>
            </logic:present>
        </td>
    </tr>
</table>
