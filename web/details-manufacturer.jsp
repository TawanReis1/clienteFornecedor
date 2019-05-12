<%-- 
    Document   : details-manufacturer
    Created on : 08/05/2019, 19:54:26
    Author     : tawan.reis
--%>

<%@page import="br.com.fatecpg.jdbc.Product"%>
<%@page import="br.com.fatecpg.jdbc.Manufacturer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Details-manufacture</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 <link href="css/style.css" rel="stylesheet">
</head>
<style>
body {
  background-color: #F6EFEE;
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
        <% Manufacturer m = Manufacturer.getManufacturer(id); %>
            
    <% if (m != null) { %>
    <h3 class="page-header"><b>Produtos do fornecedor</b> - Item #<i><%= id %></i></h3>
    <h3><b>Nome:</b> <i><u><%= m.getName() %></u></i></h3>
  
        <div class="row">
        <% for(Product p: Product.getList(id)) { %>
          <div class="col-md-4">
            <p><strong>ID</strong></p>
            <i><p><%= p.getId()%></p></i>
          </div>
          <div class="col-md-4">
            <p><strong>Descricao</strong></p>
            <i><p><%= p.getDescription()%></p></i>
          </div>
          <div class="col-md-4">
            <p><strong>Preco de Custo</strong></p>
            <i><p><%= p.getPurcasheCost()%></p></i>
          </div>
          <div class="col-md-4">
            <p><strong>Quantidade disponivel</strong></p>
            <i><p><%= p.getQuantityOnHand()%></p></i>
          </div>
          <div class="col-md-4">
            <p><strong>Disponivel?</strong></p>
            <i><p><%= p.isAvailable()%></p></i>
          </div>
          <% } %>
       </div>
    <% } else { %>
        <h3>Produto não encontrado!</h3>
    <% } %>

        <% } catch (Exception e) { %>
            <h3 style="color:red"><%= e.getMessage()%></h3>
        <% }%>
 
 <hr />
 <div id="actions" class="row">
   <div class="col-md-12">
     <a href="index.jsp" class="btn btn-primary">Fechar</a>
   </div>
 </div>
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>