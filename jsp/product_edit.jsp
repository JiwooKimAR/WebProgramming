<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>SKKU Flea Market | Product Registration</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/header-style.css">
    <link rel="stylesheet" href="css/product_registration.css">

</head>

<body>
<%@ include file="header-seller.jsp" %>
<%@ page import = "java.sql.*" %>
<%

  int pid = Integer.parseInt(request.getParameter("pid"));
  // System.out.println(pid);
  //int pid=19;

   String title;
   
   String place;
   
   String user_name = session.getAttribute("id").toString();
   
   String phone; 
   int market;

   double price1;
   int price2;
   
   
  	String date;
  
  
   String thumbnail;
   
   String detail[];
  // if(detail[0]=="")
//	   System.out.println("hi");
 //  System.out.println(detail.length);
 
   String content;
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
   // In "user_info" table, users have their unique key
   PreparedStatement pst = conn.prepareStatement("select name from product_info where pid='"+pid+"'");
   ResultSet rs = pst.executeQuery();
   rs.next();
   title = rs.getString(1);
   pst = conn.prepareStatement("select price from product_info where pid='"+pid+"'");
   rs = pst.executeQuery();
   rs.next();
   price1 = rs.getInt(1);
   pst = conn.prepareStatement("select status from product_info where pid='"+pid+"'");
   rs = pst.executeQuery();
   rs.next();
   market = rs.getInt(1);
   pst = conn.prepareStatement("select trading_place from product_info where pid='"+pid+"'");
   rs = pst.executeQuery();
   rs.next();
   place = rs.getString(1);
   pst = conn.prepareStatement("select phone from product_info where pid='"+pid+"'");
   rs = pst.executeQuery();
   rs.next();
   phone = rs.getString(1);
   pst = conn.prepareStatement("select content from product_info where pid='"+pid+"'");
   rs = pst.executeQuery();
   rs.next();
   content = rs.getString(1);
   
   if(market==0) //auction
   {
	   pst = conn.prepareStatement("select unit from product_info where pid='"+pid+"'");
	   rs = pst.executeQuery();
	   rs.next();
	   price2 = rs.getInt(1);	   
	   pst = conn.prepareStatement("select duedate from product_info where pid='"+pid+"'");
	   rs = pst.executeQuery();
	   rs.next();
	   date = rs.getDate(1).toString();
	   rs.close();
	   
   }
   else //flea market
   {
	   pst = conn.prepareStatement("select amount from product_info where pid='"+pid+"'");
	   rs = pst.executeQuery();
	   rs.next();
	   price2 = rs.getInt(1);	
	   rs.close();
	   date="";
	   
   }
 //  System.out.println(title+place+phone+" "+price2);
  

