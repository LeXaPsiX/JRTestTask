<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <title>Создание пользователя</title>

    <style>

        .error {
            color: #ff0000;
        }
    </style>

</head>

<body>

<h2>Создать пользователя:</h2>

<form:form method="POST" modelAttribute="user">
    <form:hidden path="createdDate" id="createdDate"/>
    <table>

        <tr>
            <td><label for="name">Имя: </label> </td>
            <td><form:input path="name" id="name"/></td>
            <td><form:errors path="name" cssClass="error"/></td>
        </tr>
        <tr>
            <td><label for="age">Возраст: </label> </td>
            <td><form:input path="age" id="age"/></td>
            <td><form:errors path="age" cssClass="error"/></td>
        </tr>
        <tr>
            <td><label for="isAdmin">Админ: </label> </td>
            <td><form:checkbox path="isAdmin" id="isAdmin"/></td>
        </tr>

        <tr>
            <td colspan="3">
                <input type="submit" value="Добавить"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
