<%-- 
    Document   : index
    Created on : May 10, 2019, 10:12:43 PM
    Author     : alexandersantos
--%>
<%@page import="br.com.fatecpg.jdbc.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Clientes - JavaDB</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 <link href="css/style.css" rel="stylesheet">
</head>
<style>
body {
  background-color: #EFEBEC;
}
</style>
<body> 
<%@include file="WEB-INF/jspf/header.jspf" %>
<br>
<br>
<br>
<h2>Clientes</h2>
<!-- Inicio da Lista -->
<div id="list" class="row">
    <div class="table-responsive col-md-12">
        <% try{ %>
            <%ArrayList<Customer> list = Customer.getList();%>
        <table class="table table-striped" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>Detalhes</th>
                 </tr>
                 
                 <% for(Customer c: list) { %>
             <tbody>                
                     <tr>
                        <td><%= c.getId()%></td>
                        <td><%= c.getName()%></td>
                        <td><%= c.getEmail()%></td>
                        <td><a class="btn btn-success btn-xs" href="details-clients.jsp?id=<%= c.getId()%>">Detalhes</a></td>
                    </tr>
            </tbody>
                <% } %>
            </thead>
        </table>
            <% } catch(Exception e) { %>
            <h3 style="color:red"><%= e.getMessage()%></h3>
        <% } %>
 
     </div>
 </div> 
 <!-- Fim da lista -->
        
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
