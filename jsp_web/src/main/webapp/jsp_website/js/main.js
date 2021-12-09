function sample4_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample4_postcode').value = data.zonecode;
			document.getElementById("sample4_roadAddress").value = roadAddr;
			document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			if (roadAddr !== '') {
				document.getElementById("sample4_extraAddress").value = extraRoadAddr;
			} else {
				document.getElementById("sample4_extraAddress").value = '';
			}

			var guideTextBox = document.getElementById("guide");
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			if (data.autoRoadAddress) {
				var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				guideTextBox.style.display = 'block';

			} else if (data.autoJibunAddress) {
				var expJibunAddr = data.autoJibunAddress;
				guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				guideTextBox.style.display = 'block';
			} else {
				guideTextBox.innerHTML = '';
				guideTextBox.style.display = 'none';
			}
		}
	}).open();
}

/* 아이디 중복체크 [ajax] */

$(function() {
	// 
	$("#id").change(function() {
		$.ajax({
			url: "idcheck.jsp", /* 통신할 페이지, 통신할 경로명 */
			data: { userid: document.getElementById("signupform").id.value }, /* 이용할 데이터 */
			success: function(result) { /* 통신이 성공 했을 때 */

				if (result == 1) { // jsp 변수는 자료형이 없다. 
					alert("중복");
				} else { // 
					alert("유효");
				}
			}
		});
	});
	// $("id명").이벤트명( 함수() { 실행코드 });
});

/* 회원 탈퇴 [ajax] */
$(function() {
	// 1. 버튼을 클릭했을 때 이벤트 걸기
	// 1.1 아이디 가져올 때는 '#' 사용 
	$("#memberdrop").click(function() {
		$.ajax({
			// 2. url 경로에 존재하는 파일과 통신하겠다. 
			url: "../../controller/memberdropcontroller.jsp",
			data: { password: document.getElementById("dropform").password.value },
			success: function(result) { // 3. 통신 성공 후 반환값을 확인한다. 

				if (result == 1) {
					alert('성공적으로 회원 탈퇴 되었습니다');
					// 3. 세션을 삭제해야하니 로그아웃 컨트롤러로 바로 직행 
					// 3.1 로그아웃 컨트롤러 : 세션 null 값 만들고 메인 페이지로 이동
					location.href = '../../controller/logoutcontroller.jsp';
				} else {
					document.getElementById("dropresult").innerHTML = "회원정보가 다릅니다.";
				}
			}
		});
	});
});


/* 회원 정보 수정하기 */

/* 1. 회원 이름 수정하기 */
function updatename() {
	/* 2. 새로운 이름을 입력받는다. */
	document.getElementById("tdname").innerHTML = "<div class='input-group'> <input type='text' id='name' class='form-control'> <button id='nameupdatebtn' class='btn btn-success'>확인</button> </div>";
	/* 3. ajax 통신을 통해 정보를 db 와 연동시킨다. */

	$(function() {
		$("#nameupdatebtn").click(function() {
			$.ajax({
				url: "../../controller/memberupdatecontroller.jsp",
				data: { name: document.getElementById("name").value },
				success: function(result) {
					// 1. 유효성 검사는 생략한다. 
					// 2. #name 으로 들어온 값을 db 와 연동시킨다. 
					// 3. memberupdatecontroller.jsp 파일에서 db 업데이트 
					if (result == 1) {
						document.getElementById("tdname").innerHTML = document.getElementById("name").value;
					}
				}
			});
		})
	});

}

/* 2. 회원 비밀번호 수정하기 */
function updatepassword() {
	alert("비밀번호 변경 클릭 이벤트");
	document.getElementById("tdpassword").innerHTML = "<div class='input-group'> <input type='text' id='password' class='form-control'> <button id='passwordupdatebtn' class='btn btn-primary'>확인</button> </div>";

	$(function() {
		$("#passwordupdatebtn").click(function() {
			$.ajax({
				url: "../../controller/memberupdatecontroller.jsp",
				data: { password: document.getElementById("password").value },
				success: function(result) {
					if (result == 2) {
						document.getElementById("tdpassword").innerHTML = document.getElementById("password").value;
					}
				}
			});
		});
	});
}

