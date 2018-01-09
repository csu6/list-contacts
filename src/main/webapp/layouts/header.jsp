<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contacts</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/style.css">
<!-- jQuery library -->
<%-- 	<script src="${pageContext.servletContext.contextPath}/jquery/jquery.min.js"></script> --%>

<!-- Latest compiled JavaScript -->
<%-- 	<script src="${pageContext.servletContext.contextPath}/bootstrap/js/bootstrap.min.js"></script> --%>

<c:url value="/vendor/bootstrap/css/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />

<c:url value="/vendor/fontawesome/css/font-awesome.min.css"
	var="fontawesomeCss" />
<link href="${fontawesomeCss}" rel="stylesheet" />


<c:url value="/css/simple-sidebar.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />

</head>
<body>
	<div id="wrapper">
		
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <nav id="spy">
                <ul class="sidebar-nav nav">
                    <li class="sidebar-brand">
                        <a href="#home"><img style="width:80px;" src="images/logom2i.png" /></a>
                    </li>
                    <li>
                        <a href="/home" data-scroll>
                            <span class="fa fa-anchor solo">Accueil</span>
                        </a>
                    </li>
                    <li>
               <%-- <c:url var="listPersonnes" value="list_personnes"> --%>
				<%--   <c:param name="iq" value="${homer.iq}"/> --%>
				<%--   <c:param name="checkAgainst" value="marge simpson"/> --%>
				<%-- </c:url> --%>
				
				<c:url var="listPersonnes" value="list_personnes">
				</c:url>
                        <a href="<c:out value="${listPersonnes}"/>" data-scroll>
                            <span class="fa fa-anchor solo">Afficher personnes</span>
                        </a>
                    </li>
                    <li>
                        <a href="#anch3" data-scroll>
                            <span class="fa fa-anchor solo">Insérer personnnes</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <!-- Page content -->
        <div id="page-content-wrapper">
            <div class="content-header">
                <h1 id="home">
                    <a id="menu-toggle" href="#" class="glyphicon glyphicon-align-justify btn-menu toggle">
                        <i class="fa fa-bars"></i>
                    </a>
                    Mes contacts
                </h1>
            </div>
            
          <div class="page-content inset" data-spy="scroll" data-target="#spy">
                