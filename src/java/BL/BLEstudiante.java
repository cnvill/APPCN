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
 * @author CN
 */
public class BLEstudiante {
    Conexion cn=new Conexion();    

    public BLEstudiante() {
        
    }
     
    public ArrayList<TEstudiante> ListaEstudiantes(){
        ArrayList<TEstudiante> testudiante= new ArrayList<TEstudiante>();
        try {
            cn.AbrirBD();
            ResultSet rs=cn.EjecutarConsulta("select * from testudiante");
            TEstudiante oEstudiante;
            while(rs.next()){
                oEstudiante= new TEstudiante();
                oEstudiante.setIdestudiante(rs.getInt("idestudiante"));
                oEstudiante.setCodigo(rs.getString("codigo"));
                oEstudiante.setNombre(rs.getString("nombre"));
                oEstudiante.setDireccion(rs.getString("direccion"));
                oEstudiante.setEstado(rs.getInt("Estado"));
                testudiante.add(oEstudiante);
            }
            cn.CerradBD();
        } catch (Exception e) {
            testudiante=null;
        }
     return testudiante;
    }
    
    public String RegistrarEstudiante(TEstudiante oEstudiante){
        String Res="No";
        try {
            cn.AbrirBD();
            String consulta="";
            if(cn.Ejecutar(consulta)==1)
                Res="Si";
            cn.CerradBD();
            
        } catch (Exception e) {
            Res="NO"+e.getMessage();
        }
        return Res;
    }
}
