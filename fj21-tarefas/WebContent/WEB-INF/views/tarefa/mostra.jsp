<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<link type="text/css"href="css/jquery.css" rel="stylesheet"/>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@taglib tagdir="/WEB-INF/tags" prefix="caelum"%>
	<h3>Alterar tarefa - ${tarefa.id}</h3>
	<form action="alteraTarefa" method="post">
		<input type="hidden" name="id" value="${tarefa.id}">
		Descrição: <br/>
		<textarea name="descricao" rows="5" cols="100">${tarefa.descricao}</textarea>
		<br/>
		Finalizado? <input type="checkbox" name="finalizado" value="true" ${tarefa.finalizado? 'checked' : ''}/><br/>
		
		Data de finalização: <br/>
		<caelum:campoData id="dataFinalizacao" value="${tarefa.dataFinalizacao}"/>		
		<br/>
		
		<input type="submit" value="Alterar">	
	</form>

</body>
</html>