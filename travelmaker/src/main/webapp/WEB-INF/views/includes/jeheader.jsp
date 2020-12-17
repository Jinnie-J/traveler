<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <!-- 쿠키 -->
 <%
 
      String remember = "";
        String id = "";
        String loginBtn = "";
        String sessionBtn = "";
        String modifyBtn = "";
        String deleteBtn = "";
 		String mypage = "";
 		String registerBtn = "";
   // 쿠키 확인
      Cookie[] cookies = request.getCookies();
   if(cookies != null){
      for(int i=0; i < cookies.length; i++){
         if(cookies[i].getName().trim().equals("email")){
         // 쿠키가 있으면 아이디 표시
            id = cookies[i].getValue();
         // id기억하기 체크 표시
            remember = "checked='checked'";
         }
      }
   }
   // 로그인 되었다면, 로그아웃, 정보수정, 회원탈퇴 버튼이 보인다.
   if(session.getAttribute("email") != null){
      sessionBtn = "<a href='/member/logout'>로그아웃</a>";
      modifyBtn = "<a href='/member/viewMember?email="+session.getAttribute("email")+"\'\">정보수정</a>";
   	  mypage = "<a href='/mypage/pickPL'>마이페이지</a>";
   }
   else{
	  sessionBtn = "<a href='#' id='login_modal_btn'>로그인 </a>";
	  registerBtn = "<a href='#' id='register_modal_btn'>회원가입</a>";
   }
%>
<!DOCTYPE html>
<html lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Main</title>
<head>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>

.overlay {
  position: absolute;
  top: -40px;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100px;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: white;
}
.text {
   width:100%;
  color: black;
  font-size: 15px;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
}
.dailyscheduleDT a:hover .overlay {
  opacity: 1;
}
.contentAll {
   width: auto;
   background-color: #F5F5DC;
   border: 2px solid black;
   border-radius: 5px;
   padding: 20px;
}

.dayDt {
   padding: 7px;
   justify-content: flex-start;
   display: flex;
   margin-bottom: 75px;
   border-bottom: 1px solid gray;
}

.dailyscheduleDT a{
   position: relative;
}

.dailyscheduleDT{
   width: auto;
}

.plcImg {
   border: 4px solid #ffffff; /* Gray border */
   border-radius: 4px; /* Rounded border */
   width: 150px; /* Set a small width */
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.marker {
   margin-top: 20px;
   margin-bottom: 20px;
}

.dayDate {
   height: 300px;
   margin-bottom: 40px;
   display: flex;
}

.dango{
   background-color: white;
}
.dango img{
   width: 50px;
   height: 50px;
}


.directionAll {
   margin-top: 20px;
   margin-bottom: 20px;
   display: flex;
   align-items: center;
   justify-content: center;
}

.direction {
   width: 50px;
   height: 50px;
   flex-grow: 1;
   display: flex;
   align-items: center;
   justify-content: center;
   text-align: center;
   padding: auto;
}
.drirection p{
   margin: auto;
}

/* Right column */
.content-mypage {
   float: right;
   width: 65%;
   margin-right: 10%;
}

.modal_wrap {
   display: none;
   width: 70%;
   position: fixed;
   height: 500px;
   top: 50%;
   left: 15%;
   margin: -250px 0 0 0;
   background: #eee;
   z-index: 2;
}

.modal_close {
   width: 26px;
   height: 26px;
   position: absolute;
   top: -30px;
   right: 0;
}

.modal_close>a {
   display: block;
   width: 100%;
   height: 100%;
   background: url(https://img.icons8.com/metro/26/000000/close-window.png);
   text-indent: -9999px;
}

.black_bg {
   display: none;
   position: fixed;
   width: 100%;
   height: 100%;
    overflow: auto;
   background-color: rgba(0, 0, 0, 0.5);
   top: 0;
   left: 0;
   z-index: 1;
}

#map {
   width: 100%;
   height: 100%;
}


.map_wrap, .map_wrap * {
   margin: 0;
   padding: 0;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
   color: #000;
   text-decoration: none;
}

.map_wrap {
   position: relative;
   width: 100%;
   height: 500px;
}

#menu_wrap {
   position: absolute;
   top: 0;
   left: 0;
   bottom: 0;
   width: 250px;
   margin: 10px 0 30px 10px;
   padding: 5px;
   overflow-y: auto;
   background: rgba(255, 255, 255, 0.7);
   z-index: 1;
   font-size: 12px;
   border-radius: 10px;
}

