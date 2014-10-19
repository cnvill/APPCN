<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%! 
    Connection conn = null;
    String url = "jdbc:mysql://localhost/";
    String dbName = "bdmatricula";
    String driver = "com.mysql.jdbc.Driver";
    String username = "root"; 
    String userPassword = "";

%>
<br><br>
<%

    java.util.Date date = new java.util.Date();

    //String filename = "c:\\excel\\f"+date.getTime() +".xls" ;
    String filename="d:\\excel\\f1413735213119.xls";
    
     /*       
    String searchText="";
    if(request.getParameter("searchtxt")!=null)
    {
    searchText= request.getParameter("searchtxt").toString();
    }
*/
try{
/*
Class.forName(driver).newInstance();
conn = DriverManager.getConnection(url+dbName,username,userPassword);

Statement stmt = conn.createStatement();
String strQuery = "select * from tasignatura where nombre like '%"+searchText+"%' or nombre like '%"+searchText+"%'";

ResultSet rs = stmt.executeQuery(strQuery);

HSSFWorkbook hwb = new HSSFWorkbook();
HSSFSheet sheet = hwb.createSheet("new sheet"); 

HSSFRow rowhead = sheet.createRow((short)2);
rowhead.createCell((short) 0).setCellValue("SNo");
rowhead.createCell((short) 1).setCellValue("First Name");
rowhead.createCell((short) 2).setCellValue("Last Name");
rowhead.createCell((short) 3).setCellValue("Username");
rowhead.createCell((short) 4).setCellValue("E-mail");
rowhead.createCell((short) 5).setCellValue("Country");

int index=3;
int sno=0;
String name="";
while(rs.next()) 
{
sno++;

HSSFRow row = sheet.createRow((short)index);
row.createCell((short) 0).setCellValue(sno);
row.createCell((short) 1).setCellValue(rs.getString(4));
row.createCell((short) 2).setCellValue(rs.getString(5));
row.createCell((short) 3).setCellValue(rs.getString(2));
row.createCell((short) 4).setCellValue(rs.getString(6));
row.createCell((short) 5).setCellValue(rs.getString(9));
index++;
}
FileOutputStream fileOut = new FileOutputStream(filename);

hwb.write(fileOut);
fileOut.close();*/


                   /* FileInputStream fileInputStream = new FileInputStream(filename);
			HSSFWorkbook workbook = new HSSFWorkbook(fileInputStream);
			HSSFSheet worksheet = workbook.getSheet("POI Worksheet");
			HSSFRow row1 = worksheet.getRow(0);
			HSSFCell cellA1 = row1.getCell((short) 0);
			String a1Val = cellA1.getStringCellValue();
			HSSFCell cellB1 = row1.getCell((short) 1);
			String b1Val = cellB1.getStringCellValue();
			//HSSFCell cellC1 = row1.getCell((short) 2);
			
			
			
                         out.println("<h3> "+a1Val+" </h3>");
                         out.println("<h3> "+b1Val+" </h3>");
                         //out.println("<h3> "+c1Val+" </h3>");*/
			
                        
POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(filename));
    HSSFWorkbook wb = new HSSFWorkbook(fs);
    HSSFSheet sheet = wb.getSheetAt(0);
    HSSFRow row;
    HSSFCell cell;

    int rows; // No of rows
    rows = sheet.getPhysicalNumberOfRows();

    int cols = 0; // No of columns
    int tmp = 0;

    // This trick ensures that we get the data properly even if it doesn't start from first few rows
    for(int i = 0; i < 10 || i < rows; i++) {
        row = sheet.getRow(i);
        if(row != null) {
            tmp = sheet.getRow(i).getPhysicalNumberOfCells();
            if(tmp > cols) cols = tmp;
        }
    }

    for(int r = 0; r < rows; r++) {
        row = sheet.getRow(r);
        if(row != null) {
            for(int c = 0; c < cols; c++) {
                cell = row.getCell((short)c);
                if(cell != null) {
                    out.println("<h3> "+cell+" </h3>");
                }
            }
        }
    }
    

out.println("<b>Your excel file has been generated</b>");

} catch ( FileNotFoundException ex ) {
    out.println("<b>No se leo el archivo</b>"+ex.getMessage());
} 
%>