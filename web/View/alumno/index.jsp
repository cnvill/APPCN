<%-- 
    Document   : index
    Created on : 30/08/2014, 10:54:55 PM
    Author     : Nuria
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.TAsignatura"%>
<%@page import="BL.BLAsignatura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de asignaturas</title>
        <jsp:include page="../libreria.jsp" ></jsp:include>
    </head>
    <body>
    <jsp:include page="/View/menu.jsp"></jsp:include>
            <div class="row-fluid">
                <a href="registrar">Nuevo one</a>
                <a href="registrar/masivo.jsp">Nuevo All</a>
                <table class="table table-bordered">
                    <thead>
                        <th>Codigo</th>
                        <th> Nombre</th>
                        <th>Creditos</th>
                        <th>Horas Teorica</th>
                        <th>Horas Laboratorio</th>
                        <th>Ciclo</th>
                        <th>Estado</th>
                    </thead>
                    <tbody>
                        <%
                            BLAsignatura oAsignatura=new BLAsignatura();
                            ArrayList<TAsignatura> tAsignatura=oAsignatura.ListaAsignaturas();
                         for(int cont=0;cont<tAsignatura.size();cont++)
                                 {                                
                                 %>
                                 <tr>
                                     <td><%=tAsignatura.get(cont).getIdasignatura() %></td>
                                     <td><%=tAsignatura.get(cont).getNombre() %></td>
                                    <td><%=tAsignatura.get(cont).getCredito() %></td>                                    
                                    <td><%=tAsignatura.get(cont).getHorasteorica() %></td>  
                                    <td><%=tAsignatura.get(cont).getHoraslaboratorio() %></td>  
                                    <td><%=tAsignatura.get(cont).getCiclo() %></td>  
                                    <td><%=tAsignatura.get(cont).getEstado() %></td>  
                                 </tr>
                                <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
    </body>
</html>
