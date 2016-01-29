<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../include/header.jsp"%>

<div class="row"  style="padding:10px;">
	<div class="col-md-12">
		<div class="box">
		
		<h4 style='margin-left:10px;'>상세보기</h4>
			
			<form role="form" method="post">
				<input type="hidden" name="bno" value="${boardVO.bno}" />
			</form>
			
			<div class="box-body">
				<div class="form-group">
					<label for="exampleInputEmail1">Title</label>
					<input type="text" name='title' class='form-control' value='${boardVO.title}' readonly="readonly"/>
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">Content</label>
					<textarea name="content" id="" rows="3" class="form-control" readonly="readonly">${boardVO.content }</textarea>
				</div>
				
				<div class="form-group">
					<label for="exampleInputWriter">Writer</label>
					<input type="text" name="writer" class="form-control" value="${boardVO.writer }" readonly="readonly"/>
				</div>
				
			</div>
			
			<div class="box-footer">
				<button type="submit" class="btn btn-warning">수정</button>
				<button type="submit" class="btn btn-danger">삭제</button>
				<button type="submit" class="btn btn-primary">목록</button>
			</div>
			
		</div>
	</div>
</div>

<script>
	var result = '${msg}';

	if (result == 'success') {
		alert("처리가 완료 되었습니다.");
	}
	
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".btn-warning").on("click" , function() {
			formObj.attr("action", "/board/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".btn-danger").on("click" , function() {
			formObj.attr("action", "/board/remove");
			formObj.submit();
		});
		$(".btn-primary").on("click" , function() {
			self.location = "/board/listAll";
		});
	});
</script>

<%@include file="../include/footer.jsp"%>