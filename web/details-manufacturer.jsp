<%-- 
    Document   : details-manufacturer
    Created on : 08/05/2019, 19:54:26
    Author     : tawan.reis
--%>

<%@page import="br.com.fatecpg.jdbc.Product"%>
<%@page import="br.com.fatecpg.jdbc.Manufacturer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JavaDB</h1>
        <h2>Produtos do fornecedor</h2>
        <a href="manufacturers.jsp">Voltar</a>

        <% try { %>
            <% int id = Integer.parseInt(request.getParameter("id")); %>
            <% Manufacturer m = Manufacturer.getManufacturer(id); %>
            
            <% if (m != null) { %>
                <h3>ID: <u><%= id %></u></h3>
                <h3>Nome: <u><%= m.getName() %></u></h3>
                <hr/>
                
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Descricao</th>
                        <th>Preco de Custo</th>
                        <th>Quantidade disponivel</th>
                        <th>Disponivel?</th>
                    </tr>
                    
                    <% for(Product p: Product.getList(id)) { %>
                        <tr>
                            <td><%= p.getId()%></td>
                            <td><%= p.getDescription()%></td>
                            <td><%= p.getPurcasheCost()%></td>
                            <td><%= p.getQuantityOnHand()%></td>
                            <td><%= p.isAvailable()%></td>
                        </tr>
                    <% } %>
                    
                </table>
                
            <% } else { %>
                <h3>Cliente não encontrado!</h3>
            <% } %>
        

        <% } catch (Exception e) { %>
            <h3 style="color:red"><%= e.getMessage()%></h3>
        <% }%>
    </body>
</html>
