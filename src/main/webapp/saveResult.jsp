<%--
  Created by IntelliJ IDEA.
  User: ggabelia
  Date: 4/26/2023
  Time: 5:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Save Result</title>
</head>
<body>

<sql:setDataSource
        var="db"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/movie"
        user="root"
        password="mysql"/>

<%
    String Title = request.getParameter("Title");
    String Director = request.getParameter("Director");
    String ReleaseDate = request.getParameter("ReleaseDate");
    String Rating = request.getParameter("Rating");
    String Description = request.getParameter("Description");
%>

<c:set var="Title" value="<%=Title%>" />
<c:set var="Director" value="<%=Director%>" />
<c:set var="ReleaseDate" value="<%=ReleaseDate%>" />
<c:set var="Rating" value="<%=Rating%>" />
<c:set var="Description" value="<%=Description%>" />


<sql:update dataSource="${db}">
    INSERT INTO Movie
        (Title, Director, ReleaseDate, Rating, Description)
    VALUES
    (?, ?, ?, ?, ?);

    <sql:param value="${Title}"/>
    <sql:param value="${Director}"/>
    <sql:param value="${ReleaseDate}"/>
    <sql:param value="${Rating}"/>
    <sql:param value="${Description}"/>
</sql:update>

<h1>SAVED!</h1>

<c:redirect url="index.jsp"></c:redirect>


</body>
</html>
