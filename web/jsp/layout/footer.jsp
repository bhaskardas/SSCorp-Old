<%@ include file="/jsp/include.jsp"%>

<form action="" method="post" name="footerForm">
    <input type="hidden" name="currentMenuName"/>
</form>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
		<td class="footerLink" align="center">
            <c:forEach var="menu" items="${menuMap}">
                |&nbsp;&nbsp;
                <a onclick="showMenu4mFooter('<%=request.getContextPath()%>', '${menu.value}', '${menu.key}')">
                    ${menu.key}
                </a>
                &nbsp;
            </c:forEach> | 
		</td>
	</tr>
	<tr>
		<td class="footer" align="center">
			&copy; 2009 All rights reserved.
		</td>
	</tr>
</table>