%>
        <div class="area">
            <div class="container-fluid">
                <div class="registration-row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>Product Registration</h2>
                            </div>

                            <form id="form" action="upload_form.jsp" method="post">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <input id="title" type="text" value="<%=title%>" name="title" class="form-control"  placeholder="Product Name" required>
                                    </div>



                                    <div class="col-12 mb-3">
                                        <input id="place" type="text" value="<%=place %>" name="place" class="form-control"  placeholder="Trade Place">
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <input id="user_name" type="text" value="<%=user_name%>" name="user_name" class="form-control" placeholder="User Name"  readonly>
                                    </div>
                                    <div class="col-md-7 mb-3">
                                        <input id="phone" type="number" value="<%=phone%>" name="phone" class="form-control"  min="0" placeholder="Phone No" >
                                    </div>
                                    <div class="col-12 mb-3">
                                        <select  name="market" class="w-100" id="Market">
                                        <option value="0">Flea Market</option>
                                        <option id="auc" selected="" value="1">Auction</option>
                                    </select>
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <input id="price" value="<%=price1%>" name="price1" type="number" class="form-control" placeholder="price($)" >
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <input id="product_number" value="<%=price2%>" name="price2" type="number" class="form-control" placeholder="product number" >
                                    </div>
                                    <div class="col-6 mb-5">
                                      <label>Thumbnail image <div class="fileBox">
                                           <input type="text" class="fileName" readonly="readonly">
                                           <label for="uploadBtn" class="btn_file">find image</label>
                                           <input  name="thumbnail" type="file" id="uploadBtn" class="uploadBtn">
                                        </div></label>
                                    </div>
                                    <div class="col-6 mb-3">
                                      <label> detail images <div class="fileBox">
                                           <input type="text" class="fileNames" readonly="readonly">
                                           <label for="uploadBtns" class="btn_file">find image</label>
                                           <input name="detail" type="file" id="uploadBtns" class="uploadBtns" multiple>
                                        </div> </label>
                                    </div>
                                    <div class="col-6 mb-5">
                                    <img id="th_image" src="" alt="Register your thumbnail image" width="300px" height="300px">
                                    </div>
                                    <div id="date" class="col-6 mb-5">
                                     <label>Auction Due Date : <input type='date'  id='due_date' name='due_date' value=''/></label>	
                                    </div>
                                    <div class="col-12 mb-3">
                                        <textarea id="content" value="<%=content%>" name="content" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="Product Content"></textarea>
                                    </div>

                                    <div class="col-3 mb-3">
                                        <input id="submit_btn" onclick="location.href='product_list_seller.jsp'" type="submit" value="Confirm" class="btn amado-btn w-100">
                                    </div>
                                    <div class="col-3 mb-3">
                                        <a href="product_list_seller.jsp" class="btn amado-btn w-100">Cancel</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->
   	
   	<%@ include file="footer-seller.jsp" %>

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    <script>
	var upload_form = document.getElementById('form');
    var title = document.getElementById('title');
    var place = document.getElementById('place');
   	var submit_btn = document.getElementById('submit_btn');
    var content = document.getElementById('content');
    var market_op = document.getElementById("Market");
    var price = document.getElementById("price");
    var number = document.getElementById("product_number");
    var user_name = document.getElementById("user_name");
  	var phone = document.getElementById("phone");
  	var date_div = document.getElementById("date");
	var date_val = document.getElementById("due_date");
	var auc = document.getElementById("auc");
	var is_th = 0 ;
	 $(function(){
   	 
   	  if(<%=market%>==2)
   	{
   		market_op.value=1;
   	 	date_div.style.display="none";
   	 	
   	}
   	  else{
   		date_val.value="<%=date%>";
   		auc.selected="selected";
   	  }
     });
     
	
    $("#Market").on("change",function(){
   	 
        
        if(market_op.value=="0")
        {
        	 date_div.style.display="none";
          price.placeholder = "price($)";
          number.placeholder = "product number";
        }
        else {
        	 date_div.style.display="block";
          price.placeholder = "min price($)";
          number.placeholder = "bid unit($)"
          
        }
      });
     
    var thumbnail = document.getElementById("uploadBtn");
    var th_image = document.getElementById("th_image");
    thumbnail.addEventListener('change', function (evnt) {
     //   console.log(this.Files[0].name);
     		is_th++;
        th_image.src = "./img/product-img/"+this.files[0].name;
     //      console.log('hi',video.name);
    //  fileList=this.fileList;
  });
    var uploadFile = $('.fileBox .uploadBtn');
    uploadFile.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
             var filename = $(this).val().split('/').pop().split('\\').pop();
        }
         $(this).siblings('.fileName').val(filename);
      });
      var uploadFiles = $('.fileBox .uploadBtns');
      uploadFiles.on('change', function(){
          if(window.FileReader){
              var filenames = $(this)[0].files[0].name;
          } else {
               var filenames = $(this).val().split('/').pop().split('\\').pop();
          }
      //   var num = document.getElementById("fileNames").files.length;
        // var filenames =$(this).val().split('/').pop().split('\\').pop();
           $(this).siblings('.fileNames').val(filenames);
        });
      
      $("#submit_btn").click(function () {
          
     	 if(number.value=="")
              number.value=1;
         if(title.value=="") {
            alert("No Title!");
            return false;
         }
         else if(place.value==""){
            alert("No Trade Place!");
            return false;
         }
         else if(phone.value==""){
            alert("No Phone Number!");
            return false;
         }
         else if(price.value==""){
            alert("No Price!");
            return false;
         }
         else if(is_th==0){
            alert("No Thumbnail Image!");
            return false;
         }
         else if(content.value==""){
            alert("No Content!");
            return false;
         }
         else{
        	 <%pst = conn.prepareStatement("delete from product_info where pid='"+pid+"'");
        	   pst.executeQuery();%>
         }
         
                 
       });
    
    </script>
    </body>
</html>