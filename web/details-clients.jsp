<%-- 
    Document   : details
    Created on : May 10, 2019, 11:41:51 PM
    Author     : alexandersantos
--%>
<%@page import="br.com.fatecpg.jdbc.Order"%>
<%@page import="br.com.fatecpg.jdbc.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Details</title>

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
 <div id="main" class="container-fluid">
    <% try { %>
        <% int id = Integer.parseInt(request.getParameter("id")); %>
        <% Customer c = Customer.getCustomer(id); %>
            
    <% if (c != null) { %>
        <h3 class="page-header">Compras do cliente - Item #<%= id %></h3>
  
        <div class="row">
        <% for(Order o: Order.getList(id)) { %>
          <div class="col-md-4">
            <p><strong>Numero</strong></p>
                <p><%= o.getNum()%></p>
          </div>
          <div class="col-md-4">
            <p><strong>Data</strong></p>
                <p><%= o.getSalesDate()%></p>
          </div>
          <div class="col-md-4">
            <p><strong>Frete</strong></p>
                <p><%= o.getShippingCost()%></p>
          </div>
          <% } %>
       </div>
    <% } else { %>
        <h3>Cliente não encontrado!</h3>
    <% } %>

        <% } catch (Exception e) { %>
            <h3 style="color:red"><%= e.getMessage()%></h3>
        <% }%>
 
 <hr />
 <div id="actions" class="row">
   <div class="col-md-12">
     <a href="clients.jsp" class="btn btn-primary">Voltar</a>
     <a href="index.jsp" class="btn btn-primary">Fechar</a>
   </div>
 </div>
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
