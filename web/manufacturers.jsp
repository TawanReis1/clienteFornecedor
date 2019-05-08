<%@page import="br.com.fatecpg.jdbc.Manufacturer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fornecedores - JavaDB</title>
    </head>
    <body>
        <a href="index.jsp">Clientes</a>
        <h1>JavaDB</h1>
        <h2>Fornecedores</h2>
        
        <% try{ %>
            <%ArrayList<Manufacturer> list = Manufacturer.getList();%>
            
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Endereço</th>
                    <th>Cidade</th>
                    <th>Detalhes</th>
                </tr>
                <% for(Manufacturer m: list) { %>
                    <tr>
                        <td><%= m.getId()%></td>
                        <td><%= m.getName()%></td>
                        <td><%= m.getAddress()%></td>
                        <td><%= m.getCity()%></td>
                        <td><a href="details-manufacturer.jsp?id=<%= m.getId()%>">Detalhes</a></td>
                    </tr>
                <% } %>
            </table>
        
        <% } catch(Exception e) { %>
            <h3 style="color:red"><%= e.getMessage()%></h3>
        <% } %>
    </body>
</html>
