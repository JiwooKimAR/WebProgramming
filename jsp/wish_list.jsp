<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%

String id=session.getAttribute("id").toString();


ArrayList<Integer> pid_list = new ArrayList<Integer>();
ArrayList<String> pname_list = new ArrayList<String>();
ArrayList<Integer> seller_list = new ArrayList<Integer>();
ArrayList<Double> price_list = new ArrayList<Double>();
ArrayList<Integer> status_list = new ArrayList<Integer>();
ArrayList<Integer> amount_list = new ArrayList<Integer>();

int uid = -1; 

int total = 0;
int page_num = 1; 
int cur_page = 1; // start from 1 page
int cur_status = 0; // select all
int cur_sort = 0; // newest 

// current item idx range
int cur_start = 1; 
int cur_end = 0;

int wish_num = 0; 
int cart_num = 0;

String seller_name = "";
String img_path = "";

String auction_var = "";
String soldout_var = "";
String progress_var = "";

if(request.getParameter("cur_page") != null){
    cur_page = Integer.parseInt(request.getParameter("cur_page"));
}

if(request.getParameter("cur_status") != null){
    cur_status = Integer.parseInt(request.getParameter("cur_status"));
}

if(request.getParameter("cur_sort") != null){
    cur_sort = Integer.parseInt(request.getParameter("cur_sort"));
}

%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="description" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>SKKU Flea Market | Wish List</title>

  <!-- Favicon  -->
  <link rel="icon" href="img/core-img/favicon.ico">

  <link rel="stylesheet" href="css/core-style.css">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="css/header-style.css">
  <link rel="stylesheet" href="css/product_list-style.css">
