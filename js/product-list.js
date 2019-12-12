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
  
  //alert("auction: " + auction + ", soldout: " + soldout + ", progress: " + progress);

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

  var url = 'product_list_buyer.jsp?cur_status=' + cur_status;
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
