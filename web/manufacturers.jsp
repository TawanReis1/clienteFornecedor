<%@page import="br.com.fatecpg.jdbc.Manufacturer"%>
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
  background-color: #F6EFEE;
}
</style>
<body> 
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">JavaDB - Aula 12</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Início</a></li>
                    <li><a href="#">Fornecedores</a></li>
                    <li><a href="index.jsp">Clientes</a></li>
                </ul>
            </div>
        </div>
    </nav>
<br>
<br>
<br>
<h2>Fornecedores</h2>
<!-- Inicio da Lista -->
<div id="list" class="row">
    <div class="table-responsive col-md-12">
        <% try{ %>
            <%ArrayList<Manufacturer> list = Manufacturer.getList();%>
        <table class="table table-striped" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Endereço</th>
                    <th>Cidade</th>
                    <th>Detalhes</th>
                 </tr>
                 
                 <% for(Manufacturer m: list) { %>
             <tbody>                
                     <tr>
                        <td><%= m.getId()%></td>
                        <td><%= m.getName()%></td>
                        <td><%= m.getAddress()%></td>
                        <td><%= m.getCity()%></td>
                        <td><a class="btn btn-success btn-xs" href="details-manufacturer.jsp?id=<%= m.getId()%>">Detalhes</a></td>
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
