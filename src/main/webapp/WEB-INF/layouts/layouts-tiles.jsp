<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Insert title here</title>
</head>
<body>
<div id="header">
    <tiles:insertAttribute name="header"/>

    <div id="content" style="padding: 10px;">
        <tiles:insertAttribute name="content"/>
    </div>

    </div>
    <tiles:insertAttribute name="footer"/>

</div>


</body>
</html>
