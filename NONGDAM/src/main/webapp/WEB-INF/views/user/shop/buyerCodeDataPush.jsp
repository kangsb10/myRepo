<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    
    String buyer_name = request.getParameter("buyer_name");
    
    Map<String, String> params = new HashMap<String, String>();
    params.put("buyer_name", buyer_name);
    
    IProdService service = IProdServiceImpl.getInstance();
    List<BuyerVO> buyerList = service.buyerList(params);
    
    ObjectMapper mapper = new ObjectMapper();
    String jsonData = mapper.writeValueAsString(buyerList);
    
    out.println(jsonData);
    %>
