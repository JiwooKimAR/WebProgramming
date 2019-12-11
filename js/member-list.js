// Go to previous page
function sendDecVal() {
	var cur = document.getElementById("cur_page").value - 1;
	var url = 'member_list.jsp?cur_page=' + cur;
	window.location.href = url;
}

// Go to next page
function sendIncVal() {
	var cur = document.getElementById("cur_page").value + 1;
	var url = 'member_list.jsp?cur_page=' + cur;
	window.location.href = url;
}

// Reload the initial information
function reload() {
	location.reload();
}

// Set default option value
function setDefOpt() {
	var cur = document.getElementById("classification").value;
	$('#buyer-seller option:eq(' + cur + ')').prop("selected", true);
	if (cur == "0") {
		$(".current").html("Administrator");
	}
	else if (cur == "1") {
		$(".current").html("Buyer");
	}
	else {
		$(".current").html("Seller");
	}
	 
}

// Send data to save the member information
function goToSave() {	
	var uid = document.getElementById("uid").value;
	var id = document.getElementById("id").value;
	var password = document.getElementById("pass").value;
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var classification = $("#buyer-seller option:selected").val();
	
	if (!id) {
		alert("ID is empty. Please enter the modified ID.");
		return;
	}
	if (!password) {
		alert("PASSWORD is empty. Please enter the modified PASSWORD.");
		return;
	}
	if (!name) {
		alert("NAME is empty. Please enter the modified NAME.");
		return;
	}
	if (!email) {
		alert("EMAIL is emtpy. Please enther the modified EMAIL.");
		return;
	}
	
	var url = 'member-save-function.jsp?uid=' + uid + '&&id=' + id + '&&password=' + password + '&&name=' +name + '&&email=' + email + '&&classification=' + classification;
	window.location.href = url;
}