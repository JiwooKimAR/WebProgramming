//changeRadioValues();

$("input[name=status_auction]").change(function(){
	changeRadioValues();
});

$("input[name=status_soldout]").change(function(){
  changeRadioValues();
});

$("input[name=status_progress]").change(function(){
  changeRadioValues();
});

function changeRadioValues(){
  var auction = $("input[name=status_auction]:checked").val();
  var soldout = $("input[name=status_soldout]:checked").val();
  var progress = $("input[name=status_progress]:checked").val();

  var cur_status = 0; 
  
  if(auction == "") auction = "a";
  if(soldout == "") soldout = "s";
  if(progress == "") progress = "p";
  
  
  if(auction == "a" && soldout == "s" && progress == "p") cur_status = 7; 
  else if(auction == "a" && soldout == "s") cur_status = 4;
  else if(auction == "a" && progress == "p") cur_status = 5; 
  else if(soldout == "s" && progress == "p") cur_status = 6; 
  else if(auction == "a") cur_status = 1; 
  else if(soldout == "s") cur_status = 2;
  else if(progress == "p") cur_status = 3;

  var cur_sort = document.getElementById("cur_sort").value;
  
  var link = document.location.pathname.split("/");
  var url = link[2] + '?cur_status=' + cur_status + "&cur_sort=" + cur_sort;
  
  window.location.href = url;
}


function check(){

	  $("input[name='status_auction']").each(function(){
		  var thisVal = $(this).val();
		  if( thisVal.length > 0 ){
			  $(this).attr("checked", true );
		  }
	  });
	  $("input[name='status_soldout']").each(function(){
		  var thisVal = $(this).val();
		  if( thisVal.length > 0 ){
			  $(this).attr("checked", true );
		  }
	  }); 
	  $("input[name='status_progress']").each(function(){
		  var thisVal = $(this).val();
		  if( thisVal.length > 0 ){
			  $(this).attr("checked", true );
		  }
	  }); 
}


$("#sortBy").change(function(){
  var sortBy = $(this).val();
  var cur_sort = 0;
  
  if(sortBy == "newest") cur_sort = 0;
  if(sortBy == "price") cur_sort = 1;

  var cur_status = document.getElementById("cur_status").value; 
  
  var link = document.location.pathname.split("/");
  window.location.href = link[2] + "?cur_sort=" + cur_sort + "&cur_status=" + cur_status;
});

$(".sort-price").click(function(){
	alert("CLICK");
	var range = $(".range-price").text();
	if(range[0] != " "){
		var min_price = range.split(" ")[0];
		var max_price = range.split(" ")[2];
	}else{
		var min_price = range.split(" ")[1];
		var max_price = range.split(" ")[3];
	}
	min_price = min_price.split("$")[1];
	max_price = max_price.split("$")[1];
	

	
	var link = document.location.pathname.split("/");
	var query = document.location.href.split("?")[1];
	
	
	var qlist = query.split("&");
	
	query = "";
	for(var i = 0; i < qlist.length; i++){
		if(qlist[i].indexOf("min") == -1 && qlist[i].indexOf("max") == -1) query += "&" + qlist[i];
	}
	
	window.location.href = link[2] + "?min=" + min_price + "&max=" + max_price + query;
	
})
