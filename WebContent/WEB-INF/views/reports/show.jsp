<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${report != null}">
                <h2>日報 詳細ページ</h2>

                <table>
                    <tr>
                        <th>氏名</th>
                        <td><c:out value="${report.employee.name}" /></td>
                    </tr>
                    <tr>
                        <th>日付</th>
                        <td><fmt:formatDate value="${report.report_date}" pattern="yyyy-MM-dd" /></td>
                    </tr>
                    <tr>
                        <th>内容</th>
                        <!--
                            日報の内容について、ウィンドウを小さく表示した際に長い文章が
                            枠からはみ出ないようにする。
                            (はみ出る際はスクロールバーが表示)
                         -->
                        <td style="overflow: auto;">
                            <pre><c:out value="${report.content}" /></pre>
                        </td>
                    </tr>
                    <tr>
                        <th>登録日時</th>
                        <td>
                            <fmt:formatDate value="${report.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </td>
                    </tr>
                    <tr>
                        <th>更新日時</th>
                        <td>
                            <fmt:formatDate value="${report.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </td>
                    </tr>
                </table>

                <c:if test="${sessionScope.login_employee.id == report.employee.id}">
                    <p><a href="<c:url value="/reports/edit?id=${report.id}" />">この日報を編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value="/reports/index" />">一覧に戻る</a></p>
    </c:param>
</c:import>