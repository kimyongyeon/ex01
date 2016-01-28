<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


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
			<form:form role="form" method="post" commandName="board" action="/board/register">
                <form:errors path="*" cssClass="errorblock" element="div" />
				<div class="box-body">
					<div class="form-group">
						<label for="title">Title</label>
                        <input type="text"
							name="title" id="title" class="form-control" placeholder="Enter Title" />
					</div>

					<div class="form-group">
						<label for="content">Content</label>
						<textarea name="content" id="content" rows="3" class="form-control"
							placeholder="Enter...."></textarea>
					</div>

					<div class="form-group">
						<label for="writer">Writer</label> <input type="text"
							name="writer" id="writer" class="form-control" placeholder="Enter Writer" />
					</div>

				</div>

				<div class="box-footer">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>

			</form:form>

		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>