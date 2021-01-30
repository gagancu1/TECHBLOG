<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.servlets.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error_page.jsp" %>
<%@ page import ="com.tech.blog.entites.*" %>    

<%  
   user User=(user)session.getAttribute("currentUser");
if(User==null)
{
	response.sendRedirect("loginpage.jsp");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 <link rel="stylesheet" href="css/mystyle.css" type="text/css"/>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>profile </title>
</head>
<body>
<!-- strt of navbar -->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class ="	fa fa-map-pin"> </span> TECHBLOG</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Learn Code With TechBlog <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programing language</a>
          <a class="dropdown-item" href="#">Project Implementaion</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Struturte	</a>
        </div>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="#"><span class=" fa fa-address-book">Contacts</a>
      </li>
      
        <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-dopostModal"><span class=" fa fa-newspaper-o" >  </span> Do Post</a>
      </li>
     
      
          </ul>
      
      <!--  <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>-->
    
    <ul class="navbar-nav mr-right">
    	<li class="nav-item">
    	<a class="nav-link" href="logoutServlet">
    	<span class="fa fa-user-plus ">	</span>Logout</a></li>
    	
    	<li class="nav-item">
    	<a class="nav-link" href="#!" data-toggle="modal" data-target="#profileModal">
    	<span class="fa fa-user-circle">	</span><%=User.getName() %></a></li>
    
    </ul></div>
</nav>	
<!-- end of navbar -->


        <!--main body of the page-->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                           <a href="#"   class=" c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--categories-->

                            <%                                PostDao d = new PostDao(ConnectionProvider.getConnection2())	;
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {
                            %>
                            <a href="#" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>


                            <%                                        }
                            %>
                        </div>

                    </div>

                    <!--second col-->
                    <div class="col-md-8" >
                        <!--posts-->
                         <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>

                </div>

            </div>

        </main>


        <!--end main body of the page-->




<!--  strt of profile modal -->

<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center" >
        <img  src="pics/<%=User.getProfile() %>" class="img-fluid" style="border-radius:50% ;max-width:150px;"> 
        <br>
        <h5 class="modal-title mt-3" id="exampleModalLabel" ><%=User.getName() %></h5>
        </div>
      </div>
     
     
      <!--  details-->      
      <table class="table">
  <thead>  <tbody>
  <tr>
      <th scope="col">ID :</th>
          <td><%=User.getId() %></td>     
    </tr>
    <tr>
      <th scope="col">Email :</th>
          <td><%=User.getEmail() %></td>     
    </tr>


   <tr>
      <th scope="col">Gender :</th>
          <td><%=User.getGender() %></td>     
    </tr>
    <tr>
      <th scope="col">Registerd on :</th>
          <td><%=User.getDateTime() %></td>     
    </tr>
    
    
  </thead>
      </tbody>
    
</table>


      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- end of profile modal -->

      <!-- strt of post modal  -->

<!-- Modal -->
<div class="modal fade" id="add-dopostModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body" >
      
        <form action="AddPostServlet" method="post" id="add-post-form">
        <div>
        <select class="form-control" name="cid">
        
        <option selected disabled>---Select Category---</option>        
        <%
        PostDao pst=new PostDao(ConnectionProvider.getConnection2());
        ArrayList<Category> list=pst.getAllCategories();
        for(Category c:list)
        {
        	%>
        	
        	<option value="<%=c.getCid() %>"><%=c.getName() %></option>
        	}
        	<% 
        }
        %>
      
        </select>
        
        
        </div>
        <br>
        <div class="form-group" >
        <input  name="pTitle" type="text" placeholder="Enter post Title" class="form-control" />
        </div>
       
       <div class="form-group">
       <textarea name="pContent" class="form-control" placeholder="Enter your content" style="height:200px"></textarea>
       </div>
       
       
       <div class="form-group">
       <textarea class="form-control"  name="pCode" placeholder="Enter your program (if any)" style="height:200px"></textarea>
       </div>
       <div class="form-group">
       <label>Select Image</label><br>
       <input type="file" name="pic" >
       </div>
         <div class="container text-center" >
         <button type="submit" class="btn btn-outline-primary">Post</button>
      </div>
        </form>   
      </div>
     
    </div>
  </div>
</div>  


    
      <!-- end of post modal -->


<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js" type="text/javascript"> </script>



 <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                        	swal("Good Job!", "saved successfully", "success");
                            
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                           swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
        
        
        <script>
        $(document).ready(function (e)
        		{
        	
        	
        	$.ajax({
        		url:"load_post.jsp",
        		success:function(data,textStatus,jqXHR)
        		{
        			console.log(data); 
        	  $("#loader").hide();
        	  $('#post-container').html(data);
        		}
        	
        	})
        	
        	
        		})
        </script>
        
        
        
</body>
</html>

