$(document).ready (function () {
	$("#input1").blur(function() {
		var image = document.getElementById("img-user");
		var input = document.getElementById("input1");
		var inputlen = input.value.length;
		if (inputlen < 6) {
			$("#img-user").attr("src","no.png");
		} else {
			$("#img-user").attr("src","yes.png");
		}
 });});
 
 $(document).ready (function() {
	$("#input2").blur(function() {
		var email = document.getElementById("input2").value;
		var reg = /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/;
		if (reg.test(email) === true) {
			$("#img-email").attr("src","yes.png");
		} else {
			$("#img-email").attr("src","no.png");
		}
	});
});
			
 
 $(document).ready (function() {
	$("#input3").blur(function() {
		pass1();
	});
	$("#input3").blur(function() {
		pass2();
	});
	$("#input3").blur(function() {
		pass3();
	});
	$("#input3").blur(function() {
		pass4();
	});
	$("#input3").blur(function() {
		pass5();
	});
});

function pass1() {
	var inputlen = document.getElementById("input3").value.length;
	if (inputlen < 6) {
		$("#img-pass1").attr("src","no.png");
	} else {
		$("#img-pass1").attr("src","yes.png");
	}
}

function pass2() {
	var pass = document.getElementById("input3").value;
	var reg = /[a-z]/;
	if (reg.test(pass) === true) {
		$("#img-pass2").attr("src","yes.png");
	} else {
		$("#img-pass2").attr("src","no.png");
	}
}

function pass3() {
	var pass = document.getElementById("input3").value;
	var reg = /[A-Z]/;
	if (reg.test(pass) === true) {
		$("#img-pass3").attr("src","yes.png");
	} else {
		$("#img-pass3").attr("src","no.png");
	}
}

function pass4() {
	var pass = document.getElementById("input3").value;
	var reg = /[0-9]/;
	if (reg.test(pass) === true) {
		$("#img-pass4").attr("src","yes.png");
	} else {
		$("#img-pass4").attr("src","no.png");
	}
}

function pass5() {
	var pass = document.getElementById("input3").value;
	var reg = /[!#$%&'*+-=?@^_~]/;
	if (reg.test(pass) === true) {
		$("#img-pass5").attr("src","yes.png");
	} else {
		$("#img-pass5").attr("src","no.png");
	}
}
 
  $(document).ready (function() {
	$("#input4").blur(function() {
		var city = document.getElementById("input4").value;
		var reg = /[A-Z]+[a-z]/;
		if (reg.test(city) === true) {
			$("#img-city").attr("src","yes.png");
		} else {
			$("#img-city").attr("src","no.png");
		}
	});
});	