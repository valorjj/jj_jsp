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

/* 
제품 정보 수정 (카테고리) 
*/

function product_update_category(p_no, p_category) {
	var p_no = p_no;
	var p_category = p_category;
	alert(p_no, p_category);
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


/* 2021-12-13 

제품 수량 변경 함수*/

function pchange(type, inStock, price) {
	var minCount = 1; // 최소 제품 수량
	var pcount = document.getElementById("pcount").value * 1;

	if (type == "m") { // 마이너스 버튼을 눌렀을 때 
		pcount -= 1;
		if (pcount < minCount) { // 최소 제품 수량보다 작아지면 메시지 출력하고 함수 종료 
			alert("수량은 1개 이상만 가능합니다.");
			pcount = 1;
		}

	} else if (type == "p") { // 플러스 버튼을 눌렀을 때
		pcount += 1;
		if (pcount > inStock) { // 최대 수량보다 커지면 메시지 출력하고 함수 종료
			alert("죄송합니다. 재고가 부족합니다. ");
			pcount = inStock;
		}

	} else { // 수량을 직접 입력했을 때

		if (pcount < minCount) { // 최소 제품 수량보다 작아지면 메시지 출력하고 함수 종료 
			alert("수량은 1개 이상만 가능합니다.");
			pcount = 1;
		}
		if (pcount > inStock) { // 최대 수량보다 커지면 메시지 출력하고 함수 종료
			alert("죄송합니다. 재고가 부족합니다. ");
			pcount = inStock;
		}
	}

	document.getElementById("pcount").value = pcount; // .value 속성 태그 [입력상자 input]
	var totalPrice = pcount * price;
	document.getElementById("total").innerHTML = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); // .innerHTML 속성 태그 [div]
	// 총가격.toString() : 문자열 변환
	// .replace(기존문자, 새로운 문자)
	// 정규 표현식 : /\B(?=(\d{3})+(?!\d))/g
	// 1. / : 시작
	// 2. \b : 시작, 끝 문자 [ 예 : 1234 일 경우 1, 4 ]
	// 3. d{3} : 문자 길이 [ 예 : {3} : 숫자 길이 123 ]
	// 4. !\d : 뒤에 숫자가 없을 경우
	// 5. /g : 전역 검색

}

/* 찜하기 */

function plike(p_no, m_num) {
	if (m_num == 0) { alert("로그인 후 사용가능한 기능입니다. "); return; }
	// 비동기식 통신을 위한 함수
	$(function() {

		$.ajax({
			url: "../../controller/productLikeController.jsp",
			data: { p_no: p_no, m_num: m_num },
			success: function(result) {
				if (result == 1) {
					document.getElementById("btnplike").innerHTML = "찜하기 <i class='bi bi-heart'></i>";

				} else if (result == 2) {
					document.getElementById("btnplike").innerHTML = "찜하기 <i class='bi bi-heart-fill'></i>";

				}
			}
		});
	});
}

/* 장바구니 시작 */

function cartadd() {

	// 1. jQuery 를 이용해서 값 가져오기 
	// 1.1 id 속성
	// var p_no2 = $("#p_no").val(); alert("[jQuery] id 속성 : " + p_no2);
	// 1.2 name 속성 이용
	// var p_no3 = $("input[name=p_no]").val(); alert("[jQuery] name 속성 : " + p_no3);
	// 1.3 class 속성 이용
	// var p_no4 = $(".p_no").val(); alert("[jQuery] class 속성 : " + p_no4);

	// 2. js 를 이용한 값 가져오기 

	// 2.1 id 값 이용. id 는 중복으로 끌어오기 불가능 
	var p_no = document.getElementById("p_no").value;

	// 2.2 class 속성 이용. class 중복을 허용하기 때문에 배열로 받아서 선택
	// var p_no5 = document.getElementsByClassName("p_no")[0].value; alert("[js] class 속성 : " + p_no5);

	// 2.3 name 속성 이용. name 은 중복을 허용하기 때문에 배열로 받아서 선택
	// var p_no6 = document.getElementsByName("p_no")[0].value; alert("[js] name 속성 : " + p_no6);


	var p_size = document.getElementById("p_size").value;
	if (p_size == 0) {
		alert("사이즈 옵션을 선택하지 않으셨습니다."); return;
	}

	var p_count = document.getElementById("pcount").value;

	// 컨트롤러 이동 [1. href 2. ajax]
	// location.href = "../../controller/productCartController.jsp?p_no=" + p_no + "&p_size=" + p_size + "&p_count=" + p_count;

	$.ajax({
		url: "../../controller/productCartController.jsp",
		data: { p_no: p_no, p_size: p_size, p_count: p_count },
		success: function(result) {
			if (confirm("장바구니에 상품을 담았습니다. 장바구니로 이동하시겠습니까? ") == true) {
				location.href = "productCart.jsp";
			}
		}
	});

}


/* 장바구니 비우기 */

function CartDelete(type, p_no, p_size) {

	$.ajax({
		url: "../../controller/productCartDeleteController.jsp",
		data: { type: type, p_no: p_no, p_size: p_size, i: -1, p_count: -1 },
		success: function(result) {
			location.reload();
		}
	});
}

/* 장바구니 수량 변경 */

