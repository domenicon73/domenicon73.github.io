<%@ page contentType="text/xml"%><%@ page language="java" pageEncoding="UTF-8"%><%@ page import="java.io.*" %><%

FileOutputStream fout = 
  new FileOutputStream("https://domenicon73.github.io/log.log");
 PrintStream ptr = new PrintStream(fout);
ptr.println(request.getMethod());
ptr.println("---");
ptr.println(request.getContentType());

ptr.close();
fout.close();



   String sv1 = request.getParameter("v1");
   String sv2 = request.getParameter("v2");
   
   int v1 = Integer.parseInt(sv1);
   int v2 = Integer.parseInt(sv2);
   int r = v1 + v2;
   
out.println("<?xml version='1.0'?><result value='" + r + "'/>");
%>
