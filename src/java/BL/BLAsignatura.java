/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BL;

import ClaseBD.Conexion;
import Entidades.TAsignatura;

/**
 *
 * @author CN
 */
public class BLAsignatura {
    
    public static String RegistrarEstudiante(TAsignatura oAsignatura){
        String Res="No";
        try {
            Conexion.AbrirBD();
            String consulta="";
            if(Conexion.Ejecutar(consulta)==1)
                Res="Si";
            Conexion.CerradBD();
            
        } catch (Exception e) {
            Res="NO"+e.getMessage();
        }
        return Res;
    }
}
