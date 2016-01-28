<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<div class="row" style="padding: 10px;">
	<div class="col-md-12">
		<div class="box">

			<h4 style='margin-left: 10px;'>LIST ALL PAGE</h4>

			<form role="form" method="post">

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Bno</label> <input type="text"
							name='title' class='form-control' value='${boardVO.bno}'
							readonly="readonly" />
					</div>
					
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='title' class='form-control' value='${boardVO.title}'
							 />
					</div>

					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea name="content" id="" rows="3" class="form-control"
							>${boardVO.content }</textarea>
					</div>

					<div class="form-group">
						<label for="exampleInputWriter">Writer</label> <input type="text"
							name="writer" class="form-control" value="${boardVO.writer }"
							 />
					</div>

				</div>
			</form>

			<div class="box-footer">
				<button type="submit" class="btn btn-primary">SAVE</button>
				<button type="submit" class="btn btn-warning">CANCEL</button>
			</div>

		</div>
	</div>
</div>

<script>

	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".btn-warning").on("click", function() {
			self.location = "/board/listAll";
		});
		$(".btn-primary").on("click", function() {
			formObj.submit();
		});
	});
</script>

<%@include file="../include/footer.jsp"%>