/* 3. 회원 핸드폰 번호 수정하기 */
function updatephonenumber() {
	alert("핸드폰 번호 변경 클릭 이벤트");
	document.getElementById("tdphone").innerHTML = "<div class='input-group'> <input type='text' id='phone' class='form-control'> <button id='phoneupdatebtn' class='btn btn-primary'>확인</button> </div>";

	$(function() {
		$("#phoneupdatebtn").click(function() {

			$.ajax({
				url: "../../controller/memberupdatecontroller.jsp",
				data: { phone: document.getElementById("phone").value },
				success: function(result) {
					if (result == 3) {
						document.getElementById("tdphone").innerHTML = document.getElementById("phone").value;
					}
				}
			});
		});
	});
}

/* 4. 회원 생년월일 수정하기 */
function updatebirthdate() {
	alert("생년월일 변경 클릭 이벤트")
	document.getElementById("tdbirthdate").innerHTML = "<div class='input-group'> <input type='date' id='birthdate' class='form-control'> <button id='birthdateupdatebtn' class='btn btn-primary'>확인</button></div>";
	$(function() {
		$("#birthdateupdatebtn").click(function() {
			$.ajax({
				url: "../../controller/memberupdatecontroller.jsp",
				data: { birthdate: document.getElementById("birthdate").value },
				success: function(result) {
					if (result == 4) {
						alert("생년 월일이 변경되었습니다. ");
						document.getElementById("tdbirthdate").innerHTML = document.getElementById("birthdate").value;
					}
				}
			});
		});
	});
}


/* "<div class='input-group'> <input id='address' type='button' onclick='sample4_execDaumPostcode()' value='우편번호 찾기' class='form-control btn btn-primary' ></div>";*/
/* 5. 회원 주소 변경하기 */


$(function() {
	$("#add_update").click(function() {
		document.getElementById("traddress").style.display = "";
	});
});





// document.getElementById("traddress").style.display = "";
// document.getElementById("tdaddress").innerHTML = "";
$(function() {
	$("#addressupdatebtn").click(function() {
		$.ajax({
			url: "../../controller/memberupdatecontroller.jsp",
			data: { address1: document.getElementById("sample4_postcode").value, address2: document.getElementById("sample4_roadAddress").value, address3: document.getElementById("sample4_jibunAddress").value, address4: document.getElementById("sample4_detailAddress").value },
			success: function(result) {
				if (result == 5) {
					document.getElementById("traddress").style.display = "none";
					document.getElementById("tdaddress").innerHTML = "";
				}
			}
		});
	});
});



