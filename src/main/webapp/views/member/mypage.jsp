<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		section {
			width:800px;
			min-height:500px;
			margin:auto;
			margin-top:50px;
		}
		.commute_btn {
			width:800px;
			height:30px;
			text-align:right;
		}
		.commute_btn button {
			width:100px;
			height:30px;
			font-size:15px;
			font-weight:600;
		}
		.member_info,
		.commute_info {
			width:800px;
			margin:auto;
			margin-bottom:50px;
			border-collapse:collapse;
		}
		.memo_info {
			width:800px;
			margin:auto;
			margin-bottom:10px;
			border-collapse:collapse;
		}
		#receive,
		#send {
			width:350px;
			margin:auto;
			margin-bottom:10px;
			border:1px solid black;
			background:white;
			position:absolute;
			top:30%;
			left:50%;
			translate:-50% -50%;
			visibility:hidden;
		}
		#receive table,
		#send table {
			border-collapse:collapse;
		}
		#receive th,
		#send th {
			font-size:14px;
		}
		#receive th:last-child,
		#send th:last-child {
			text-align:right;
		}
		#send tr:nth-child(2n),
		#receive tr:nth-child(2n) {
			background:#eeeeee;
		}
		#receive td:first-child,
		#send td:first-child {
			width:150px;
			text-align:left;
			padding-left:5px;
			font-size:14px;
		}
		#receive td:nth-child(2),
		#send td:nth-child(2) {
			width:100px;
			text-align:center;
			font-size:14px;
		}
		#receive td:last-child,
		#send td:last-child {
			width:100px;
			text-align:center;
			font-size:14px;
		}
		.member_info td,
		.commute_info td {
			border:1px solid black;
			height:23px;
		}
		.member_info tr td:nth-child(2n-1),
		.commute_info tr td:nth-child(2n-1) {
			width:100px;
			text-indent:5px;
		}
		.member_info tr td:nth-child(2n),
		.commute_info tr td:nth-child(2n) {
			width:300px;
			text-indent:5px;
		}
		.memo_info th {
			font-size:14px;
			width:400px;
			height:26px;
			text-align:left;
			border-top:2px solid black;
			border-bottom:2px solid black;
		}
		.memo_info #text {
			font-size:12px;
			padding:0px;
		}
		.memo_info th:last-child {
			border-left:2px solid black;
		}
		#receiveView,
		#sendView {
			width:300px;
			height:190px;
			margin:auto;
			text-align:center;
			background:white;
			z-index:1; 
			position:absolute;
			visibility:hidden;
			top:50%;
			left:50%;
			translate:-50% -80%;
		}
		#receiveView table,
		#sendView table {
			border-collapse:collapse;
			border:1px solid black;
		}
		#receiveView textarea,
		#sendView textarea {
			width:290px;
			height:100px;
			border:none;
			resize:none;
			outline:none;
		}
		#receiveView tr:nth-child(3),
		#sendView tr:nth-child(3) {
			height:100px;
		}
		#receiveView tr:last-child td,
		#sendView tr:last-child td {
			text-align:center;
			border:none;
		}
		#receiveView td:first-child,
		#receiveView td:nth-child(2),
		#receiveView td:last-child,
		#sendView td:first-child,
		#sendView td:nth-child(2),
		#sendView td:last-child {
			width:100px;
			border-left:none;
			border-right:none;
			border-top:1px solid black;
			border-bottom:1px solid black;
		}
	</style>
	<script>
		function openit(){
			var x=(window.screen.width/2)-(400/2);
			var y=(window.screen.height/2)-(400/2);
			window.open("send","","width=400,height=230,left="+x+",top="+y);
		}
		function getSendMemo(){
			var chk=new XMLHttpRequest();
			chk.open("get", "getSendMemo");
			chk.send();
			chk.onload=function(){
				document.getElementById("send").style.visibility="visible";
				document.getElementById("receive").style.visibility="hidden";
				var data=JSON.parse(chk.responseText);
				var str="<table><tr><th>보낸쪽지함</th><th></th><th>"
					+"<button type='button' onclick='sclose()'>닫기</button></th></tr>"
					+"<tr><th>제목</th><th>받은사람</th><th>날짜</th></tr>";
				data.forEach(function(data){
					var click="onclick='sendView("+data.id+")'";
					var color="";
					if(data.state==1)
						var color="style='color:lightgrey'";
					str=str+"<tr><td "+color+" "+click+">"+data.title+"</td><td>"+data.name+"</td><td>"+data.date+"</td></tr>";
				});
				str=str+"</table>";
				document.getElementById("send").innerHTML=str;
			}
		}
		function getReceiveMemo(){
			var chk=new XMLHttpRequest();
			chk.open("get", "getReceiveMemo");
			chk.send();
			chk.onload=function(){
				document.getElementById("receive").style.visibility="visible";
				document.getElementById("send").style.visibility="hidden";
				var data=JSON.parse(chk.responseText);
				var str="<table><tr><th>받은쪽지함</th><th></th><th>"
								+"<button type='button' onclick='rclose()'>닫기</button></th></tr>"
								+"<tr><th>제목</th><th>보낸사람</th><th>날짜</th></tr>";
				data.forEach(function(data){
					var click="onclick='receiveView("+data.id+")'";
					var color="";
					if(data.state==1)
						var color="style='color:lightgrey'";
					str=str+"<tr><td "+color+" "+click+">"+data.title+"</td><td>"+data.name+"</td><td>"+data.date+"</td></tr>";
				});
				str=str+"</table>";
				document.getElementById("receive").innerHTML=str;
			}
		}
		function receiveView(id){
			var chk=new XMLHttpRequest();
			chk.open("get", "receiveView?id="+id);
			chk.send();
			chk.onload=function(){
				document.getElementById("receiveView").style.visibility="visible";
				var data=JSON.parse(chk.responseText);
				var str="<table><tr><td>From:"+data.name+"</td><td></td><td>"+data.date+"</td></tr>";
				str=str+"<tr><td colspan='3'>"+data.title+"</td></tr>";
				str=str+"<tr><td colspan='3'><textarea>"+data.content+"</textarea></td></tr></table>";
				str=str+"<input type='button' value='닫기' onclick='receiveHide()'>";
				document.getElementById("receiveView").innerHTML=str;
			}
		}
		function receiveHide(){
			document.getElementById("receiveView").style.visibility="hidden";
		}
		function sendView(id){
			var chk=new XMLHttpRequest();
			chk.open("get", "sendView?id="+id);
			chk.send();
			chk.onload=function(){
				document.getElementById("sendView").style.visibility="visible";
				var data=JSON.parse(chk.responseText);
				var str="<table><tr><td>To:"+data.name+"</td><td></td><td>"+data.date+"</td></tr>";
				str=str+"<tr><td colspan='3'>"+data.title+"</td></tr>";
				str=str+"<tr><td colspan='3'><textarea>"+data.content+"</textarea></td></tr></table>";
				str=str+"<input type='button' value='닫기' onclick='sendHide()'>";
				document.getElementById("sendView").innerHTML=str;
			}
		}
		function sendHide(){
			document.getElementById("sendView").style.visibility="hidden";
		}
		function rclose(){
			document.getElementById("receive").style.visibility="hidden";
		}
		function sclose(){
			document.getElementById("send").style.visibility="hidden";
		}
	</script>
