
<%@ include file="/jsp/include.jsp"%>

<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/script/generalScript.js"></script>

<form name="menuForm" method="post" action="">
    <input type="hidden" name="currentMenuName"/>
</form>

<table border="0" cellpadding="2" cellspacing="2">
    <tr>
        <c:forEach var="menu" items="${menuMap}">
            <c:choose>
                <c:when test="${menu.key == currentMenuName}">
                    <td class="menuTextSelected">
                        <a style="border:none;" class="menuTextSelected" onclick="showMenu('<%=request.getContextPath()%>', '${menu.value}', '${menu.key}')">
                            ${menu.key}
                        </a>
                    </td>
                </c:when>
                <c:otherwise>
                    <td class="menuText">
                        <a class="menuText" onclick="showMenu('<%=request.getContextPath()%>', '${menu.value}', '${menu.key}')">
                            ${menu.key}
                        </a>
                    </td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </tr>
</table>