/*회원가입 유효성 검사*/
function signupcheck() {

	// 1. form 가져오기
	var id = document.getElementById("signupform").id.value;
	var password = document.getElementById("signupform").password.value;
	var passwordconfirm = document.getElementById("signupform").passwordconfirm.value;
	var name = document.getElementById("signupform").name.value;
	var phone = document.getElementById("signupform").phone.value;
	var gender1 = document.getElementById("signupform").gender1.checked;
	var gender2 = document.getElementById("signupform").gender2.checked;
	// var birthdate = document.getElementById("signupform").birthdate.value;

	// 2. 유효성 검사 [정규 표현식];
	// 정규 표현식 
	var idj = /^[a-z0-9]{5,12}$/; // 아이디 표현식 
	var pwj = /^[A-Za-z0-9]{5,15}$/; // 비밀번호 표현식
	var phonej = /^01([0|1|8|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var namej = /^[A-Za-z0-9가-힣]{1,15}$/;

	// /^ : 정규표현식 시작
	// $/ : 정규표현식 끝 

	// [ ] : 문자 패턴
	// [ a-z ] : 소문자 a-z 만 가능
	// [ A-Z ] : 대문자 A-Z 만 가능
	// [ 0-9 ] : 숫자 0-9 만 가능
	// [ 가-힣] : 한글만 가능
	// { } : 문자 갯수
	// { 최소길이, 최대길이 }
	// () : 문자 하나로 인식 
	// (0|1) : 0 or 1gksk 
	// ? : 문자가 있거나 or 한 개 존재한다. (? 당 문자 1개로 취급한다.)
	// * : 문자가 없거나 혹은 여러 개 존재 


	if (!idj.test(id) || id == "") {
		// alert("가능");
		document.getElementById("idresult").innerHTML = "id는 소문자와 숫자조합 5-15 만 가능합니다.";
		document.getElementById("idresult").style.color = "red";
		return false;
	} else {
		document.getElementById("idresult").innerHTML = "사용 가능한 아이디입니다.";
		document.getElementById("idresult").style.color = "green";
	}


	if (!pwj.test(password) || !pwj.test(passwordconfirm)) {
		document.getElementById("pwresult").innerHTML = "대소문자 구분 5-15 길이로 입력해주세요";
		return false;
	} else if (!(password == passwordconfirm)) {
		document.getElementById("pwresult").innerHTML = "패스워드가 동일하지 않습니다.";
		document.getElementById("pwresult").style.color = "red";
		return false;
	} else {
		document.getElementById("pwresult").innerHTML = "";
	}

	if (!namej.test(name) || name == "") {
		document.getElementById("nameresult").innerHTML = "이름을 다시 입력해주세요 특수문자 제외";
		document.getElementById("nameresult").style.color = "red";
		return false;
	} else {
		document.getElementById("nameresult").innerHTML = "";
	}

	if (birthdate == "") {
		document.getElementById("birthdateresult").innerHTML = "생년월일을 입력해주세요";
		document.getElementById("birthdateresult").style.color = "red";
		return false;
	} else {
		document.getElementById("birthdateresult").innerHTML = "";
	}


	if (!gender1 && !gender2) {
		document.getElementById("genderresult").innerHTML = "성별을 선택해주세요";
		return false;
	} else {
		document.getElementById("genderresult").innerHTML = "";
	}

	if (!phonej.test(phone)) {
		document.getElementById("phoneresult").innerHTML = "전화번호 형식이 다릅니다. ";
		document.getElementById("phoneresult").style.color = "red";
		return false;
	} else {
		document.getElementById("phoneresult").innerHTML = "";
	}

}

/* 제품 상태 변경 */

function activeupdate(p_no) {
	var p_no = p_no;
	if (confirm("상태변경하시겠습니까?") == true) {
		// ajax 통신으로 상태를 다음 상태로 변경 (1 -> 2, 2->3, 3->1 이런 식)
		$(function() {
			$.ajax({
				url: "../../controller/product_active_controller.jsp",
				data: { p_no: p_no },
				success: function(result) {
					if (result == 1) {
						location.reload(); // jQuery 
					} else {
						alert("오류발생. 관리자문의");
					}
				}
			});
		});
	}
}

/* 제품 정보 수정 (이름) */

function product_update_name(p_no) {
	var p_no = p_no;
	alert(p_no);
	document.getElementById("td_p_name").innerHTML = "<div class='input-group'> <input type='text' id='p_name' class='form-control'> <button id='p_btn_name' class='btn btn-outline-info'> 확인 </button>  </div>"
	$(function() {
		$("#p_btn_name").click(function() {
			alert(p_no);
			$.ajax({
				url: "../../controller/product_update_controller.jsp",
				data: { p_name: p_name, p_no: p_no },
				success: function(result) {
					if (result == 1) {
						alert("수정 완료");
						location.reload();
					} else {
						alert("오류. 관리자문의 바람");
					}
				}
			});
		});
	});
}

/* 제품 정보 수정 (가격) */

function product_update_price() {
	document.getElementById("td_p_price").innerHTML = "<div class='input-group'> <input type='text' id='p_price' class='form-control'> <button id='p_btn_price' class='btn btn-outline-info'> 확인 </button>  </div>"
	$(function() {
		$("#p_btn_price").click(function() {
			$.ajax({
				url: "../../controller/product_update_controller.jsp",
				data: { p_price: p_price },
				success: function(result) {
					if (result == 1) {
						alert("수정 완료");
						location.reload();
					} else { alert("오류. 관리자문의 바람"); }
				}
			});
		});
	});
}

/* 제품 정보 수정 (카테고리) */

function product_update_category(p_no) {
	var p_no = p_no;
	alert(p_no);
	document.getElementById("tr_p_category_og").style.display = "none";
	document.getElementById("tr_p_category").style.display = "";
	$(function() {
		$("#p_btn_category").click(function() {
			alert(p_no);
			$.ajax({
				url: "../../controller/product_update_controller.jsp",
				data: { p_category: document.getElementById("pcategory").value, p_no: p_no },
				success: function(result) {
					if (result == 1) {
						alert("수정 완료");
						location.reload();
					} else { alert("오류. 관리자문의 바람"); }
				}
			});
		});
	});
}




