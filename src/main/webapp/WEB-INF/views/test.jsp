<%--
  Created by IntelliJ IDEA.
  User: yongyeonkim
  Date: 2016. 2. 25.
  Time: 오후 7:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <title>TEST</title>
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
</head>

    <!-- 변수선언 -->
    <c:set var="name" value="${name}" />
    <!-- scope 설정 -->
    <c:set var="request_name" value="홍길동" scope="request" />
    <!-- 변수 삭제 -->
    <c:remove var="remove_name" />
    <!-- 기본값 대체 -->
    <c:out value="${name}" default="기본값 홍길동" />


    <h2>댓글페이지</h2>

    <div>
        <div>
            REPLAYER <input class="form-control" type="text" name="replayer" id="newReplyWriter"/>
        </div>
        <div>
            REPLY TEXT <input class="form-control" type="text" name="replytext" id="newReplyText"/>
        </div>
        <br><button class="form-control" id="replyAddBtn">ADD REPLY</button>
    </div>
    <br/>
    <ul class="pagination"></ul>
    <ul id="replies" class="list-group"></ul>

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

<script>

    var bno = 1;

    getAllList();

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
                    getAllList();
                }
            }
        });
    });

    // 리스트
    function getAllList() {
        $.getJSON("replies/1/" + bno, function(data) {

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

            var str = "";
            // 리스트 화면 그리기
            $(data.list).each(function(){
               str += "<li data-rno='" + this.rno + "' class='replyLi list-group-item'><a href='#' class='list-group-item'>" +
                       this.rno + " : " + this. replytext +
                       "MOD</a></li>";
            });
            // 화면 리스트 그리기
            $("#replies").html(str);
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






</script>
