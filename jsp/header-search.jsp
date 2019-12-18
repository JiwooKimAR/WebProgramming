<%
String sn = request.getParameter("seller-name");
String pn = request.getParameter("product-name");

if (pn == null && sn == null) {
	pn = "";
	sn = "";
}
else if (pn == null) {
	pn = "";
}
else if (sn == null) {
	sn = "";
}

response.sendRedirect("product_list_buyer.jsp?seller-name="+sn+"&product-name="+pn);
%>