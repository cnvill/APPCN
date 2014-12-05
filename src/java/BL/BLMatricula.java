/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BL;

import ClaseBD.Conexion;
import Entidades.TAsignatura;
import Entidades.TDetMatricula;
import Entidades.TEstudiante;
import Entidades.TMatricula;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author Nuria
 */
public class BLMatricula {
    
    public BLMatricula(){
        
    }
    
    public static String GenerarRegistroMatricula(){
        String respuesta="";
        try {
        ArrayList<TEstudiante> listaEstudiantes= BLEstudiante.ListaEstudiantes(); 
        ArrayList<TAsignatura> listaAsignaturas= BLAsignatura.ListaAsignaturas();
        TMatricula oMatricula;
        TDetMatricula oDetMatricula;
        int nE=listaEstudiantes.size();
        int nA=listaAsignaturas.size();
        respuesta =""+nE*nA;
            for (int i = 0; i < nE; i++) {
                oMatricula= new TMatricula();
                oMatricula.setEstado(1);
                oMatricula.setIdestudiante(listaEstudiantes.get(i).getIdestudiante());
                oMatricula.setSemestre("III");
                oMatricula.setTotalcreditos(i);
                InsertMatricula(oMatricula);
                for (int j = 0; j < nA; j++) {
                    oDetMatricula= new TDetMatricula();
                    oDetMatricula.setIdasignatura(listaAsignaturas.get(j).getIdasignatura());
                    oDetMatricula.setEstado(1);
                    String idasignatura=getMaxIdMatricula();
                    oDetMatricula.setIdmatricula(Integer.parseInt(idasignatura));
                    oDetMatricula.setCredito(listaAsignaturas.get(j).getCredito());
                    BLDetMatricula.RegistrarDetMatricula(oDetMatricula);
                }
            }
            
        
        } catch (Exception e) {
            respuesta=respuesta+e.getMessage();
        }
        return respuesta;
    }
    
    public static String InsertMatricula(TMatricula oMatricula){
        String resp="";
        try {
            Conexion.AbrirBD();
            String consulta="INSERT INTO  tmatricula ( semestre ,  idestudiante ,  totalcredito ,  fechamtricula ,  estado )"
                    + "VALUES ('"+ oMatricula.getSemestre()+"' ,"+ oMatricula.getIdestudiante()+" ,"+oMatricula.getTotalcreditos()+ ", now(), 1)";
            if(Conexion.Ejecutar(consulta)==1)
                resp="OK";
            Conexion.CerradBD();
            resp="OK";
        } catch (Exception e) {
            resp=e.getMessage();
        }
        return resp;
    }
    
    public static String  getMaxIdMatricula(){
      String resp="";
        try {
           Conexion.AbrirBD();
           ResultSet rs =Conexion.EjecutarConsulta("select max(idmatricula) as idmatricula from tmatricula");
           rs.next();
           resp= ""+rs.getInt(1);
           rs.close();
           Conexion.CerradBD();
        } catch (Exception e) {
            resp=e.getMessage();
        }
        return resp;
    }
}
