<%@page import="br.com.fatecpg.jdbc.Order"%>
<%@page import="br.com.fatecpg.jdbc.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras - JavaDB</title>
    </head>
    <body>
        <h1>JavaDB</h1>
        <h2>Compras do cliente</h2>
        <a href="index.jsp">Voltar</a>

        <% try { %>
            <% int id = Integer.parseInt(request.getParameter("id")); %>
            <% Customer c = Customer.getCustomer(id); %>
            
            <% if (c != null) { %>
                <h3>ID: <u><%= id %></u></h3>
                <h3>Nome: <u><%= c.getName() %></u></h3>
                <hr/>
                
                <table border="1">
                    <tr>
                        <th>Numero</th>
                        <th>Data</th>
                        <th>Frete</th>
                    </tr>
                    
                    <% for(Order o: Order.getList(id)) { %>
                        <tr>
                            <td><%= o.getNum()%></td>
                            <td><%= o.getSalesDate()%></td>
                            <td><%= o.getShippingCost()%></td>
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