</head>
<body>
	<section>
		<div class="commute_btn">
			<c:if test="${chk==1}">
				<button type="button" onclick="location='../member/towork'">출근</button>
			</c:if>
			<c:if test="${chk==2}">
				<button type="button" onclick="location='../member/tohome'">퇴근</button>
			</c:if>
			<c:if test="${chk==3}">
				수고!
			</c:if>
		</div>
		
		<table class="member_info">
			<caption><h3>회원정보</h3></caption>
			<tr>
				<td>부서</td>
				<td>${mvo.depart_name}</td>
				<td>사원번호</td>
				<td>${mvo.empId}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${mvo.name}</td>
				<td>연락처</td>
				<td>${mvo.phone}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="3">${mvo.address} ${mvo.address_etc}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${mvo.email}</td>
				<td>입사일</td>
				<td>${mvo.joining}</td>
			</tr>
		</table>
		
		<table class="commute_info">
			<caption><h3>출퇴근시간</h3></caption>
			<tr>
				<td>출근시간</td>
				<td>${cvo.towork}</td>
				<td>퇴근시간</td>
				<td>${cvo.tohome}</td>
			</tr>
		</table>
		
		<table class="memo_info">
			<caption><h3>쪽지함/<button type="button" id="text" onclick="openit()">쪽지쓰기</button></h3></caption>
			<tr>
				<th>
					<input type="button" value="받은쪽지" onclick="getReceiveMemo()">
					총 ${totalReceiveMemo}건 / 읽음 ${readReceiveMemo} / 안읽음 ${totalReceiveMemo-readReceiveMemo}
				</th>
				<th>
					<input type="button" value="보낸쪽지" onclick="getSendMemo()">
					총 ${totalSendMemo}건 / 읽음 ${readSendMemo} / 안읽음 ${totalSendMemo-readSendMemo}
				</th>
			</tr>
		</table>
		
		<div id="receive">
		</div>
		
		<div id="send">
		</div>

		<div id="receiveView">
		</div>
		
		<div id="sendView">
		</div>
		
	</section>
</body>
</html>