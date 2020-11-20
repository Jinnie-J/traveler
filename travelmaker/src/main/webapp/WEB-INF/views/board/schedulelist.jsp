<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>


	<div class="container">
		<div>
			<h1>내일정 공유</h1>
		</div>

		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th>일정번호</th>
						<th>일정명</th>
					</tr>
				</thead>

				<c:forEach items="${schedulelist}" var="schedule">
					<tr>
						<td><a
							href='/board/register?schNo=<c:out value="${schedule.schNo}"/>'><c:out
									value="${schedule.schNo}" /></a></td>
						<td><c:out value="${schedule.schTitle}" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<button id='regBnt' onclick="location.href='/board/list'" class="btn btn-sm-btn-primary">취소</button>
		</div>
	</div>

</body>
</html>