// radio box in login.jsp
// "tab-1" for sign-in, "tab-2" for sign-up
function radioCheck(i) {
	$('input:radio[id="tab-' + i + '"]').prop("checked", true);
	console.log($('input:radio[id="tab-1"]').is(":checked"));
	console.log($('input:radio[id="tab-2"]').is(":checked"));
}

// For duplicate test of id when sign up
function dtest() {
	var id = document.getElementById("user2").value;
	// null check
	if (!id) {
		alert("ID is empty. Please enter your ID.");
	}
	else {
		// Move to verification page
		url = "jsp/duplicate-test.jsp?id=" + id;
		open(url, "Duplicate Test", "height=110, width=600, left=300, top=300");
	}
}

// For reset the inputs
function reset() {
	document.getElementById("user2").value = "";
	document.getElementById("pass2").value = "";
	document.getElementById("name").value = "";
	document.getElementById("email").value = "";
	document.getElementById("dupBtn").innerHTML = "Duplicate";
}

//If user pass the duplication test, then change the 
function dtestPass() {
	if (document.getElementById("status2").value == "1") {
		opener.document.getElementById("dupBtn").innerHTML = "Pass";
	}
	if (document.getElementById("status1").value == "1") {
		opener.document.getElementById("dupBtn").innerHTML = "Duplicate";
		
	}
}

// Check that all the input is filled
// Return value is boolean
function formCheck() {
	if (!document.getElementById("user2").value) {
		alert("ID is empty. Please enter your ID.");
		return false;
	}
	if (!document.getElementById("pass2").value) {
		alert("PASSWORD is empty. Please enter your PASSWORD.");
		return false;
	}
	if (!document.getElementById("name").value) {
		alert("NAME is empty. Please enter you NAME.");
		return false;
	}
	if (!document.getElementById("email").value) {
		alert("EMAIL is emtpy. Please enter your EMAIL ADDRESS.");
		return false;
	}
	if (document.getElementById("dupBtn").innerHTML != "Pass") {
		alert("Please do the duplication test for your ID.");
		return false;
	}
	if (!$('input:radio[id="check1"]').is(":checked") && !$('input:radio[id="check2"]').is(":checked")) {
		alert("Please check your type [Buyer or Seller].");
		return false;
	}
	return true;
}