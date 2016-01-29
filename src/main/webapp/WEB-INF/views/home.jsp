<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="include/header.jsp" %>

<section class="content">

    <div class="row">
        <div class="col-md-12">
            <div class="list-group">
                <a href="/board/register" class="list-group-item">
                    등록
                </a>
                <a href="/board/listPage" class="list-group-item">목록</a>
            </div>
        </div>
    </div>
</section>

<%@include file="include/footer.jsp" %>