.bg_white {
   background: #fff;
}


#menu_wrap hr {
   display: block;
   height: 1px;
   border: 0;
   border-top: 2px solid #5F5F5F;
   margin: 3px 0;
}

#menu_wrap .option p {
   margin: 10px 0;
}

#menu_wrap .option button {
   margin-left: 5px;
}

#placesList {
   padding-left: 0px;
}

#placesList li {
   list-style: none;
}

#placesList .item {
   position: relative;
   border-bottom: 1px solid #888;
   overflow: hidden;
   cursor: pointer;
   min-height: 65px;
}

#placesList .item span {
   display: block;
   margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

#placesList .item .info {
   padding: 10px 0 10px 55px;
}

#placesList .info .gray {
   color: #8a8a8a;
}

#placesList .info .jibun {
   padding-left: 26px;
}

#placesList .info .tel {
   color: #009900;
}

#placesList .item .markerbg {
   float: left;
   position: absolute;
   width: 36px;
   height: 37px;
   margin: 10px 0 0 10px;
   background:
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
      no-repeat;
}

#placesList .item .marker_1 {
   background-position: 0 -10px;
}

#placesList .item .marker_2 {
   background-position: 0 -56px;
}

#placesList .item .marker_3 {
   background-position: 0 -102px
}

#placesList .item .marker_4 {
   background-position: 0 -148px;
}

#placesList .item .marker_5 {
   background-position: 0 -194px;
}

#placesList .item .marker_6 {
   background-position: 0 -240px;
}

#placesList .item .marker_7 {
   background-position: 0 -286px;
}

#placesList .item .marker_8 {
   background-position: 0 -332px;
}

#placesList .item .marker_9 {
   background-position: 0 -378px;
}

#placesList .item .marker_10 {
   background-position: 0 -424px;
}

#placesList .item .marker_11 {
   background-position: 0 -470px;
}

#placesList .item .marker_12 {
   background-position: 0 -516px;
}

#placesList .item .marker_13 {
   background-position: 0 -562px;
}

#placesList .item .marker_14 {
   background-position: 0 -608px;
}

#placesList .item .marker_15 {
   background-position: 0 -654px;
}

/* 지은 스타일 */


/* 모달창 */
/* Important part */
.modal-content{
overflow-y: initial !important
}
.modal-body{
height: 550px;
overflow-y: auto;
}

#register_modal{
	display: none;
	width: 600px;
	height: 600px;
	padding: 10px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
	text-align : center;



}


#hiddenlist_modal, #schedulelist_modal{
	display: none;
	width: 450px;
	height: 90%;
	padding: 10px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
	text-align : center;
}


/* 닫는버튼 */
#hiddenlist_modal .modal_close_btn , #schedulelist_modal .modal_close_btn ,#register_modal .modal_close_btn {
	width: 20%;
	margin-right: 10%;
	background-color: white;
	color: black;
	border: none;
	border-radius: 5px;
	text-align : right;
}

/* 이미지 갤러리 */
div.gallery {
	flex-basis: 20%;
	justify-content: space-between;
	margin-right: 20px;
	margin-bottom: 30px;
	height: 290px;
	border: 1px solid gray;
	border-radius: 10px;
	padding: 10px;
	margin-bottom: 7px;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: 150px;
	object-fit: cover;
}

div.cardgallery img{
	width: 100%;
	height: 150px;
}
div.desc {
	padding: 15px;
	text-align: center;
	object-fit: cover;
	font-size: 15px;
}

* {
	box-sizing: border-box;
}

.responsive {
	padding: 10px 10px;
	float: left;
	width: 24.99999%;
}

@media only screen and (max-width: 700px) {
	.responsive {
		width: 49.99999%;
		margin: 6px 0;
	}
}

@media only screen and (max-width: 500px) {
	.responsive {
		width: 100%;
	}
}

.clearfix:after {
	content: "";
	display: table;
	clear: both;
}

