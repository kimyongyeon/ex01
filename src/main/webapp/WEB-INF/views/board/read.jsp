<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/common.jsp" %>
<style>
    #modDiv {
        width: 300px;
        height: 200px;
        background-color: gray;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -50px;
        margin-left: -150px;
        padding: 10px;
        z-index: 1000;
    }
</style>

<div class="row"  style="padding:10px;">

	<div class="col-md-12">


        <div class="box">

            <div class="box-body">
                <div class="form-group">번호 : <c:out value="${boardVO.bno}" /></div>
                <div class="form-group">개수 : ${fn:length(boardVO.title)}</div>
                <button type="submit" class="btn btn-warning">수정</button>
                <button type="submit" class="btn btn-danger">삭제</button>
                <button type="submit" class="btn btn-primary">목록</button>
            </div>

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

            <div class="box-body">
                <div class="form-group">
                    <label for="newReplyWriter">글쓴이</label>
                    <input type="text" id="newReplyWriter" name="replayer" class="form-control" value="${boardVO.writer }" />
                </div>
                <div class="form-group">
                    <label for="newReplyText">글내용</label>
                    <%--<input type="text" id="newReplyText" name="replytext" class="form-control" value="${boardVO.writer }" />--%>
                    <textarea name="replytext" id="newReplyText" rows="10" cols="100"></textarea>
                </div>
                <div class="form-group">
                    <button class="form-control" id="replyAddBtn">ADD REPLY</button>
                </div>

                <ul class="pagination"></ul>
                <ul id="replies" class="list-group"></ul>

            </div>
            <br/>


            <div id="modDiv" style="display: none;">
                <div class="modal-title"></div>
                <div>
                    <input class="form-control" type="text" id="replytext"/>
                </div>
                <div>
                    <button class="form-control" type="button" id="replyModBtn">Modify</button>
                    <button class="form-control" type="button" id="replyDelBtn">DELETE</button>
                    <button class="form-control" type="button" id="closeBtn">CLOSE</button>
                </div>
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
			self.location = "/board/listPage";
		});
	});

    var bno = "${boardVO.bno}";

    //getAllList();

    // 댓글 추가 버튼
    $("#replyAddBtn").on("click", function() {
        var replayer = $("#newReplyWriter").val();
        var replytext = $("#newReplyText").val();

        $.ajax({
            type: 'post',
            url: '/replies/register',
            headers: {
                "Content-Type" : "application/json",
                "X-HTTP-Method-Override" : "POST"
            },
            dataType : 'text',
            data : JSON.stringify({
                bno: bno,
                replayer : replayer,
                replytext : replytext
            }),
            success : function(result) {
                if (result == 'SUCCESS') {
                    alert("등록 되었습니다");
                    getPageList(1);

                }
            }
        });
    });

    // 리스트
    function getAllList() {
        $.getJSON("/replies/1/" + bno, function(data) {

            var str = "";

            $(data.list).each(function() {
                str += "<li data-rno='" + this.rno + "' class='replyLi list-group-item'><a href='#' class='list-group-item'>" +
                this.rno + " : " + this. replytext +
                "MOD</a></li>";
            });

            $("#replies").html(str);
        });
    }

    // 리스트 버튼 팝업이 뜬다
    $("#replies").on("click", ".replyLi a", function() {
        var reply = $(this).parent();

        var rno = reply.attr("data-rno");
        var replytext = reply.text();

//        alert(rno + " : " + replytext);
        $(".modal-title").html(rno);
        $("#replytext").val(replytext);
        $("#modDiv").show("slow");
    });

    // 팝업 삭제 버튼
    $("#replyDelBtn").on("click", function() {
        var rno = $(".modal-title").html();
        var replytext = $("#replytext").val();

        $.ajax({
            type : 'delete',
            url : '/replies/' + rno,
            headers : {
                "Content-Type" : "application/json",
                "X-HTTP-Method-Overrid" : "DELETE"
            },
            dataType : 'text',
            success : function(result) {
                console.log("result : " + result);
                if (result == "SUCCESS") {
                    alert("삭제 되었습니다");
                    $("#modDiv").hide("slow");
                    getAllList();
                }
            }
        });
    });

    // 팝업 수정 버튼
    $("#replyModBtn").on("click", function() {
        var rno = $(".modal-title").html();
        var replytext = $("#replytext").val();

        $.ajax({
            type : 'put',
            url : '/replies/' + rno,
            headers : {
                "Content-Type" : "application/json",
                "X-HTTP-Method-Overrid" : "PUT"
            },
            data : JSON.stringify({replytext: replytext}),
            dataType : 'text',
            success : function(result) {
                console.log("result : " + result);
                if (result == "SUCCESS") {
                    alert("수정 되었습니다");
                    $("#modDiv").hide("slow");
                    //getAllList();
                    getPageList(replyPage);
                }
            }
        });
    });

    // 페이징 리스트
    function getPageList(page) {
        $.getJSON("/replies/" + bno + "/" + page, function(data){

            console.log(data.list.length);
            console.log(data.list);

            var str = "";
            // 리스트 화면 그리기
            $(data.list).each(function(){
                str += "<li data-rno='" + this.rno + "' class='replyLi list-group-item'><a href='javascript:void(0);'>" +
                this.rno + " : " + this. replytext + "</a></li>";
            });
            // 화면 리스트 그리기
            $("#replies").html("<pre>"+str+"</pre>");
            // 페이징 숫자 처리
            printPaging(data.pageMaker);
        });

    }

    // 페이징 숫자 그리기
    function printPaging(pageMaker) {

        var str = "";

        // 이전 그리기
        if(pageMaker.prev) {
            str += "<li><a href='" + (pageMaker.startPage-1) + "'> << </a></li>";
        }

        // 숫자 그리기
        for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++) {
            var strClass = pageMaker.cri.page === i ? 'class=active' : '';
            str += "<li " + strClass + "><a href='" + i +"'>" + i +"</a></li>";
        }

        // 다음 그리기
        if(pageMaker.next) {
            str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
        }

        // 화면 페이징 숫자 그리기
        $(".pagination").html(str);
    }

    var replyPage = 1;

    // 페이징 버튼 클릭시
    $(".pagination").on("click", "li a", function(event) {
        event.preventDefault();

        replyPage = $(this).attr("href");

        getPageList(replyPage);
    });

    $("#closeBtn").on("click" , function() {
        $("#modDiv").hide("slow");
    });

    getPageList(replyPage);

</script>
