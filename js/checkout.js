function changeRadioValues(){
	var chkbox = $("input[name=check]:checked");
	var price = $("input[name=quantity]");
	var total=0;
	
	for(i=0;i<chkbox.length;i++) {
	    if (chkbox[i].checked == true){
	        total += chkbox[i].value*price[i].value;
	    }
	}
	document.getElementById('total').innerHTML='$'+total;
}
