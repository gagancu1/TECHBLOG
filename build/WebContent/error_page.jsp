<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@page isErrorPage="true" %>
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 <link rel="stylesheet" href="css/mystyle.css" type="text/css"/>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner_background{clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 91%, 68% 86%, 33% 95%, 0 85%, 0% 43%, 0 0);}</style>


<title>Sorry! Something Went Wrong....</title>
</head>
<body>
<div class="container text-center img-small" >
<img src="img/500_F_243915580_wl4tqbR1xh3NLGNtnWEp7DanxMpYVAWI.jpg"  class="img-fluid">
<h3 class="display-3">Sorry! Something Went Wrong....</h3>

<%=exception %>
<a class="btn primary-background btn-lg text-white mt-3" href="index.jsp">HOME</a>

</div>



</body>
</html>