</head>
<body onload=check();>
     <%@ include file="header.jsp" %>

    <input type="hidden" id="cur_status" value="<%=cur_status%>">
    <input type="hidden" id="cur_sort" value="<%=cur_sort%>">

    <%
    // cur_status : 0 - all, 1 - auction, 2 - sold out, 3 - in progress
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
        
        PreparedStatement upst = conn.prepareStatement("select * from user_info where id=?;");
        upst.setString(1, id);
        ResultSet urs = upst.executeQuery();
        if(urs.next()) {
        	uid = urs.getInt("uid");
        }

        String query = "select p.pid, p.name, p.seller_id, p.price, p.status, p.amount from wish_cart_info w, product_info p where w.status=0 and w.prod_id=p.pid and w.buyer_id=" + uid;

        if(cur_status > 0) {
            query += " and p.status in (";
            // 1-a, 2-s, 3-p, 4-a/s, 5-a/p, 6-s/p, 7-all
            if(cur_status == 1) {
                query += "0";
                auction_var = "a";
            }else if(cur_status == 2) {
                query += "1";
                soldout_var = "s";
            }else if(cur_status == 3) {
                query += "2";
                progress_var = "p";
            }else{
                if(cur_status == 4) {
                    query += "0, 1";
                    auction_var = "a";
                    soldout_var = "s";
                }else if(cur_status == 5) {
                    query += "0, 2";
                    auction_var = "a";
                    progress_var = "p";
                }else if(cur_status == 6) {
                    query += "1, 2";
                    soldout_var = "s";
                    progress_var = "p";
                }else {
                    query += "0, 1, 2";
                    auction_var = "a";
                    soldout_var = "s";
                    progress_var = "p";
                }
            }

            query += ")";
        }

        if(cur_sort == 1) {
            query += " order by p.price desc";
        }

        query += ";";

        PreparedStatement pst = conn.prepareStatement(query);
        ResultSet rs = pst.executeQuery();

        while(rs.next()){
            pid_list.add(rs.getInt("pid"));
            pname_list.add(rs.getString("name"));
            seller_list.add(rs.getInt("seller_id"));
            price_list.add(rs.getDouble("price"));
            status_list.add(rs.getInt("status"));
            amount_list.add(rs.getInt("amount"));
            total += 1;
        }

        Collections.reverse(pid_list);
        Collections.reverse(pname_list);
        Collections.reverse(seller_list);
        Collections.reverse(price_list);
        Collections.reverse(status_list);
        Collections.reverse(amount_list);

        page_num = (total / 6) + 1; // total page number
        if(total % 6 == 0) page_num -= 1; 

    %>

    <input type="hidden" id="cur_page" value="<%=cur_page%>">

    <% 
    cur_start = (cur_page - 1) * 6 + 1;

    if(cur_page < page_num) { cur_end = cur_start + 5; }
    else if (cur_page == page_num){ 
        cur_end = cur_start - 1 + total % 6; 
        if(total != 0) {
            if(total % 6 == 0) cur_end = cur_start - 1 + 6; 
        }
    }

    %>
    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="product-list-buyer-area">
        <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget brands mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Status</h6>
                <form id="status_form">
                    <div class="widget-desc">
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="status_auction" id="auction" value="<%=auction_var%>">
                            <label class="form-check-label" for="auction">Auction</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="status_progress" id="progress" value="<%=progress_var%>">
                            <label class="form-check-label" for="progress">In Progress</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="status_soldout" id="sold_out" value="<%=soldout_var%>">
                            <label class="form-check-label" for="sold_out">Sold Out</label>
                        </div>
                    </div>
                </form>

            </div>

            
        </div>

        <div class="area">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div class="product-topbar d-xl-flex align-items-end justify-content-between">
                            <!-- Total Products -->
                            <div class="total-products">
                                <p>Showing <%=cur_start%>-<%=cur_end%> 0f <%=total %></p>
                                <!--<div class="view d-flex">
                                    <a href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
                                </div>-->
                            </div>

                            <!-- ##### Single Widget ##### -->
                            <div class="widget price">
                                <!-- Widget Title -->
                                <h6 class="widget-title">Price</h6>

                                <div class="widget-desc">
                                    <div class="slider-range">
                                        <div data-min="10" data-max="1000" data-unit="$" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="10" data-value-max="1000" data-label-result="">
                                            <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                            <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                            <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                        </div>
                                        <div class="range-price">$10 - $1000</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Sorting -->
                            <div class="product-sorting d-flex">
                                <div class="sort-by-date d-flex align-items-center mr-15">
                                    <p>Sort by</p>
                                    <form action="#" method="get">
                                        <select name="select" id="sortBy">
                                            <option value="newest" <%if(cur_sort == 0) { %> selected <% } %>>Newest</option>
                                            <option value="price" <%if(cur_sort == 1) { %> selected <% } %>>Price</option>
                                        </select>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <%
                    for(int i = cur_start - 1; i < cur_end; i++){

                
                    %>
                    <!-- Single Product Area -->
                    <div class="col-12 col-sm-6 col-md-12 col-xl-6">
                        <div class="single-product-wrapper">
                            <!-- Product Image -->
                            <div class="product-img">
                                <% 
                                PreparedStatement img_pst = conn.prepareStatement("Select * from img_info where pid=?");
                                img_pst.setInt(1, pid_list.get(i));
                                ResultSet img_rs = img_pst.executeQuery();
                                if(img_rs.next()) {img_path = img_rs.getString("path"); }
                                %>
                                <a href="product-details<%if(status_list.get(i) == 0){ %>-auction<%} %>.jsp?pid=<%=pid_list.get(i)%>"><img src="<%=img_path%>" alt=""></a>
                                <!-- Hover Thumb -->
                                <!--<img class="hover-img" src="img/product-img/product2.jpg" alt="">-->
                            </div>

                            <!-- Product Description -->
                            <div class="product-description d-flex align-items-center justify-content-between">
                                <!-- Product Meta Data -->
                                <div class="product-meta-data">
                                    <div class="line"></div>
                                    <div class="product-status-name">
                                        <% if(status_list.get(i) == 0){%> 
                                        <p class="product-status" style="color: blue; ">AUCTION</p>
                                        <a href="product-details-auction.jsp?pid=<%=pid_list.get(i)%>" class="product-name">
                                            <p><%= pname_list.get(i)%></p>
                                        </a>
                                        <%}
                                        if(status_list.get(i) == 2){%>
                                        <p class="product-status">SELLING</p>
                                        <a href="product-details.jsp?pid=<%=pid_list.get(i)%>" class="product-name">
                                            <p><%= pname_list.get(i)%></p>
                                        </a>
                                        <%}
                                        if(status_list.get(i) == 1){%>
                                        <p class="product-status" style="color: red;">SOLD OUT</p>
                                        <a href="product-details.jsp?pid=<%=pid_list.get(i)%>" class="product-name">
                                            <p><%= pname_list.get(i)%></p>
                                        </a>
                                        <%}%>

                                        
                                    </div>
                                    <div class="product-price-seller">
                                        <p class="product-price">$<%= price_list.get(i)%></p>
                                        <% 
                                        PreparedStatement seller_pst = conn.prepareStatement("Select * from user_info where uid=?");
                                        seller_pst.setInt(1, seller_list.get(i));
                                        ResultSet seller_rs = seller_pst.executeQuery();
                                        if(seller_rs.next()) seller_name = seller_rs.getString("id");
                                        %>
                                        <p class="product-seller"><%=seller_name%></p>
                                    </div>
                                </div>
                                <!-- Ratings & Cart -->
                                <div class="ratings-cart text-right">
                                    <div class="wish">
                                        <% 
                                        PreparedStatement wish_pst = conn.prepareStatement("Select * from wish_cart_info where prod_id=?");
                                        wish_pst.setInt(1, pid_list.get(i));
                                        ResultSet wish_rs = wish_pst.executeQuery();
                                        wish_num = 0;
                                        while(wish_rs.next()){ 
                                            if(wish_rs.getInt("status") == 0) wish_num += 1; 
                                        }
                                        %>
                                        <p><%=wish_num%></p>
                                        <a href="addwish.jsp?pid=<%=pid_list.get(i)%>" data-toggle="tooltip" data-placement="left" title="Add to wish list"><img src="img/core-img/wish-star.png" alt=""></a>
                                    </div>
                                    <div class="cart_">
                                        <% 
                                        PreparedStatement cart_pst = conn.prepareStatement("Select * from wish_cart_info where prod_id=?");
                                        cart_pst.setInt(1, pid_list.get(i));
                                        ResultSet cart_rs = cart_pst.executeQuery();
                                        cart_num = 0;
                                        while(cart_rs.next()){ 
                                            if(cart_rs.getInt("status") == 1) cart_num += 1; 
                                        }
                                        %>
                                        <p><%=cart_num%></p>
                                        <a href="addcart.jsp?pid=<%=pid_list.get(i)%>" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } 
                    if(cur_end % 2 == 1){
                        %> <div class="col-12 col-sm-6 col-md-12 col-xl-6"> </div>
                    <%}
                    %>

                </div>

                <div class="row">
                    <div class="col-12">
                        <!-- Pagination -->
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                                <% for(int i = 1; i <= page_num; i++) {
                                    if(i != cur_page) {
                                %>
                                    <li class="page-item"><a class="page-link" href="wish_list.jsp?cur_page=<%=i%>&cur_status=<%=cur_status%>">0<%=i%>.</a></li>
                                <% }
                                    else{ %>
                                    <li class="page-item active"><a class="page-link" href="wish_list.jsp?cur_page=<%=i%>&cur_status=<%=cur_status%>">0<%=i%>.</a></li>
                                <%} }%>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    

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

    <script src="js/product-list.js"></script>

</body>
</html>

<% 
    rs.close();
    conn.close();

} catch(Exception e) {
    out.println("Something went wrong !! Please try again");
}
%>
