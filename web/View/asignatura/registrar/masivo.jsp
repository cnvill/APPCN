<%-- 
    Document   : index
    Created on : 30/08/2014, 10:55:05 PM
    Author     : Nuria
--%>

<%@page import="java.io.File"%>
<%@page import="com.sun.javafx.print.PrintHelper.PrintAccessor"%>
<%@page import="org.apache.catalina.Server"%>
<%@page import="Entidades.TAsignatura"%>
<%@page import="BL.BLAsignatura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Asignatura</title>
        <link href="../../../css/bootstrap.min.css" rel="stylesheet" media="screen"> 
        <link href="../../../css/bootstrap-responsive.css" rel="stylesheet">
        <link href="../../../css/estilo.css" rel="stylesheet">
        <script src="../../../js/jquery.js"></script>    
        <script src="../../../js/bootstrap.min.js"></script>
    </head>
    <body>
       <jsp:include page="/View/menu.jsp"></jsp:include>
       <%
         Boolean r=(request.getParameter("txtarchivo")!="" && request.getParameter("txtarchivo")!=null); 
         if(r){
            
             String nombreArchivo=request.getParameter("txtarchivo");
             File file =new  File(nombreArchivo);
             String resp=BLAsignatura.RegistrarMasivo(nombreArchivo);
            if(resp=="OK")
            {  HttpSession s= request.getSession();
                    s.setAttribute("respuesta_registro", "Registro satisfactorio");
                    response.sendRedirect("../index.jsp");
            }else
            {
                out.println("<h3> Los datos son incorrectos </h3>");
            }
         }
        
   
    %>
        <div class="content-fluid">
         <form action="masivo.jsp" method="post" >
                <fieldset class="row-fluid">
                    <input name="txtarchivo" type="file"/>
                <div class="row-fluid">        
                    <input type="submit" name="btnregistrar" class="btn btn-primary btn-small" value="Registrar">
                    <a href="../" class="btn btn-success btn-mini"><i class="icon-white icon-arrow-left"></i> Atras</a>
                </div>
                </fieldset>
                </div>
         <div class="span4"></div>
         </form>
      </div>
    </body>
    
</html>
