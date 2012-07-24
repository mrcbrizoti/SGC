<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
	
	<script type="text/javascript">
		function finalizaAgora(id){
			$.post("finalizaTarefa",{'id':id},function(resposta){
				$("#tarefa_"+id).html(resposta);
			});			
		}	
	</script>
	
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
	<a href="novaTarefa">Criar nova tarefa</a>
	
	<br/><br/>
	<table border="1">
		<tr>
			<th>Id</th>
			<th>Descrição</th>
			<th>Finalização</th>
			<th>Data de Finalização</th>
			<th>Alterar</th>
			<th>Excluir</th>
			<th>Finaliza</th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr id="tarefa_${tarefa.id}">
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				<c:if test="${tarefa.finalizado eq false}">
					<td>Não finalizado</td>
				</c:if>
				<c:if test="${tarefa.finalizado eq true}">
					<td>Finalizado</td>
				</c:if>
				<td> 
					<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy"/>
				</td>
				<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
				<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
				<c:if test="${tarefa.finalizado eq false}">
					<td><a href="#" onClick="finalizaAgora(${tarefa.id})">Finaliza Agora</a></td>
				</c:if>
			</tr>
	
		</c:forEach>
	
	</table>

</body>
</html>