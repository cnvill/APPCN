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
     
    public ArrayList<TEstudiante> ListaEstudiantes(){
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
                oEstudiante.setDireccion(rs.getString("direccion"));
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
            String consulta="INSERT INTO  testudiante ( codigo ,  nombre ,  apellidos ,  direccion ,  fechanacimiento ,  estado ) VALUES"
                    + " ( '"+oEstudiante.getCodigo()+"','"+oEstudiante.getNombre()+"', '"+oEstudiante.getApellidos()+"', '"+oEstudiante.getDireccion()+"', now(), "+oEstudiante.getEstado()+")";
            if(Conexion.Ejecutar(consulta)==1)
                Res="OK";
            Conexion.CerradBD();
            
        } catch (Exception e) {
            Res="NO"+e.getMessage();
        }
        return Res;
    }
}
