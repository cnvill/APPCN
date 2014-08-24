/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ClaseBD;

import java.sql.*;

public class Conexion {
 protected Connection conexionBD;
 protected Statement st;
 
 public Conexion(){
     this.conexionBD=null;
     this.st=null;
 }
 
 public void AbrirBD(){
     try {
         
         Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexionBD=DriverManager.getConnection("jdbc:mysql://localhost/bdmatricula","root","");
        st=conexionBD.createStatement();
     } catch (ClassNotFoundException e) {
         System.out.println("Class "+e.getMessage());
     }catch(SQLException e){
        System.out.println("SQL "+e.getMessage());
     }catch(Exception e){
         System.out.println("Exception "+e.getMessage());
     }
 }
 
 public ResultSet EjecutarConsulta(String Sql){
     ResultSet rs=null;
     try {
         rs=st.executeQuery(Sql);         
     } catch (SQLException e) {
         System.out.print(e.getMessage());
     }
     return rs;
 }
 
  public int Ejecutar(String Sql){
      int i=0;
      try {
          i=st.executeUpdate(Sql);
      } catch (Exception e) {
          System.err.println("Error en Ejecutar"+e.getMessage());
      }
    return i;
  }       
    
  
 public void CerradBD(){
    if(conexionBD!=null){
        try {
            conexionBD.close();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    } 
 }
 
}