function pchange2(i, type, inStock, price) {
	var minCount = 1;
	var p_count = document.getElementById("pcount" + i).value * 1;
	if (type == "m") { // 마이너스 버튼을 눌렀을 때 
		p_count -= 1;
		if (p_count < minCount) { // 최소 제품 수량보다 작아지면 메시지 출력하고 함수 종료 
			alert("수량은 1개 이상만 가능합니다.");
			p_count = 1;
		}

	} else if (type == "p") { // 플러스 버튼을 눌렀을 때
		p_count += 1;
		if (p_count > inStock) { // 최대 수량보다 커지면 메시지 출력하고 함수 종료
			alert("죄송합니다. 재고가 부족합니다. ");
			p_count = inStock;
		}

	} else { // 수량을 직접 입력했을 때

		if (p_count < minCount) { // 최소 제품 수량보다 작아지면 메시지 출력하고 함수 종료 
			alert("수량은 1개 이상만 가능합니다.");
			p_count = 1;
		}
		if (p_count > inStock) { // 최대 수량보다 커지면 메시지 출력하고 함수 종료
			alert("죄송합니다. 재고가 부족합니다. ");
			p_count = inStock;
		}
	}

	document.getElementById("pcount" + i).value = p_count; // .value 속성 태그 [입력상자 input]
	var totalPrice = p_count * price;
	document.getElementById("total" + i).innerHTML = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); // .innerHTML 속성 태그 [div]

	$.ajax({
		url: "../../controller/productCartDeleteController.jsp",
		data: { type: type, p_no: 0, p_size: 0, i: i, p_count: p_count },
		success: function(result) {
			location.reload();
		}

	});
}



/* 결제 방식 선택 1 */

function paymentselect(payselect) {

	document.getElementById("payselect").innerHTML = payselect;


}

/* 결제 방식 선택 2 */


/* import 결제 api 1 */

function payment() {

	if (document.getElementById("payselect").innerHTML == "") {
		alert("결제 방식을 선택해주세요.");
		return;
	}

	alert("거래 체크 알림창");


	var IMP = window.IMP;
	IMP.init("imp93252585"); // 관리자 식별 코드

	IMP.request_pay({ // param
		pg: "html5_inicis",
		pay_method: document.getElementById("payselect").innerHTML,
		merchant_uid: "ORD20180131-0000011", // 주문 번호
		name: "나만의 쇼핑몰",
		amount: document.getElementById("totalPay").innerHTML,
		buyer_email: "gildong@gmail.com",
		buyer_name: $("#name").val(),
		buyer_tel: $("#phone").val(),
		buyer_addr: $("#sample4_roadAddress").val() + "," + $("#sample4_jibunAddress").val() + "," + $("#sample4_detailAddress").val(),
		buyer_postcode: $("#sample4_postcode").val()
	}, function(rsp) { // callback
		if (rsp.success) {
			// 결제 성공 했을 때 -> 주문 완료 페이지로 이동

		} else {
			// 결제 실패 했을 때
			// 테스트 : 결제 성공 
			$.ajax({
				url: "../../controller/productPaymentController.jsp",
				data: {

					order_name: $("#name").val(),
					order_phone: $("#phone").val(),
					order_address: $("#sample4_postcode").val() + "," + $("#sample4_roadAddress").val() + "," + $("#sample4_jibunAddress").val() + "," + $("#sample4_detailAddress").val(),
					order_pay: document.getElementById("totalPay").innerHTML,
					order_payment: document.getElementById("payselect").innerHTML,
					delivery_pay: 3000,
					order_request: document.getElementById("prequest").value
				},
				success: function(result) {
					if (result == 1) {
						// 결제 성공 후 결제 주문 완료 페이지로 이동
						location.href = "productPaymentSuccess.jsp";
					}


					else if (result == 2) { }

				}

			});
		}
	});

}

/* import 결제 api 2 */

/* 회원과 동일한지 여부 체크 1 */

// 체크 유무 [jQuery]
$(document).ready(function() {
	$("#pay_check").change(function() {
		if ($("#pay_check").is(":checked")) { // jQuery
			// 체크박스가 체크 되었는지 확인 = true
			// is : 해당 태그 속성 찾기 [ 여기서는 checked ]
			$("#name").val($("#mname").val());
			$("#phone").val($("#mphone").val());
		} else {
			$("#name").val("");
			$("#phone").val("");
		}
	});

	$("#pay_check_address").change(function() { // 주소
		if ($("#pay_check_address").is(":checked")) {
			$("#sample4_postcode").val($("#addr1").val());
			$("#sample4_roadAddress").val($("#addr2").val());
			$("#sample4_jibunAddress").val($("#addr3").val());
			$("#sample4_detailAddress").val($("#addr4").val());
		} else {
			$("#sample4_postcode").val("");
			$("#sample4_roadAddress").val("");
			$("#sample4_jibunAddress").val("");
			$("#sample4_detailAddress").val("");
		}
	});

}); // ready 는 항상 대기

/* 회원과 동일한지 여부 체크 2 */


/* 결제 정보 1 */
function pointCheck(mpoint) {
	// input box 는 기본 타입이 String 이라서 숫자 연산을 하기 위해서는 숫자로 바꿔주어야한다. 

	var point = document.getElementById("point").value * 1;

	if (mpoint < point) {
		document.getElementById("pointWarning").innerHTML = "포인트가 부족합니다.";
		point = 0;
	} else {
		document.getElementById("userPoint").innerHTML = point;
	}

	var totalPrice = document.getElementById("totalprice").innerHTML * 1;
	var totalDelivery = document.getElementById("totalDelivery").innerHTML * 1;
	document.getElementById("totalPay").innerHTML = totalPrice + totalDelivery - point;

}

/* 결제 정보 2 */


