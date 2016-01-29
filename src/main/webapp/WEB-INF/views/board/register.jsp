<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>

<style>
    .error {
        color: #ff0000;
    }

    .errorblock {
        color: #000;
        background-color: #ffEEEE;
        border: 3px solid #ff0000;
        padding: 8px;
        margin: 16px;
    }
</style>

<div class="row" style="padding: 10px;">
	<div class="col-md-12">
		<div class="box">
            <form:form role="form" method="POST" commandName="commandNameBoard" action="register">
                <form:errors path="*" cssClass="errorblock" element="div" />
				<div class="box-body">
					<div class="form-group">
						<label for="title">Title</label>
                        <form:input path="title" cssClass="form-control"></form:input>
                        <form:errors path="title" cssClass="error" ></form:errors>
                        <%--<input type="text"--%>
							<%--name="title" id="title" class="form-control" placeholder="Enter Title" />--%>
					</div>

					<div class="form-group">
						<label for="content">Content</label>
                        <form:textarea path="content" cssClass="form-control"></form:textarea>
                        <form:errors path="content" cssClass="error" ></form:errors>
						<%--<textarea name="content" id="content" rows="3" class="form-control"--%>
							<%--placeholder="Enter...."></textarea>--%>
					</div>

					<div class="form-group">
						<label for="writer">Writer</label>
                        <form:input path="writer" cssClass="form-control"></form:input>
                        <form:errors path="writer" cssClass="error" ></form:errors>
                        <%--<input type="text"--%>
							<%--name="writer" id="writer" class="form-control" placeholder="Enter Writer" />--%>
					</div>

				</div>

			</form:form>

            <div class="box-footer">
                <button class="btn btn-primary" id="btnSave">저장</button>
                <button class="btn btn-warning" id="btnCancel">취소</button>
            </div>

		</div>
	</div>
</div>

<script>

    $(document).ready(function() {
        var formObj = $("form[role='form']");
        console.log(formObj);
        $("#btnCancel").on("click", function() {
            self.location = "/board/listAll";
        });
        $("#btnSave").on("click", function() {
            formObj.submit();
        });
    });
</script>

<%@include file="../include/footer.jsp"%>