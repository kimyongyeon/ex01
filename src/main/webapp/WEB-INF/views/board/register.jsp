<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>


<div class="row" style="padding: 10px;">
	<div class="col-md-12">
		<div class="box">

            <form:form role="form" method="POST" commandName="commandNameBoard" action="register" id="frm">

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

                    <div class="form-group">
                        프로그래머 <input type="checkbox"
							name="job" id="job1" class="form-control" placeholder="Enter Writer" /> </br>
                        퍼블리셔 <input type="checkbox"
							name="job" id="job2" class="form-control" placeholder="Enter Writer" />
					</div>

                    <div class="form-group">
                        남 <input type="radio"
							name="sex" id="man" class="form-control" placeholder="Enter Writer" /> </br>
                        여 <input type="radio"
							name="sex" id="woman" class="form-control" placeholder="Enter Writer" />
					</div>

                    <div class="form-group">

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
        var frm = $("#frm");
        console.log(formObj);
        $("#btnCancel").on("click", function() {
            self.location = "/board/listPage";
        });
        $("#btnSave").on("click", function() {

//            $("#title").val("편집술...");
            console.log("formObj",frm.serialize());
            formObj.submit();
        });


    });
</script>
