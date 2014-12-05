/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BL;

import ClaseBD.Conexion;
import Entidades.TAsignatura;
import Entidades.TDetMatricula;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Nuria
 */
public class BLDetMatricula {
    
     public static String RegistrarDetMatricula(TDetMatricula oDetMatricula){
        String Res="No";
        try {
            Conexion.AbrirBD();
            String consulta="INSERT INTO tdetmatricula(idmatricula, idasignatura, credito, estado) \n" +
                            "VALUES ( "+oDetMatricula.getIdmatricula()+", "+oDetMatricula.getIdasignatura()+", "+oDetMatricula.getCredito()+" ,1)";
            if(Conexion.Ejecutar(consulta)==1)
                Res="OK";
            Conexion.CerradBD();
            
        } catch (Exception e) {
            Res="NO"+e.getMessage();
        }
        return Res;
    }
    
    public ArrayList<TDetMatricula> ListaDetMatriculas(){
        ArrayList<TDetMatricula> detMatricula= new ArrayList<TDetMatricula>();
        try {
            Conexion.AbrirBD();
            ResultSet rs=Conexion.EjecutarConsulta("SELECT iddetmatricula, idmatricula, idasignatura, estado FROM tdetmatricula");
            TDetMatricula oDetMatricula;
            while(rs.next()){
                oDetMatricula= new TDetMatricula();                
                oDetMatricula.setIddetmatricula(rs.getInt("iddetmatricula"));
                oDetMatricula.setIdmatricula(rs.getInt("idmatricula"));
                oDetMatricula.setIdasignatura(rs.getString("idasignatura"));
                oDetMatricula.setEstado(rs.getInt("estado"));
                detMatricula.add(oDetMatricula);
            }
            Conexion.CerradBD();
        } catch (Exception e) {
            detMatricula=null;
            System.out.print(""+e.getMessage());
        }
     return detMatricula;
    }
}
