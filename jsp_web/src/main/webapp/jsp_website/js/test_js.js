/**
 * 
 */

var price = 5;
var num1 = 15;
var total = price * num1;
var elem = document.getElementById("number");
elem.textContent = total;
var minus = price - num1;
var plus = price + num1;
var elem1 = document.getElementById("number1");
if (price == num1) {
	elem1.textContent = minus;
} else {
	elem1.textContent = plus;
}

function start() { // 함수 선언 

	// 배열 대괄호 필요없다. 
	var color = ['red', 'white', 'black'];
	var colorName = document.getElementById("color");
	colorName.textContent = color[0];
	colorName.style.color = color[0];

	var colors = color.length;
	var colorLength = document.getElementById("colors");
	colorLength.textContent = colors;

	document.body.style.backgroundColor = "blue";

}

function start2() {

	var text = "";
	var count = 1;
	while (count < 10) {
		text += "<li> 여기는 숫자 " + count + "</li>";
		// 변수는 " " 처리 XXXX
		// html 는 문자처리해야한다. "<br>"
		count++;
	}

	document.getElementById("list").innerHTML = text;
	if (document.getElementById("list").innerHTML != text) {
		document.getElementById("list").innerHTML = "";
	}

	// for 문

	var text1 = "";
	for (var i = 0; i < 10; i++) {
		text1 += "<li> 여기는 숫자 : " + i + "</li>";

	}

	document.getElementById("list1").innerHTML = text1;

	var text2 = "";
	var phones = ["아이폰12", "아이폰13", "아이폰13MAX"];

	for (var i = 0; i < phones.length; i++) {

		text2 += "<li> " + phones[i] + "</li>";
	}

	// byid 인수에 jsp 파일에 작성한 id 값을 집어넣는다.
	// 그럼 id 선언된 곳에 js 에서 작성한 값이 들어간다는 거지?
	// document 는 뭘 가리키는 걸까?
	// 
	document.getElementById("list2").innerHTML = text2;

}

function cancel() {

	document.getelegetElementById("list").innerHTML = "";
	document.getelegetElementById("list1").innerHTML = "";
	document.getelegetElementById("list2").innerHTML = "";
}


function start3() {

	// 기존 리스트를 가져오기
	var text = document.getElementById("list").innerHTML;
	var product = "banana";
	text += "<li>" + product + "</li>";
	document.getElementById("list").innerHTML = text;

}

function start4(num1, num2) {

	var total = num1 * num2
	document.getElementById("result").textContent = total;


}