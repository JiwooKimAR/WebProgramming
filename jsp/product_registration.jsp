<!DOCTYPE html>
<html lang="en">

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
<%@ include file="header.jsp" %>
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
                                        <input id="title" type="text" name="title" class="form-control"  placeholder="Product Name" required>
                                    </div>



                                    <div class="col-12 mb-3">
                                        <input id="place" type="text" name="place" class="form-control"  placeholder="Trade Place">
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <input id="user_name" type="text" name="user_name" class="form-control" placeholder="User Name"  readonly>
                                    </div>
                                    <div class="col-md-7 mb-3">
                                        <input id="phone" type="number" name="phone" class="form-control"  min="0" placeholder="Phone No" >
                                    </div>
                                    <div class="col-12 mb-3">
                                        <select name="market" class="w-100" id="Market">
                                        <option value="0">Flea Market</option>
                                        <option value="1">Auction</option>
                                    </select>
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <input id="price" name="price1" type="number" class="form-control" placeholder="price($)" >
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <input id="product_number" name="price2" type="number" class="form-control" placeholder="product number" >
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
                                     <label>Auction Due Date : <input type='date' id='due_date' name='due_date' value=''/></label>   
                                    </div>
                                    <div class="col-12 mb-3">
                                        <textarea id="content" name="content" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="Product Content"></textarea>
                                    </div>

                                    <div class="col-3 mb-3">
                                        <input id="submit_btn" type="submit" value="Confirm" class="btn amado-btn w-100">
                                    </div>
                                    <div class="col-3 mb-3">
                                        <a href="#" class="btn amado-btn w-100">Cancel</a>
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
    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row align-items-center">
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-4">
                    <div class="single_widget_area">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="index.html"><img src="img/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Copywrite Text -->
                        <p class="copywrite"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-8">
                    <div class="single_widget_area">
                        <!-- Footer Menu -->
                        <div class="footer_menu">
                            <nav class="navbar navbar-expand-lg justify-content-end">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#footerNavContent" aria-controls="footerNavContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                                <div class="collapse navbar-collapse" id="footerNavContent">
                                    <ul class="navbar-nav ml-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="index.html">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="shop.html">Shop</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="product-details.html">Product</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="cart.html">Cart</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="checkout.html">Checkout</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

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
      var market_op = document.getElementById("Market");
      var price = document.getElementById("price");
      var number = document.getElementById("product_number");
      var user_name = document.getElementById("user_name");
     var date_div = document.getElementById("date");
     var date_val = document.getElementById("due_date");
     var date = new Date(); 
     var year = date.getFullYear(); 
     var month = new String(date.getMonth()+1); 
     var day = new String(date.getDate()); 

     if(month.length == 1){ 
       month = "0" + month; 
     } 
     if(day.length == 1){ 
       day = "0" + day; 
     } 
    
      var is_th = 0 ;
      $(function(){
         date_val.value=year + "-" + month + "-" + day;         
         date_div.style.display="none";
         var id = "<%=(String)session.getAttribute("id")%>" 
         user_name.value="Seller ID :     "+id;
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
        var upload_form = document.getElementById('form');
       var title = document.getElementById('title');
       var place = document.getElementById('place');
         var submit_btn = document.getElementById('submit_btn');
       var content = document.getElementById('content');
       var thumbnail = document.getElementById('uploadBtn');
        var phone = document.getElementById("phone");
     
       
         $("#submit_btn").click(function () {
             
             if(title.value=="")
               alert("No Title!");
            else if(place.value=="")
               alert("No Trade Place!");
            else if(phone.value=="")
               alert("No Phone Number!");
            else if(price.value=="")
               alert("No Price!");
            else if(is_th==0)
               alert("No Thumbnail Image!");
            else if(content.value=="")
               alert("No Content!");
            else if(number.value=="")
               number.value=1;
            
                    
          });
         
      
      
    </script>
   


</body>

</html>