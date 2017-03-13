<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>&copy; Balmasov Aleksey</title>
    <style>
        <%@include file='../../resources/base.theme.css' %>
    </style>
</head>
<body>


<div class="header">
	<div class="wrapper">

		<h1>Пользователи</h1>
		<p>&copy; Balmasov Aleksey, 2017 year.</p>
		
	</div>
</div>

<div class="wrapper">


	<div class="search">
		<div class="form">
		<form:form method="get" action="/">
			<input type="text" name="name" placeholder="Введите имя для поиска" />
			<input type="submit" value="Go!"/>
		</form:form>
		</div>
		
		<div class="clear">
		<form:form method="get" action="/">
			<input type="submit" value="Очистить поиск"/>
		</form:form>
		</div>
	</div>
	
	
	<table class="table">
	<thead>
		<tr>
			<td>ID</td>
			<td>ИМЯ</td>
			<td>ВОЗРАСТ</td>
			<td>АДМИН</td>
			<td>ДАТА СОЗДАНИЯ</td>
			<td width="100"></td>
		</tr>
	</thead>
	<tbody>
		 <c:forEach items="${users}" var="user">
			<tr>
				<td>${user.id}</td>
				<td><a href="#" onclick="document.getElementById('modal${user.id}').style.display='block'">${user.name}</a>
					<div id="modal${user.id}" class="modal">
						<div id="closeButton" onclick="window.location.href='/'">Х</div>
						<iframe src="<c:url value='/edit-${user.id}-user' />"></iframe>
					</div>
				</td>
				<td>${user.age}</td>
				<td>${user.isAdmin}</td>
				<td><joda:format value="${user.createdDate}" style="MM"/></td>
				<td><form:form method="get" action="/delete-${user.id}-user">
					<input type="submit" value="Удалить"/>
				</form:form></td>
			</tr>
		 </c:forEach>
			<tr>
				<td colspan="6" class="user-add">
					<input type="submit" value="Добавить пользователя" onclick="document.getElementById('modal').style.display='block'"/>
				</td>
			</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="6">

				<ul>
					<c:forEach begin="${startpage}" end="${endpage}" var="p">
						<c:if test="${name != null}">
							<LI><a href="<c:url value="/" ><c:param name="page" value="${p}"/><c:param name="name" value="${name}"/>${p}</c:url>">${p}</a></li>
						</c:if>
						<c:if test="${age != null}">
							<li><a href="<c:url value="/" ><c:param name="page" value="${p}"/><c:param name="age" value="${age}"/>${p}</c:url>">${p}</a></li>
						</c:if>
						<c:if test="${name == null && age == null}">
							<li><a href="<c:url value="/" ><c:param name="page" value="${p}"/>${p}</c:url>">${p}</a></li>
						</c:if>
					</c:forEach>
				</ul>

			</td>
		</tr>
	</tfoot>
	</table>

	
</div>
<div id="modal" class="modal">
	<div id="closeButton" onclick="window.location.href='/'">Х</div>
	<iframe src="new"></iframe>
</div>

</body>
</html>