a:link, a:visited {
	color: black;
	padding: 5px 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

a:hover, a:active {
	background-color: skyblue;
	color: white;
}

/* toggle */
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

/* .container {
	padding-right: 100px;
	padding-left: 100px;
	margin-right: auto;
	margin-left: auto;
}
 */
/* table a {
	text-decoration: none;
	color: #f9cf74 bold;
}

table a:hover {
	color: salmon;
}

.board {
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 0.9em;
	min-width: 1200px;
	border-radius: 5px 5px 0 0;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	width: 60%;
	margin: auto;
	text-align: center;
}

.board thead tr {
	background-color: #f9cf74;
	color: #ffffff;
	text-align: left;
	font-weight: bold;
}

.board th, .board td {
	padding: 12px 15px;
}

.board tbody tr {
	border-bottom: 1px solid #dddddd;
}

.board tbody tr:nth-of-type(even) {
	background-color: #f5f5f5;
}

.board tbody tr:last-of-type {
	border-bottom: 2px #f9cf74 solid;
}

.board tbody tr.active-row {
	font-weight: bold;
	color: #f9cf74;
}

body {
	padding: 0px;
	margin: 0px;
	font-family: san-serif;
} */

/* #Btn, #regBtn, #hiddenBtn {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
	border: 1px solid white;
	background-color: #f9cf74;
	color: white;
	padding: 5px;
}
 */
.orgImg {
	width: 100px;
	height: 100px;
}

.select_img img {
	margin: 20px 0;
}

/* 여기까지 지은 스타일 */

/*datepicker에서 사용한 이미지 버튼 style적용*/
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}

.modal_wrap {
	display: none;
	width: 70%;
	position: fixed;
	height: 500px;
	top: 50%;
	margin: -250px 0 0 0;
	background: #eee;
	z-index: 2;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}

.login_modal {
	display: none;
	width: 70%;
	position: fixed;
	height: 500px;
	top: 50%;
	margin: -250px 0 0 -250px;
	margin-left: 2%;
	background: #eee;
	z-index: 1;
}

.register_modal {
	display: none;
	width: 70%;
	position: fixed;
	height: 500px;
	top: 50%;
	margin: -250px 0 0 -250px;
	margin-left: 2%;
	background: #eee;
	z-index: 1;
}

.black_bg {
	display: none;
	position: absolute;
	width: 100%;
	height: 104%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.lModal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.lModal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}

.rModal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.rModal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}

#map {
	width: 100%;
	height: 100%;
}

.card-img-top {
	width: 100%;
	height: 60%;
}

.card-title {
	display: block;
}

.card-text {
	display: flex;
}

