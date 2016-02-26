<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common.jsp" %>

<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins
folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<div class="row"  style="padding:5px;">



    <div class="col-md-12">
        <div class="box">
            <table class="table table-bordered">

                <form role="form" method="post">
                    <input type="hidden" id="bno" name="bno" value="" />
                </form>

                <tr>
                    <th style="width: 10px;"><input type="checkbox" name="chkAll"/></th>
                    <th style="width: 10px;">BNO</th>
                    <th>TITLE</th>
                    <th>WRITER</th>
                    <th>REGDATE</th>
                    <th>DEL</th>
                    <th style="width: 40px;">VIEWCNT</th>
                </tr>
                <c:forEach items="${list}" var="boardVO">
                    <tr>
                        <th><input type="checkbox" name="chk"/></th>
                        <td>${boardVO.bno}</td>
                        <%--<td><a href="/board/read?bno=${boardVO.bno}">${boardVO.title}</a></td>--%>
                        <td><a href="/board/read${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno}"><c:out value="${boardVO.title}" default="제목없음..."/></a></td>
                        <td>${boardVO.writer}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${boardVO.regdate}" /></td>
                        <td><button onclick="fnRemove('${boardVO.bno}');" data-rno="${boardVO.bno}" name="remove" class="form-control">삭제</button></td>
                        <td style="width: 40px;"><span class="badge bg-red">${boardVO.viewcnt}</span></td>
                    </tr>
                </c:forEach>
            </table>

            <div class="text-center">
                <ul class="pagination">

                    <c:if test="${pageMaker.prev}">
                        <li><a href="listPage?page=${pageMaker.startPage - 1}">&laquo;</a></li>
                    </c:if>

                    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                        <li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}" /> >
                            <a href="listPage?page=${idx}">${idx}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                        <li><a href="listPage?page=${pageMaker.endPage+1}">&raquo;</a></li>
                    </c:if>

                </ul>

            </div>


            <div class="box-footer">
                <button type="submit" class="btn btn-primary" id="btnWrite">새글쓰기</button>
            </div>
        </div>
    </div>
</div>



<script>

    var result = '${msg}';

    if (result == 'success') {
        alert("처리가 완료 되었습니다.");
    }

    function fnRemove(bno) {

        alert(bno + " 삭제 합니다.");

        var formObj = $("form[role='form']");
        $("#bno").val(bno);
        formObj.attr("action", "/board/remove");
        formObj.submit();

    }

    $(document).ready(function() {

        var formObj = $("form[role='form']");
        console.log(formObj);

        $("#btnWrite").on("click", function() {
            self.location = "/board/register";
        });


//        $('.pagination a').each(function() {
//            if ($(this).attr('href') != '#') {
//                var hrefURI = $(this).attr('href');
//                var params = hrefURI.substring(hrefURI.indexOf('?'));
//
//                $(this).click(function(event) {
//                    event.preventDefault();
//                    $.ajax({
//                        url: '/board/listPage' + params,
//                        type: 'get',
//                        dataType: 'html',
//                        success: function(data) {
//                            console.log("data", data);
//                            $('body').html(data);
//                        }
//                    });
//                });
//            }
//        });

    });

</script>
