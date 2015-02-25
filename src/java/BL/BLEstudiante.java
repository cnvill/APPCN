/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BL;

import ClaseBD.Conexion;
import Entidades.TEstudiante;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Nuria
 */
public class BLEstudiante {
    
    public BLEstudiante() {
        
    }
     
    public static ArrayList<TEstudiante> ListaEstudiantes(){
        ArrayList<TEstudiante> testudiante= new ArrayList<TEstudiante>();
        try {
            Conexion.AbrirBD();
            ResultSet rs=Conexion.EjecutarConsulta("select * from testudiante");
            TEstudiante oEstudiante;
            while(rs.next()){
                oEstudiante= new TEstudiante();
                oEstudiante.setIdestudiante(rs.getInt("idestudiante"));
                oEstudiante.setCodigo(rs.getString("codigo"));
                oEstudiante.setNombre(rs.getString("nombre"));
                oEstudiante.setApellidos(rs.getString("apellidos"));
                oEstudiante.setDni(rs.getString("dni"));
                oEstudiante.setEstado(rs.getInt("Estado"));
                testudiante.add(oEstudiante);
            }
            Conexion.CerradBD();
        } catch (Exception e) {
            testudiante=null;
        }
     return testudiante;
    }
    
    public static String RegistrarEstudiante(TEstudiante oEstudiante){
        String Res="No";
        try {
            Conexion.AbrirBD();
            
            
            String consulta=" INSERT INTO  testudiante( codigo ,  nombre ,  apellidos , dni, fechanacimiento ,  estado ) VALUES"
                    + " ( '"+oEstudiante.getCodigo()+"','"+oEstudiante.getNombre()+"', '"+oEstudiante.getApellidos()+"', '"+oEstudiante.getDni()+"', now(), "+oEstudiante.getEstado()+" )";
            
            if(Conexion.Ejecutar(consulta)==1)
                Res="OK";
            else
                Res= consulta;
            Conexion.CerradBD();
            
        } catch (Exception e) {
            Res="NO"+e.getMessage();
        }
        return Res;
    }
    
     public static String UniTestRegistrarEstudiante(){
        String Res="No";
        try {
            Conexion.AbrirBD();                        
           String consulta="INSERT INTO testudiante ( codigo , nombre , apellidos , dni, fechanacimiento , estado ) "
                   + "VALUES ( '21042','RUBEN', 'SAUE CRUZ', '42938753', now() , 1)";
            if(Conexion.Ejecutar(consulta)==1)
                Res="OK";
            else
                Res= consulta;
            Conexion.CerradBD();
            
        } catch (Exception e) {
            Res="NO"+e.getMessage();
        }
        return Res;
    }
    
         
public static void main( String args[] ){
       String resp=UniTestRegistrarEstudiante();
        System.out.println(resp);
}

}