.h-100 {
	border: 1px solid gray;
	border-radius: 10px;
	padding: 10px;
	margin-bottom: 7px;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList {
	padding-left: 0px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -424px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

body {
	padding: 0px;
	margin: 0px;
	font-family: san-serif;
}

.orgImg {
	width: 100px;
	height: 100px;
}

.select_img img {
	margin: 20px 0;
}

#button { /*로그인 버튼*/
	width: 260px;
	height: 50px;
	text-align: center;
	background-color: orange;
	color: white;
	border: 1px solid #4e266d;
}

.wrap-main {
	padding: 10px;
}

.center {
	text-align: center;
	padding: 4px;
}

.wrap-Addition { /* email기억하기 & 로그인 */
	text-align: center;
	padding: 5px;
}

.findInfo { /* 비밀번호 찾기 */
	text-align: center;
}

.div-reg {
	padding: 8px;
}

.btn { /* 닉네임 중복체크 버튼 */
	width: 140px;
	height: 35px;
	text-align: center;
	background-color: orange;
	color: white;
	border: 1px solid #4e266d;
}

/* dropdown  */
.dropbtn {
	width: 30px;
	height: 3px;
	background-color: black;
	margin: 6px 0;
	font-size: 16px;
	border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	margin-top: 10px;
	position: relative;
	display: inline-block;
	float: right;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	right: 0;
	background-color: #f9f9f9;
	min-width: 160px;
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: #f1f1f1
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}
</style>

</head>

<body>

   <!-- 네비게이션(nav) 컨트롤에 사요하는 드롭다운. -->
   <div style="margin: 20px;">
      <nav id="navbar-example" class="navbar navbar-default navbar-static">
         <div class="container-fluid">
            <!-- 네비게이션(nav)의 기본 설정으로 모바일일 때, 메뉴 버튼이 나온다. -->
            <div class="navbar-header">
               <button class="navbar-toggle collapsed" type="button"
                  data-toggle="collapse" data-target=".navbar-collapse">
                  <span class="sr-only">Toggle navigation</span> <span
                     class="icon-bar"></span> <span class="icon-bar"></span> <span
                     class="icon-bar"></span>
               </button>
               <!-- 타이틀임. -->
               <a class="navbar-brand" href="/main/index">여정</a>
               
            </div>
            <!-- 메뉴 설정 -->
            <div class="collapse navbar-collapse">
               <!-- 메뉴는 왼쪽으로 두개 설정 -->
               <ul class="nav navbar-nav">
                  <!-- 메뉴 이름은 Hello로 서브 옵션은 Test1과 Test2가 있다. -->

                  <!-- 메뉴 이름은 World로 서브 옵션은 Test3과 Test4가 있다. -->

               </ul>
                <!-- 메뉴를 오른쪽 정렬로 설정 가능 -->
          <ul class="nav navbar-nav navbar-right">
            <!-- 메뉴 이름은 Right!로 서브 옵션은 Test5와 Test6가 있다. -->
            <li>
            <a class="navbar-brand" href="/admin/boardList">관리자</a>
            <a class="navbar-brand" href="/board/list">게시판</a>
            
            <div class="dropdown">
  <div class="dropbtn"></div>
  <div class="dropbtn"></div>
  <div class="dropbtn"></div>
  <div class="dropdown-content">
  <%= sessionBtn %>
  <%= modifyBtn %>
  <%= mypage %>
  <%= registerBtn %>
  
  </div>
</div>
            
            </li>
          </ul> 
        </div>
      </div>
    </nav>
  </div>
<div class="container">
            <!-- 모달 클릭시 뒷 배경 -->
    <div class="black_bg"></div>
    
    <!-- Login Modal -->
    <div class="login_modal">
    <div class="w3-container w3-orange"> 
    <div class="lModal_close"><a href="#">close</a></div>
                 <p style="text-align: center; font-size: 30px">로그인</p>
            </div>
            <p style="padding-bottom: 20px"></p>
            
            <div class="wrap-main">
            
            <form action="/member/login" onsubmit="return loginCheck();" method="post">
               <div class="center">&nbsp;이메일&nbsp; <input type="text" style="width: 210px; height: 30px;" 
               placeholder="이메일" id="login_email" name="email" value="<%=id %>"></div>
               
               <div class="center">비밀번호 <input type="password" style="width: 210px; height: 30px;" 
               placeholder="비밀번호" id="login_pwd" name="pwd"></div>
               
               <div class="wrap-Addition"> <input type="checkbox" name="remember" <%=remember %>>   email 기억하기</div>
               <div class="wrap-Addition"> <button type="submit" id="button">로그인</button> </div>
            </form>
         
            </div>

            <div id="naverIdLogin" style="text-align:center;"><a href="${url}">
            <img src="/resources/img/naverLogin.PNG" style="height: 50px" width="260px"></a></div>
            <br>
            
            <div class="findInfo">
            
         <a onclick="moveRegisterPage()">회원가입</a>
         <span>|</span>
         <a href="/search/searchPwd">비밀번호 찾기</a>
            </div>
    </div>
   <!-- end Login Modal -->
   
   
   <!-- register Modal  -->
    <!-- Modal -->
    <div class="register_modal">
    <div id="register">
        <div class="modal-dialog w3-modal-content" style="width: 600px; height:400px; display: table;">
            <p style="text-align: center; font-size: 30px">회원가입</p>
         <div class="wrap-main" style="margin-left: 15px">
            <form action="/member/register" method="post">
                  <!-- 회원번호 -->
                  <!-- <div class="div-reg"><input type="text" name="memNo" placeholder="회원번호"></div> -->
                  
                  <!-- 이메일 -->
                  <div class="div-reg"><input type="email" name="email" id="email" placeholder="이메일주소">
                     <button class="btn" type="button" id="emailCheck">이메일 중복체크</button>
                  <span id="spanEmail"></span></div>
                  
                  <!-- 비밀번호 -->
                  <div class="div-reg"><input type="password" name="pwd" id="pwd" placeholder="비밀번호" onblur="pwdCheck()">
                     비밀번호는 숫자/영문자/특수문자를 모두 포함해야 합니다
                  <div class="div-reg"><span id="spanPwd"></span></div></div>
                  
                  <!-- 비밀번호 확인 -->
                   <div class="div-reg"><input type="password" name="pwdCfm" id="pwdCfm" placeholder="비밀번호 확인" onblur="pwdCheck()">
                     비밀번호 확인
                  <p><span id="spanPwdCfm"></span></p></div>
                     
                  
                  <!-- 닉네임 -->
                  <div class="div-reg"><input type="text" name="nickname" id="nickname" placeholder="닉네임">
                     <button class="btn" type="button" id="nicknameCheck">중복 체크</button>
                     닉네임은 2~8내로 입력해주세요
                  <div class="div-reg"><span id="spanNickname"></span></div></div>
                  
                  <!-- 생년월일 -->
                  <div class="div-reg"><input type="text" name="birth" id="birth" placeholder="누르면 달력이 나와요!"></div>
                  
                  <!-- 성별 -->
                  본인의 성별은 ?  
                     <input type="radio" name="gender" id="man_gender" value="M">남 
                     <input type="radio" name="gender" id="woman_gender" value="F">여
                     <p><span id="spanGender"></span></p>
                  
                  <!-- 상태(정상, 휴면 등...) -->
                  <p><input type="hidden" name="status" id="status" value="정상"></p>
                  
                  <!-- 등급?(일반회원, 관계자 등..) -->
                  <p><input type="hidden" name="memGrade" id="mem_grade" value="일반회원"><p>
                  
               <div class="wrap-Addition"><button type="submit" id="button" onclick="return registerValidCheck();">가입하기</button></div>
            </form>
            </div>
      </div>
   </div>
        <!-- 닫기버 버튼 -->
        <div class="rModal_close"><a href="#">close</a></div>
    </div>
    <script type="text/javascript">
    
    //모달보고 닫는 이벤트 추가
    document.getElementById('login_modal_btn').addEventListener('click', lModalShow);
    document.querySelector('.lModal_close').addEventListener('click', lModalClose);
    document.getElementById('register_modal_btn').addEventListener('click', rModalShow);
    document.querySelector('.rModal_close').addEventListener('click', rModalClose);

    
    //모달 보여지는 메서드
    function lModalShow() {
        document.querySelector('.login_modal').style.display = 'block';
        document.querySelector('.black_bg').style.display = 'block';
    };
    //모달 보여지는 메서드
    function rModalShow() {
        document.querySelector('.register_modal').style.display = 'block';
        document.querySelector('.black_bg').style.display = 'block';
    };
    
    //모달 사라지는 메서드
    function lModalClose() {
        document.querySelector('.login_modal').style.display = 'none';
        document.querySelector('.black_bg').style.display = 'none';
    }
    //모달 사라지는 메서드
    function rModalClose() {
        document.querySelector('.register_modal').style.display = 'none';
        document.querySelector('.black_bg').style.display = 'none';
    }
    
    // 로그인창에서 회원가입 누르면 실행
    function moveRegisterPage(){
 	   lModalClose();
 	   rModalShow();
    }; // end moveRegisterPage()
    
    
    /* 회원가입 */
    
 // email 중복체크 버튼 누르면 실행
    $("#emailCheck").click(function() { 
        
       let myEmail = $("#email").val();    // 이메일
       let jEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일정규식

         // 이메일 입력
          if(myEmail.length == 0){
             document.getElementById("spanEmail").innerHTML = "이메일을 입력해주세요";
             spanEmail.style.color='red';
          	return;
       }else{
          document.getElementById("spanEmail").innerHTML = "";
       }
        
        // 이메일 정규식
         if(false === jEmail.test(myEmail)) {     
            document.getElementById("spanEmail").innerHTML = "이메일 형식이 잘못되었습니다";
                spanEmail.style.color='red';
                
             return;  
         }else{
             document.getElementById("spanEmail").innerHTML = "사용할 수 있는 이메일입니다.";
          }       
        
       let email = $("#email").val();
       let sendDate = {'email' : email}

       $.ajax({
          /* async : true, */
          type : 'POST',
          data : sendDate,
          url : "/member/emailCheck",
           success : function(data) { // 성공하면 여기로 넘어옴
              if (data > 0) {
                document.getElementById("spanEmail").innerHTML = "이메일이 중복됩니다.";
                spanEmail.style.color = 'red';
             } else {
                document.getElementById("spanEmail").innerHTML = "사용할 수 있는 이메일입니다.";
                spanEmail.style.color = 'blue';
             }
           }
       });
       
 });
    
 // 닉네임 중복체크 버튼 누르면 실행
    $("#nicknameCheck").click(function() { 
        
       let myNickname = $("#nickname").val();    // 닉네임
       let jNname = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/; // 닉네임은 문자 제한없이 2~8자리

         // 닉네임 입력
          if(myNickname.length == 0){
             document.getElementById("spanNickname").innerHTML = "닉네임을 입력해주세요";
             spanNickname.style.color='red';
          	return;
       }else{
          document.getElementById("spanNickname").innerHTML = "";
       }
        
        // 닉네임 정규식
         if(false === jNname.test(myNickname)) {     
            document.getElementById("spanNickname").innerHTML = "닉네임은 한글/영문/숫자로 2~8자리 부탁드립니다";
            spanNickname.style.color='red';
             return;  
         }else{
             document.getElementById("spanNickname").innerHTML = "사용할 수 있는 닉네임입니다.";
          }       
        
        
       let nickname = $("#nickname").val();
       let sendDate = {'nickname' : nickname}

       $.ajax({
          /* async : true, */
          type : 'POST',
          data : sendDate,
          url : "/member/nicknameDuplCheck",
           success : function(data) { // 성공하면 여기로 넘어옴
              if (data > 0) {
                document.getElementById("spanNickname").innerHTML = "닉네임이 중복됩니다.";
                spanNickname.style.color = 'red';
             } else {
                document.getElementById("spanNickname").innerHTML = "사용할 수 있는 닉네임입니다.";
                spanNickname.style.color = 'blue';
             }
           }
       });
       
 });


    // 회원가입 유효성체크
 function registerValidCheck() {
    
     // 정규식
     // jEamil = local@앞에 3글자 이상 
	 let jEmail = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
     let jPwd = /^(?=.*?[a-zA-Z])(?=.*?[#?!@$%^&*-]).{8,}$/; // 숫자/대문자/소문자/특수문자 1개씩은 포함해서 8자리
     let jNname = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/; // 닉네임은 문자 제한없이 2~8자리

    // 스크립트 태그 변수
    let myEmail = $("#email").val();    // 이메일
    let myPwd = $("#pwd").val();       // 비밀번호
    let myPwdCfm = $("#pwdCfm").val();  // 비밀번호 확인
    let myNickname = $("#nickname").val(); // 닉네임
    let myBirth = $("#birth").val();    // 생년월일
    
    // 이메일 입력
    if(myEmail.length == 0){
       alert("이메일 입력 후, 중복체크를 눌러주세요");
        $("#email").focus();
        return false;
    }
    
    // 이메일 정규식
     if(false === jEmail.test(myEmail)) {     
        alert('이메일 형식이 잘못되었습니다. @앞에 3글자 이상은 넣으셨나요?');
          return false;         
     }                            
    
     // 패스워드 입력
    if(myPwd.length == 0){
        alert("비밀번호를 입력해 주세요"); 
        $("#pwd").focus();
        return false;
    }
     
    // 비밀번호 정규식
    if(false === jPwd.test(myPwd)) {     
		alert('비밀번호는 8자리 이상이며, 영문/숫자/특수문자를 포함해야합니다.');
		$("#pwd").focus();
        return false;         
    }   
     
     // 패스워드 확인
     if(myPwd != myPwdCfm){
        alert("비밀번호가 일치하지 않습니다.");
        $("#pwdCfm").focus();
        return false;
     }
     
     // 비밀번호에 공백 포함 X
     if(myPwd.search(/\s/) != -1){
          alert("비밀번호는 공백 없이 입력해주세요.");
          return false;
     }

    // 닉네임 입력
    if(myNickname.length == 0){
       alert("닉네임을 입력해주세요");
       $("#nickname").focus();
       return false;
    }
    
    // 닉네임은 2~8자리까지만
    if(!(myNickname.length >= 2 && myNickname.length <= 8)){
	   	alert("닉네임을 입력해주세요 2~8글자여야 합니다!");
	   	$("#nickname").focus();
	   	return false;
   }
    
    // 닉네임은 영문/한글/숫자만!!
    if(false === jNname.test(myNickname)){
       alert("닉네임은 영문/한글/숫자만 허용됩니다!!");
       $("#nickname").focus();
       return false;
    }
    
     // 생년월일 입력
    if(myBirth.length == 0){
       alert("생년월일을 입력해주세요");
       $("#birth").focus();
       return false;
    }

     // 성별 선택
    if($("input[name=gender]:radio:checked").length < 1){
       alert("성별을 선택해주세요.");
       return false;
    }
    
    // 필수입력 완료했으니까 회원가입 성공!
    
        return true;
    
 } // end registerValidCheck()

 //   비밀번호 커서 처리(blur)
 function pwdCheck() {

    let jPwd = /^(?=.*?[a-zA-Z])(?=.*?[#?!@$%^&*-]).{8,}$/; // 숫자/대문자/소문자/특수문자 1개씩은 포함해서 8자리
    
    let myPwd = $("#pwd").val();       // 비밀번호
    let myPwdCfm = $("#pwdCfm").val();    // 비밀번호 확인
    
    // 숫자/대문자/소문자/특수문자 1개씩은 포함해서 8자리(공백 당연히 안됨!)
    if(false === jPwd.test(myPwd) || myPwd.search(/\s/) != -1) {
       document.getElementById("spanPwdCfm").innerHTML = "비밀번호는 8자리 이상이며, 영문/숫자/특수문자를 포함해야합니다. 공백없이!!";
         spanPwdCfm.style.color='red';         
         return false;
    }else{
       document.getElementById("spanPwdCfm").innerHTML = "";
    }
    
 // 패스워드 확인
    if (myPwd != myPwdCfm) {
       document.getElementById("spanPwdCfm").innerHTML = "비밀번호가 서로 다릅니다.";
         spanPwdCfm.style.color='red';
         return false;
    }else{
       document.getElementById("spanPwdCfm").innerHTML = "";
    }
    
 }
 
 
	//회원가입시 생년월일 입력 받기
	 $("#birth").datepicker(
	       {
	          changeMonth : true,
	          changeYear : true,
	          maxDate : 0, // 오늘 날짜이후로 선택 못 함
	          minDate : '-80y', // 년 시작일
	          nextText : '다음 달',
	          prevText : '이전 달',
	          yearRange : 'c-80:c+20', // 년 시작~최대 범위
	          showButtonPanel : true,
	          currentText : '오늘 날짜',
	          closeText : '닫기',
	          dateFormat : "yy-mm-dd",
	          showAnim : "slide",
	          showMonthAfterYear : true,
	          dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
	          monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
	                '7월', '8월', '9월', '10월', '11월', '12월' ]
	       });


 //======================회원가입 끝============================================ 
 
	/* 로그인 */
	 
 // 로그인 모달 유효성 체크
 function loginCheck(){
    
    let loginEmail = $("#login_email").val();    // 이메일
    let loginPwd = $("#login_pwd").val();       // 비밀번호
    
    // 이메일 입력(로그인)
    if(loginEmail.length == 0){
       alert("이메일을 입력해주세요");
       $("#login_email").focus();
       return false;
    }
    
    // 비밀번호 입력(로그인)
    if(loginPwd.length == 0){
       alert("비밀번호를 입력해주세요");
       $("#login_pwd").focus();
       return false;
    }
 } // end loginCheck
 
 //======================로그인 끝========================================== 
    

    // 회원가입을 유도한다.. 안 됐다면 넘어갈 수 없음..
    function sessionCheck(){
    
    /* travel, 네이버 둘 다 로그인 안했으면 회원가입하세요... */
    if('<%=session.getAttribute("email") %>' == null){
       alert("travle 가족이 되셔야 이용 가능합니다\n회원가입 부탁드립니다.");
       document.getElementById('register').style.display='block';
       return false;
    };
       return true;
    };
     
       //rttr 창띄우기
        	$(function(){
        		
      		var responseMessage = '<c:out value="${msg}" />';
      		
      		if(responseMessage != ""){
      	    alert(responseMessage);
      	}
      		
      });  

</script>