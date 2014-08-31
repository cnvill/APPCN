
<%@page import="java.util.ArrayList"%>


<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap-responsive.css" rel="stylesheet">
        <script src="js/jquery.js"></script>    
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
<jsp:include page="menu.jsp" />
<%
  /*  if((request.getParameter("txttitulo")!=null) &&(request.getParameter("txteditorial")!=null) &&(request.getParameter("txtarea")!=null)){
        TLibro oLibro=new TLibro();
        oLibro.setTitulo(request.getParameter("txttitulo"));
        oLibro.setEditorial(request.getParameter("txteditorial"));
        oLibro.setArea(request.getParameter("txtarea"));
        oLibro.setAutor(request.getParameter("txtautor"));
        BL.BLLibro libro= new BLLibro();
        String res=libro.RegistrarLibro(oLibro);
        HttpSession s= request.getSession();
        s.setAttribute("respuesta_registro", res);
        response.sendRedirect("lista.jsp");
    }*/
%>
<div class="content-fluid">
        
    <form action="registro.jsp" method="get">
        <fieldset class="row-fluid">
        <div class="span2"></div>
        <div class="span6">
        <h4>Nuevo libro </h4>
        <div class="row-fluid">

            <label for="txttitulo">Titulo:</label>
            <input type="text" name="txttitulo" placeholder="Ingrese titulo" style="height: 30px;" class="input-xlarge" required>
        </div>
        <div class="row-fluid">
            <label for="txteditorial">Editorial:</label>
            <input type="text" name="txteditorial" placeholder="Ingrese Editorial" style="height: 30px;" class="input-xlarge" required>
        </div>
        <div class="row-fluid">
            <label for="txtarea">Area:</label>
            <input type="text" name="txtarea" placeholder="Ingrese Area"  style="height: 30px;" class="input-xlarge" required>
        </div>
        <div class="row-fluid">
            <label for="txtarea">Autor:  </label>
            <input type="text" name="txtautor" placeholder="Ingrese Autor"  style="height: 30px;" class="input-xlarge" required>
        </div>
        <div class="row-fluid">        
            <input type="submit" name="btnregistrar" class="btn btn-primary btn-small" value="Registrar">
            <a href="lista.jsp" class="btn btn-success btn-mini"><i class="icon-white icon-arrow-left"></i> Atras</a>
        </div>
        </fieldset>
        </div>
        <div class="span4"></div>
    </form>
</div>