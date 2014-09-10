<%-- 
    Document   : index
    Created on : 30/08/2014, 10:55:05 PM
    Author     : Nuria
--%>

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
         Boolean r=(request.getParameter("txtidasignatura")!=null)?true:false; 
         if(r){
             TAsignatura oAsignatura= new TAsignatura();
             oAsignatura.setIdasignatura(request.getParameter("txtidasignatura"));
             oAsignatura.setNombre(request.getParameter("txtnombre"));
             oAsignatura.setCredito(Integer.parseInt(request.getParameter("txtcredito")));
             oAsignatura.setHorasteorica(Integer.parseInt(request.getParameter("txthp")));
             oAsignatura.setHoraspractica(Integer.parseInt(request.getParameter("txthl")));
             oAsignatura.setCiclo(request.getParameter("cbciclo"));
             oAsignatura.setCiclo(request.getParameter("cbestado"));
            if(BLAsignatura.RegistrarEstudiante(oAsignatura)=="OK")
            {  HttpSession s= request.getSession();
                    s.setAttribute("respuesta_registro", "Registro satisfactorio");
                    response.sendRedirect("lista.jsp");
            }
            
         }
    /*if((request.getParameter("txttitulo")!=null) &&(request.getParameter("txteditorial")!=null) &&(request.getParameter("txtarea")!=null)){
        TLibro oLibro=new TLibro();
        oLibro.setTitulo(request.getParameter("txttitulo"));
        oLibro.setEditorial(request.getParameter("txteditorial"));
        oLibro.setArea(request.getParameter("txtarea"));
        oLibro.setAutor(request.getParameter("txtautor"));
        BL.BLLibro libro= new BLLibro();
        String res=libro.RegistrarLibro(oLibro);
        HttpSession s= request.getSession();
        s.setAttribute("respuesta_registro", res);
        response.sendRedirect("lista.jsp");*/
    %>
%>%>
        <div class="content-fluid">
         <form action="index.jsp" method="post" >
                <fieldset class="row-fluid">
                <div class="span2"></div>
                <div class="span6">
                <h4>Nueva Asignatura </h4>
                <div class="row-fluid">
                    <label for="txtidasignatura">Codigo:</label>
                    <input type="text" name="txtidasignatura" placeholder="Ingrese codigo" style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="txtnombre">Nombre</label>
                    <input type="text" name="txtnombre" placeholder="Ingrese Nombre" style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="txtcredito">Creditos</label>
                    <input type="text" name="txtcredito" placeholder="Ingrese Credito"  style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="txthp">Horas Teorica:  </label>
                    <input type="text" name="txthp" placeholder="Ingrese Hora Practica"  style="height: 30px;" class="input-xlarge" required>
                </div>
                 <div class="row-fluid">
                    <label for="txthl">Horas Laboratorio:  </label>
                    <input type="text" name="txthl" placeholder="Ingrese Hora Laboratorio"  style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="cbciclo">Ciclo  </label>
                    <select name="cbciclo">
                        <option value="1"> Seleccione una opcion</option>
                    </select>
                </div>
                <div class="row-fluid">
                    <label for="cbestado">Estado:</label>
                    <select name="cbestado">
                        <option value="1"> Activo</option>
                        <option value="0"> Inactivo</option>
                    </select>
                </div>
                <div class="row-fluid">        
                    <input type="submit" name="btnregistrar" class="btn btn-primary btn-small" value="Registrar">
                    <a href="../asiganurta/" class="btn btn-success btn-mini"><i class="icon-white icon-arrow-left"></i> Atras</a>
                </div>
                </fieldset>
                </div>
         <div class="span4"></div>
         </form>
      </div>
    </body>
    
</html>
