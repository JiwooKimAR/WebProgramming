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
<%@ include file="header-seller.jsp" %>
        <div class="area">
            <div class="container-fluid">
                <div class="registration-row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>Product Registration</h2>
                            </div>

                            <form action="#" method="post">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <input type="text" class="form-control" value="" placeholder="Product Name" required>
                                    </div>



                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control"  placeholder="Trade Place" value="">
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control" id="username" placeholder="User Name" value="" readonly>
                                    </div>
                                    <div class="col-md-7 mb-3">
                                        <input type="number" class="form-control" id="phone" min="0" placeholder="Phone No" value="">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <select class="w-100" id="Market">
                                        <option value="0">Flea Market</option>
                                        <option value="1">Auction</option>
                                    </select>
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <input type="number" class="form-control" id="price" placeholder="Price" value="">
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <input type="number" class="form-control" id="product_number" placeholder="Product Number" value="">
                                    </div>
                                    <div class="col-6 mb-5">
                                      <label>Thumbnail image <div class="fileBox">
                                        	<input type="text" class="fileName" readonly="readonly">
                                        	<label for="uploadBtn" class="btn_file">find image</label>
                                        	<input type="file" id="uploadBtn" class="uploadBtn">
                                        </div></label>
                                    </div>
                                    <div class="col-6 mb-3">
                                      <label>detail images <div class="fileBox">
                                        	<input type="text" class="fileNames" readonly="readonly">
                                        	<label for="uploadBtns" class="btn_file">find image</label>
                                        	<input type="file" id="uploadBtns" class="uploadBtns" multiple>
                                        </div> </label>
                                    </div>
                                    <div class="col-8 mb-5">
                                    <img id="th_image" src="" alt="Register your thumbnail image" width="300px" height="300px">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <textarea name="comment" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="Product Content"></textarea>
                                    </div>

                                    <div class="col-3 mb-3">
                                        <a href="#" class="btn amado-btn w-100">Confirm</a>
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
      var market_op = document.getElementById("Market");
      var price = document.getElementById("price");
      var number = document.getElementById("product_number");
      $("#Market").on("change",function(){
        console.log("hi",$("#price").placeholder);
        if(market_op.value=="0")
        {
          price.placeholder = "price($)";
          number.placeholder = "product number";
        }
        else {
          price.placeholder = "min price($)";
          number.placeholder = "bid unit($)"
        }
      });

      var thumbnail = document.getElementById("uploadBtn");
      var th_image = document.getElementById("th_image");
      thumbnail.addEventListener('change', function (evnt) {
    	//	console.log('videoupload');
    		th_image.src = "./img/bg-img/1.jpg";
    	//		console.log('hi',video.name);
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
    </script>


</body>

</html>
