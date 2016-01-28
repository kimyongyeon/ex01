<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../include/header.jsp"%>

<div class="row"  style="padding:10px;">
	<div class="col-md-12">
		<div class="box">
		<h4 style='margin-left:10px;'>LIST ALL PAGE</h4>
			<table class="table table-bordered">
				<tr>
					<th style="width: 10px;">BNO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>REGDATE</th>
					<th style="width: 40px;">VIEWCNT</th>
				</tr>
				<c:forEach items="${list}" var="boardVO">
					<tr>
						<td>${boardVO.bno}</td>
						<td><a href="/board/read?bno=${boardVO.bno}">${boardVO.title}</a></td>
						<td>${boardVO.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${boardVO.regdate}" /></td>
						<td style="width: 40px;"><span class="badge bg-red">${boardVO.viewcnt}</span></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>

<script>
	var result = '${msg}';

	if (result == 'success') {
		alert("처리가 완료 되었습니다.");
	}
</script>

<%@include file="../include/footer.jsp"%>