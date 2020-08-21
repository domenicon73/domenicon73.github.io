<%@ page contentType="text/xml"%><%@ page language="java" pageEncoding="UTF-8"%><%@ page import="java.io.*" %><%
   String cognome = request.getParameter("cognome");
   String nome = request.getParameter("nome");

   if(cognome!=null && cognome.length()==0)
      cognome = null;
   if(nome!=null && nome.length()==0)
      nome = null;

   boolean errore=false;
   String righe_xml="";
      
   try
   {
      FileReader fr = new FileReader("webapps/ROOT/apps/app_00/righe.dat");
      BufferedReader fin = new BufferedReader(fr);
      
      String riga;
      riga = fin.readLine();
      while(riga != null)
      {
          int pos1;
          int pos2;
          boolean OK;
          
          pos1 = riga.indexOf(",");
          pos2 = riga.indexOf(",", pos1+1);
          String cg = riga.substring(pos1+1, pos2);
          String no = riga.substring(pos2+1);
          
          OK = true;
          if(cognome!=null && !cg.equals(cognome))
             OK = false;
          if(nome!=null && !no.equals(nome))
             OK = false;
          if(OK)
             righe_xml = righe_xml + 
                "<riga cognome='" + cg + 
                "' nome='" + no + "'/>";
             
         riga = fin.readLine();
      }
      fin.close();
   }
   catch(Exception e)
   {
      errore=true;
   }
   if(!errore)
   {
      out.println("<?xml version='1.0' encoding='iso-8859-1'?>" +
        "<elenco stato='OK'>" +
         righe_xml +
         "</elenco>");
    }
    else
   {
      out.println("<?xml version='1.0' encoding='iso-8859-1'?>" +
        "<elenco stato='ERR'>" +
         "<messaggio>Si e' verificato un errore" +
         "</messaggio>" +
         "</elenco>");
    }
    
%>
