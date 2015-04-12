<%-- 
    Document   : index
    Created on : 30/08/2014, 10:55:05 PM
    Author     : Nuria
--%>

<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="BL.BLEstudiante"%>
<%@page import="Entidades.TEstudiante"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.catalina.Server"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
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
    if (request.getParameter("form") != null){
         /*FileItemFactory es una interfaz para crear FileItem*/
    FileItemFactory file_factory = new DiskFileItemFactory();
    /*ServletFileUpload esta clase convierte los input file a FileItem*/
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
    /*sacando los FileItem del ServletFileUpload en una lista */
    List items = servlet_up.parseRequest(request);
    for(int i=0;i<items.size();i++){
    /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
    FileItem item = (FileItem) items.get(i);
    /*item.isFormField() false=input file; true=text field*/
    if (! item.isFormField()){
    //checking content type of file. 
        if(  item.getContentType().equalsIgnoreCase("text/xml") )
        {
            /*cual sera la ruta al archivo en el servidor*/
            File archivo_server = new File( getServletContext().getRealPath("/Archivos")+File.separator+item.getName());
            item.write(archivo_server);
            
            String fXmlFile=archivo_server.toPath().toString();
            
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(fXmlFile);
            
            doc.getDocumentElement().normalize();

            
            java.util.Date dateInicio = new java.util.Date();
            NodeList nList = doc.getElementsByTagName("table");
            int totalRegistros=0;
            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);                    
                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) nNode;
                    
                      TEstudiante oEstudiante= new TEstudiante();
                        oEstudiante.setCodigo(eElement.getElementsByTagName("column").item(0).getTextContent().toString());
                        oEstudiante.setNombre(eElement.getElementsByTagName("column").item(1).getTextContent().toString());
                        oEstudiante.setApellidos(eElement.getElementsByTagName("column").item(2).getTextContent());
                        oEstudiante.setDni(eElement.getElementsByTagName("column").item(3).getTextContent());
                        oEstudiante.setFechanacimiento(eElement.getElementsByTagName("column").item(4).getTextContent());
                        oEstudiante.setEstado(1);
                        totalRegistros++;
                        String Resp=BLEstudiante.RegistrarEstudiante(oEstudiante);
             }
           }
            
            java.util.Date dateFin = new java.util.Date();
            String tiempo=String.valueOf((dateFin.getTime()-dateInicio.getTime())/1000);
            out.println("<label class='alert alert-success'>Se registro satisfactoriamente los registros <br/> Tiempo transcurrido: "+tiempo+" segundos </br> Total registros: "+totalRegistros+" </label>");
            
        }
      }
     }
    }
    else
    {
    %>
    <form action="masivo.jsp?form=ok" enctype="multipart/form-data" name="form1" method="post">
    <input type="file" name="file" /><br/>
    <input type="submit" name="Registrar" value="Registrar" class="btn btn-primary btn-small" />
    <a href="estudiante" class="btn btn-success btn-mini"><i class="icon-white icon-arrow-left"></i> Atras</a>
    </form>
    <% 
    } %> 
    </body>
    
</html>
