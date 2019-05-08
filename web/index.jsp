<%@page import="br.com.fatecpg.jdbc.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes - JavaDB</title>
    </head>
    
    <body>
        <h1>JavaDB</h1>
        <h2>Clientes</h2>
        
        <% try{ %>
            <%ArrayList<Customer> list = Customer.getList();%>
            
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>Detalhes</th>
                </tr>
                <% for(Customer c: list) { %>
                    <tr>
                        <td><%= c.getId()%></td>
                        <td><%= c.getName()%></td>
                        <td><%= c.getEmail()%></td>
                        <td><a href="details.jsp?id=<%= c.getId()%>">Detalhes</a></td>
                    </tr>
                <% } %>
            </table>
        
        <% } catch(Exception e) { %>
            <h3 style="color:red"><%= e.getMessage()%></h3>
        <% } %>
    </body>
    
</html>
