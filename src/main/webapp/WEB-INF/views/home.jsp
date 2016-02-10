<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="velocity" uri="http://velocity.apache.org/velocity-view" %>


<velocity:view>

<<<<<<< HEAD
    <section class="content">

        #if($status == "NORMAL")
            <div>일반 </div>
        #elseif($status == "RENTNOW")
            <div>찾음</div>
        #else
            <div>분실</div>
        #end

        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>Title</th>
                <th>status</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>
            #foreach($book in $list)
            <tr>
                <td>$book.name</td>
                #if($book.status == "NORMAL")
                <td>일반</td>
                #elseif($book.status == "RENTNOW")
                <td>대여중</td>
                #else
                <td>분실</td>
                #end
                <td>$book.comment</td>
            </tr>
            #end
            </tbody>
        </table>

        <div class="row">
            <div class="col-md-12">
                <div class="list-group">
                    <a href="/board/register" class="list-group-item">
                        등록 화면 이동
                    </a>
                    <a href="/board/listPage" class="list-group-item">목록 화면 이동 </a>
                    <a href="/main" class="list-group-item">velocity 페이지 이동 </a>
                </div>
=======
    <div class="row">
        <div class="col-md-12">
            <div class="list-group">
                <a href="/board/register" class="list-group-item">
                    등록 시작
                </a>
                <a href="/board/listPage" class="list-group-item">목록</a>
>>>>>>> 24d28e5cda2e9b204ea9e4e6501e7b3f968c11bb
            </div>
        </div>
    </section>

<<<<<<< HEAD
</velocity:view>
=======
<%@include file="include/footer.jsp" %>
>>>>>>> 24d28e5cda2e9b204ea9e4e6501e7b3f968c11bb
