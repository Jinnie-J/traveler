<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
   <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
   <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
   <link href="/resources/css/home.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script>
  var dnd = $.noConflict(true);
  </script>
  <title>여정 :: 개인 맞춤형 여행플래너</title>
  <style>

* {
	outline:0;
	font-family:Spoqa Han Sans Neo,sans-serif;
}
.submit-btn {
	background-color: #3b99fc;
    color: white;
    z-index: 10;
    position:absolute;
    right: 20px;
    top: 10px;
    width: 100px;
    height: 42px;
    text-align: center;
    border-radius: 3px;
    box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
}
.submit-btn:hover {
	background-color:#14609d;
}

#right-container > .modal_close_btn {
	width:42px;
	height:42px;
	top:10px;
	position:absolute;
	right:30px;
	z-index:110;
    text-align: center;
    border-radius: 3px;
    font-size:15px;
    box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
}
img {
	width:80px;
	height:80px;
}
.daily-place-list {
   list-style-type: none;
   margin: auto;
   width: 90%;
}

#map > button.make-button:hover {
	background-color:#14609d;
}

.daily-place-list li {
   margin: 0 3px 3px 3px;
   padding: 0.4em;
   width: auto;
   font-size: 15px;
}

.daily-place-list li span {
   position: absolute;
   margin-left: -1.3em;
}

.mainContainer {
   display: flex;
   height:100%;
}

.menu {
   flex-basis: 0;
   flex-grow: 1;
   height: 750px;
}

.left-menu {
   position:relative;
   height:100%;
   background-color:#ffffff;
   flex: 0 0 23%;
   margin : 0 0 10px;
   display: flex;
}

.left-date {
   background-color:#373737;
   flex: 0 0 25%;
   
}

.left-date ul {
   padding: 0;
}

.left-place-list {
	flex: 0 0 75%;
	overflow:auto;	
}
.container {
   flex: 57 57 57%;
}

.daily-place-all {
   border-style: groove;
   width: 200px;
}

ul {
   list-style: none;
   padding: 0;
}

#Allschedule {
   display: flex;
}

#showAll {
   display: none;
   width: 70%;
   height: 80%;
   padding: 20px 30px;
   background-color: #fefefe;
   border: 1px solid #888;
   border-radius: 3px;
}
#all-date {
	display: flex;
    flex-direction: column;
    flex: 0 0 30%;
    background-color: #373737;
}
#all-schedule {
	display: flex;
	flex-direction:column;
	overflow:auto;
	flex: 0 0 70%;
}
.daily-place-dt {
	width:90%;
    padding: 10px 0 0;
    text-align: center;
    font-weight:700;
    align-self:center;
}
#left-container {
	display:flex;
	flex:30 30 30%;
}

.daily-place-all {
	display:none;
	width:100%;
}

#show-schedule {
   display: none;
   overflow:auto;
   width: 96%;
   height: 96%;
   background-color: #fefefe;
   border-radius: 3px;
}

.in-container {
	flex:70 70 70%
}

#searchForm {
	display:flex;
    border-bottom: solid #a7a7a7 1px;
}
#searchForm > {
	display:inline;
}
.search-button:hover {
	 background-color:#373737ab;
}
#map > button.transit-btn-car:hover {
	background-color:#939393;
}
#map > button.transit-btn-transit:hover {
	background-color:#939393;
}

button {
	border:0;
	
}
button:hover {
	background-color:#939393;
}
button.add-button, button.detail-button,button.rec-add-button,button.delete-button,.modal_close_btn, button.search-button {
	width: 35px;
	height: 35px;
}
div.hoverable-place > img {
    grid-area:img;
    flex:0 0 20%;
}
div.hoverable-place > span {
	text-align: left;
    line-height: 1.2em;
    grid-area: text;
    overflow: none;
    width:150px;
}
div.hoverable-place > button.add-button {
    grid-area:btn1;
    width:40px;
	height:40px;
}
div.hoverable-place > button.detail-button {
    grid-area:btn2;
	width:40px;
	height:40px;
}
.hoverable-place {
	width:95%;
	height:6em;
	display: grid;
	grid-gap:1px;
  	grid-template-areas:
    'img text text text'
    'img . btn1 btn2';
	align-items:center;
	padding: 2.5%;
    border-bottom: solid #a7a7a7 1px;
    background: #fff;
}
.hoverable-place:hover {
	box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
	transition: all 0.2s ease-in-out;
}

.pageNoWrap {
	display:flex;
}
.pageNoWrap > div ~ div {
	padding: 0 1px;
}
.right-paging-bar {
	justify-content: center;
	display:grid;
	grid-template-areas: 'btn1 num btn2';
	align-items: center;
}
.right-paging-bar > button.prev-btn {
	width:15px;
	height:15px;
	grid-area:btn1;
}
.right-paging-bar > div {
	grid-area:num;
}
.right-paging-bar > button.next-btn {
	width:15px;
	height:15px;
	grid-area:btn2;
}
.left-date-list>button {
	border:1px #263846 solid;
	box-sizing:border-box;
	background-color:#373737;
	width:100%;
	color:white;
	height:9%;
}
.left-date-list {
	height:100%;
}
.left-date-list>button:hover {
	background-color:#90a4ae38;
}

.selected-place {
	display:flex;
	width:100%;
	padding: 10px 0px;
	cursor:move;
	border-bottom:solid #a7a7a7 1px;
	align-items:center;
	justify-content:space-between;
}
.selected-place > span {
	flex: 0 0 36%;
	padding:0 2%;
}
#left-place-list > div > ul > div > div > img {
	flex: 0 0 40%;
}
#left-date-list > button.daily-place-btn.active{
	background-color:#3b99fc;
}

#rec-place {
	overflow:auto;
	background-color:#203341;
	color:white;
	z-index: 10;
	display:none;
	position:absolute;
	top: 70px;
    left: 50px;
    flex-direction:column;
    height: max-content;
    max-height: 50%;
    border-radius:5px;
}
.rec-place {
	display: flex;
	padding:10px 10px 0;
    justify-content: space-between;
    align-items: center;
}
.rec-place:last-child {
	padding:10px 10px 10px;
}


#map>.btn-rec-place {
	z-index:10;
	position:absolute;
	width:100px;
	height:42px;
	top:10px;
	text-align: center;
	left:20px;
	border-radius: 3px;
    box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
}

#map>.transit-btn-transit{
	z-index:10;
	position:absolute;
	right: 120px;
	bottom:10px;
	width:100px;
	height:42px;
	text-align: center;
	border-radius: 3px;
    box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
}
#map>.transit-btn-car {
	z-index:10;
	position:absolute;
	right:20px;
	bottom:10px;
	width:100px;
	height:42px;
	text-align: center;
	border-radius: 3px;
    box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
}
#map>.make-button {
	background-color:#3b99fc;
	color:white;
	z-index:10;
	position:absolute;
	right:20px;
	top:10px;
	width:100px;
	height:42px;
	text-align: center;
	border-radius: 3px;
    box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
}

#map>.insert-button {
	z-index:10;
	position:absolute;
	right:20rem;
	top:10px;
	width:100px;
	height:42px;
	padding:0;
	text-align: center;
}

body > div.mainContainer > div.right.menu {
	overflow:auto;
	flex:0 0 20%;
	flex-direction:column;
	height:100%;
	display:flex;
}
.data-range-picker {
	text-align: center;
	border:0;
	padding:10px 10px;
	font-size:16px;
	width:100%;
}
#show > button {
	background-color: #373737;
    color: #d3d3d3;
    font-weight: 400;
    font-size: 22px;
    width:40px;
    height:40px;
}
#hide {
	background-color: #373737;
    color: #d3d3d3;
    font-weight: 400;
    font-size: 22px;
    top: 200px;
    right: -40px;
    position:absolute;
    z-index: 2;
    width: 40px;
    height: 40px;
    vertical-align:middle;
}
#show {
	display:none;
    z-index: 1000;
    top: 200px;
    position: absolute;
    width: 40px;
    height: 40px;
    left: 0px;
}

.date-wrapper {
	text-align:center;
	size:20px;
	width:100%;
}
#left-place-list > div > div {
	background-color:#707070;
	padding: 10px 20px;
	text-align:center;
}

#left-place-list > div > div > span:nth-child(1) {
	color:white;
	padding-right:10px;
}

#left-place-list > div > div > span:nth-child(2) {
	color:#999999;
	padding-right:10px;
}
#left-place-list > div > div > span:nth-child(3) {
	color:white;
}
.search-button {
	flex:0 0 13%;
 	background-color:#373737;
}
#search-value {
	flex:0 0 87%;
}
#left-place-list > div > ul > div > button {
	flex:0 0 20%;
}
#left-date-list > button.showAllBtn.active{
	background-color:#3b99fc;
}
.place-perday-list {
	display: flex;
	padding: 10px 0px;
    cursor: move;
    border-bottom: solid #a7a7a7 1px;
	/* display:grid;
    grid-template-areas: 'img text btn'
    					 'memo memo memo'; */
    justify-content:space-between;
	align-items:center;
	position:relative;
}
#all-schedule > div > ul > div > button {
	width:100%;
	height:1.5em;
	background-color:#90a4ae;
	color:white;
	grid-area:btn;
}

#all-schedule > ul > div > img {
	grid-area:img;
}
#all-schedule > ul > div > span {
	grid-area:text;
	flex: 4 4 50%;
	font-weight:400;
	line-height:1.2em;
}
/* #all-schedule > ul > div > button:hover {
} */
#all-schedule > div > ul > div > button:hover {
	background-color:#52a9ef;
}
.outplcdt-wrap-div {
	padding-top:10px;
    text-align: center;
}

#all-schedule > div > ul > div {
	box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.3);
    margin: 10px;
}

.plcdt-wrap-div > span {
	font-weight: 600;
	color: #2196f3;
}
{
	box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.3);
}

#all-schedule > div > span {
	margin-top:10px;
	font-weight:700;
}

.dotOverlay {
	position:relative;
	bottom:10px;
	text-align:center;
	border-radius:6px;
	border: 1px solid #ccc;
	border-bottom:2px solid #ddd;
	font-size:12px;
	padding:5px;
	background:#fff;
}
.dotOverlay:nth-of-type(n) {
	border:0; box-shadow:0px 1px 2px #888;
}    
.number {
	font-weight:bold;color:#008eff;
}
.dotOverlay:after {
		content:'';
		position:absolute;
		margin-left:-6px;
		left:50%;
		bottom:-8px;
		width:11px;
		height:8px;
		background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png');
	}
.placeInfo {
	position:relative;top:5px;left:5px;list-style:none;margin:0;
}
.placeInfo .label {
	margin-top:2px;display:inline-block;width:100%;
}
.placeInfo:after {
	content:none;
}

/*지은수정 */
#registerForm {
   display: none;
   width: 20%;
   height: 50%;
   padding: 20px 70px;
   background-color: #fefefe;
   border: 1px solid #888;
   border-radius: 3px;
}

#registerForm h1{
    margin: 20px 0;
    font-size:30px;
    text-align: center;
}

.form-group input {
    width: 100%;
    margin: 10px 0;
    padding: 7px 10px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 3px;
}

.form-group textarea {
    width: 100%;
    height: 30%;
    margin: 10px 0;
    padding: 5px 10px;
    font-size: 16px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 3px;
}

.form-group label {
    font-weight: bold;
    font-size: 15px;
}

.modal_close_btn{
   background-color: white;
   color: black;
   border: none;
   border-radius: 5px;
   position: absolute;
    right: 20px;
   font-size: 25px;
}

.savebtn{
   position: absolute;
   bottom:15px;
   right:80px;
   width:80px;
   font-size:15px;
   background-color:white;
   border: 1px solid gray;
   border-radius: 14px;
   text-decoration: none;
}

.savebtn:hover{
   background-color: #203341;
      color:white;
   
}
/*지은 수정 끝 */
::-webkit-scrollbar {
  width: 8px;
  height: 8px;
  background: #ffffff;
}
::-webkit-scrollbar-thumb {
  border-radius: 3.5px;
  background-color: #ced4da;

  :hover {
    background-color: #adb5bd;
  }
}
::-webkit-scrollbar-track {
  background: #ffffff;
}
  /* daterangepicker 디자인 수정 */
.opensright{
	white-space:nowrap;
}
.daterangepicker .calendar-table table{
	border-collapse: inherit;
	font-size:12px;
	text-align:center;
}
.daterangepicker .calendar-table th, .daterangepicker .calendar-table td{
	font-size:13px;
}
.daterangepicker td.active, .daterangepicker td.active:hover {
    background-color: #3b99fc;
    border-color: transparent;
    color: #fff;
}
.daterangepicker .calendar-table {
	padding: 10px;
	}
	
.table-condensed{
	border-spacing:10px;
}
.daterangepicker .drp-buttons .btn {
	margin-left: 8px;
    font-size: 12px;
    font-weight: bold;
    padding: 4px 8px;
    width: 60px;
    height: 40px;
    border-radius:5px;
    background-color:#3b99fc;
	color:white;    
}
/* daterangepicker 디자인 끝 */

/* alert */
.swal2-button, .swal-button--confrim{
   background-color: #3b99fc;
}
.swal2-button:not([disabled]):hover{background-color:#3b99fc}.swal2-button:active{background-color:#70bce0}

.swal2-confirm.swal2-styled {
	background-color: #3b99fc;
}
/* alert */

  </style>
</head>
<body>
   <!-- /.panel-heading -->
   <!-- 일정생성 모달 -->
    <div id="show-schedule">
      	  <div id="left-container">
			  <div id="all-date"></div>
			  <div id="all-schedule"></div>
		  </div>
		  <div class="in-container">
			  <div id="in-mapWrapper" style="width:100%;height:100%">
			  	<div id="in-map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
			  </div>
		  </div> 
		  <div id="right-container"><button class="modal_close_btn">X</button></div>
      	<button class="submit-btn" style="position: absolute;right:80px;z-index:110;">저장</button>
      </div>    
      <!-- 일정등록 inner 모달 -->
     <div id="registerForm">
               <div>
               <button class="modal_close_btn">X</button></div>
               <h1>일정 저장</h1><br>
               <div class="form-group">
               일정명을 입력하세요<br>
               <input type="text" class="title-box" required />      
               </div>
               
               <div class="form-group">
               내용을 입력하세요<br>
               <textarea class="content-box" required></textarea>
                  </div>
               <button class="savebtn" onclick="insertSchedule()" >저장</button>
            </div>
      <!-- start place List -->
<div class="mainContainer">
      <div class="left-menu">
      	<button id="hide"><</button>
      <div class="left-date">
      
      <ul class="left-date-list" id="left-date-list">
      <!-- 일자별 모든 버튼을 출력하는 리스트 -->
      </ul> 
      
      </div>
      
      <div class="left-place-list">
      <div class="date-wrapper">
            <input type="text" name="daterange" class="data-range-picker" data-region-no='<c:out value="${schDto.schRegion}" />' data-init-todate='<c:out value="${schDto.toDate}" />' data-init-fromdate='<c:out value="${schDto.fromDate}" />' />
      </div>
      <div class="left-place-list" id="left-place-list">
     <!-- 일자별 모든 장소를 출력하는 리스트 -->
      </div>
   </div>
   </div>
   <!-- end place list -->
<!-- 맵 시작 -->
<div class="container">
     <div id="mapWrapper">
        <div id="map" style="width:100%;height:100% position:relative;">
	         <div class="left clearfix" id="rec-place">
	         <c:forEach items="${places}" var="list">
	         <div class="rec-place" data-title="${list.plcTitle}" data-plc-no="${list.plcNo}" data-lat="${list.lat }" data-lng="${list.lng}" data-opening-h="${list.openingH }" data-holiday="${list.holiday}" data-address-dt="${list.addressDt}" data-region-no="${list.regionNo}">
	                  <div class="img-wrap-div" style="overflow: hidden;backface-visibility: hidden;transform: translateZ(0);">
	                  <img style="border-radius:4px;" src='<c:out value="${list.plcImg}" ></c:out>'>
	                  </div>
	                  <span><c:out value="${list.plcTitle}"></c:out></span>
	                  <button class="rec-add-button" type="button">
	                  <i class="fas fa-plus"></i>
	                  </button>
	            </div>
	            </c:forEach>
	         </div>
        <button class="btn-rec-place">추천 장소</button>
        <button type='button' class="transit-btn-car">차</button>
		<button type='button' class="transit-btn-transit">대중교통</button>
		<button class="make-button" onclick="initSch()">일정 만들기</button>
		<div id="show"><button>></button></div>
        </div> <!-- 지도를 표시할 div 입니다 -->
    </div>
</div>
<!-- 맵 끗 -->
<div class="right menu">
      <!-- 검색 창의 시작  -->
      <form name="searchForm" id="searchForm" style="width:100%;">
            <input type="text" style="border:0;margin-left:2px" placeholder="검색어를 입력해주세요" id="search-value"/><br>
            <button class="search-button" type="button">
            <i class="fas fa-search" style="color:#ffffff"></i>
         </button>
      </form>
      <!-- 검색 창의 끝 -->
   <!-- /.panel-heading -->
   <div class="panel-body">
      <!-- start place List -->
      <ul class="right-place-list">
      </ul>
   </div>
   <!-- end place list -->
   
    <div class="right-paging-bar"></div>
    
</div>
</div>
   <script type="text/javascript" src="/resources/js/place.js"></script>
   <script type="text/javascript"
         src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9eb973825ac1960ebb20d660fdf86341&libraries=services"></script>
   
   <script type="text/javascript">
   
      var markers =[];
      var marker;
      var overlay;
      var posArrSet = [];
      var markArr = [];
      var polyArr = [];
	  var distArr = [];
      var resultset = [];
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
             center : new kakao.maps.LatLng(33.529252,126.589699), // 지도의 중심좌표
             level : 8
          // 지도의 확대 레벨
          };
      
         var map = new kakao.maps.Map(mapContainer,
                   mapOption); // 지도를 생성합니다
                   mapContainer.style.width = '100%';
                   mapContainer.style.height = '100%';
                   map.relayout();
      
      function hide() {
    	  dnd(".left-menu").hide();
          document.querySelector('#show').style.display = 'block';
          map.relayout();
      }              
      function show() {
                	   dnd(".left-menu").show();
                       document.querySelector('#show').style.display = 'none';
                       map.relayout();   
      }
                 //전체보기
      function showAll() {
          let zIndex = 9999;
          let modal = document.getElementById('showAll');
          let listAll = document.getElementById('Allschedule');
          let dpList = document.getElementsByClassName('daily-place-list');
          
          for (let i = 0; i < dpList.length; i++) {
             
            let objs = document.createElement('ul');
            objs.setAttribute('class','daily-place-all');
            objs.style.display = 'inline';
             objs.innerText="DAY"+(1+i);
             listAll.appendChild(objs);

             for (let j = 0; j < dpList[i].getElementsByTagName('li').length; j++) {
             let daliyplace = document.createElement('li');
             daliyplace.setAttribute('class','daily-all-place');
             daliyplace.innerText = dpList[i].getElementsByTagName('li')[j].dataset['title'];
             
             objs.appendChild(daliyplace);
         }
       }
          
          // 모달 div 뒤에 희끄무레한 레이어
          let bg = document.createElement('div');
          bg.setStyle({
              position: 'fixed',
              zIndex: zIndex,
              left: '0px',
              top: '0px',
              width: '100%',
              height: '100%',
              overflow: 'auto',
              backgroundColor: 'rgba(0,0,0,0.4)'
          });
          document.body.append(bg);

          modal.querySelector('.modal_close_btn').addEventListener('click', function() {
              bg.remove();
                  modal.style.display = 'none';
         $("#Allschedule").empty();
          });

          modal.setStyle({
              position: 'fixed',
              display: 'block',
              boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

              zIndex: zIndex + 1,
              
              top: '50%',
              left: '50%',
              transform: 'translate(-50%, -50%)',
              msTransform: 'translate(-50%, -50%)',
              webkitTransform: 'translate(-50%, -50%)'
          });
      };

      // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
      Element.prototype.setStyle = function(styles) {
          for (var k in styles) this.style[k] = styles[k];
          return this;
      };         
                   
      $(document).ready(function(){ // document ready, datepicker의 초기값과 이벤트 등록 전담
         
         let datePicker = document.getElementsByClassName("data-range-picker")[0];
         let fromDate = datePicker.dataset["initFromdate"];
         let toDate = datePicker.dataset["initTodate"];
         
         $('input[name="daterange"]').daterangepicker({
            startDate: fromDate,
            endDate: toDate, 
            minDate: moment(),
            maxSpan: {
                "days": 9 // 9일이어야 1일차부터 10일차까지 가능
            },
            locale: { 
               format: 'YYYY-MM-DD'
            }
           }, function(start, end, label) {
             // console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD')); 
           });
         
         $('input[name="daterange"]').on('apply.daterangepicker', (e, picker) => {
            computeDate(); 
            }); 
         
         init();
      })
      
      
      function init() { //이벤트 등록 전담용 initial
          computeDate();
       //모달보는 버튼에 이벤트 추가
         document.querySelector('.transit-btn-car').addEventListener('click', ()=>{
        	 sessionStorage.setItem("transit","car");     
        	 Swal.fire({icon: 'success', text: "차로 변경되었습니다."});
        	 
         });
         document.querySelector('.transit-btn-transit').addEventListener('click', ()=>{
        	 sessionStorage.setItem("transit","traffic"); 
        	 Swal.fire({icon: 'success',text: "대중교통으로 변경되었습니다."});
         });
         document.querySelector('.submit-btn').addEventListener('click', register); 
         
         document.querySelector('.search-button').addEventListener('click', searchAction);
         document.querySelector('.btn-rec-place').addEventListener('click', ()=>{ // 추천장소 버튼을 누르면 장소들 등장, button을 추가할지 말진 모르겠다.
                 let recPlace = document.querySelector('#rec-place')
                    if(recPlace.style.display=='' || recPlace.style.display==='none' ){
                        dnd('#rec-place').slideDown("fast");
                        }
                    else {
                    	dnd('#rec-place').slideUp("fast");
                     }
         });
         
         $("#hide").click(hide)
         $("#show").click(show);
         
         document.querySelector('.daily-place-list').style.display ='block';
         let recPlaceBtn = document.getElementsByClassName("rec-add-button");
         for (var i = 0; i < recPlaceBtn.length; i++) {
            recPlaceBtn[i].addEventListener('click', (event) => {
                let index = getActiveDay();
                let leftPlaceList = document.getElementsByClassName("daily-place-list");
                let activePlaceList = leftPlaceList[index];
                let compPlaceList = activePlaceList.children
                if(compPlaceList.length>5) { //span wrap div
                	Swal.fire({icon: 'error',text:"하루에 장소는 6개까지만 가능합니다."});
               	 return;
                }
                let currTarget = event.currentTarget.parentElement;
                let span = document.createElement("span");
                let targetText = currTarget.innerText;
                let curClone = currTarget.cloneNode(true);
                curClone.setAttribute("class", "selected-place");
                   for (let i = 0; i < compPlaceList.length; i++) {
                      if(curClone.dataset["plcNo"]==compPlaceList[i].dataset["plcNo"]){
                         return;
                      }               
                   }
                let child = curClone.children;
                child[2].remove()
                let btnobj1 = document.createElement("button");
                btnobj1.setAttribute('class', 'delete-button');
                let iconobj1 = document.createElement("i");
                iconobj1.setAttribute('class', 'fas fa-times');
                btnobj1.addEventListener('click',deleteInLeft);
                btnobj1.appendChild(iconobj1);
                
                curClone.appendChild(btnobj1);
                activePlaceList.appendChild(curClone);
              });
         }
      }
             
       function computeDate() { // date picker apply 이벤트랑, 초기값 계산해서 button 생성하는 function
          let datePicker = document.getElementsByClassName("data-range-picker")[0];
          let dateList = datePicker.value.split(' - ');
          let fromDate = new Date(dateList[0]);
          let toDate = new Date(dateList[1]);
          let dateDiff = Math.ceil((toDate.getTime()-fromDate.getTime())/(1000*3600*24));
          const transDate = (date) => {
			 return date.toISOString().substring(5, 10).split('-').join('.')       	  
          }
          let totalDate = document.getElementById("left-date-list");
          let totalPlace = document.getElementById("left-place-list");
          totalDate.innerHTML = null;
          totalPlace.innerHTML = null; // 수정되면 초기화 작업
          
          let objs = document.createElement('button');
          objs.setAttribute('class', 'home-btn');
          objs.innerText="홈으로";
          objs.addEventListener('click', function(){
        	  location.href = "/main/index";
          })
          
          
          totalDate.appendChild(objs);
            
         for(let idx=0; idx<=dateDiff; idx++ ){
        	 var week = ['일','월','화','수','목','금','토']
	             let objs;
	             objs = document.createElement('button');
	             objs.setAttribute('class', 'daily-place-btn');
	             objs.innerText="DAY"+(idx+1);
	             objs.addEventListener('click',  (event) => {
                 let btnList = document.getElementsByClassName("daily-place-btn")
                 let currTarget = event.currentTarget;
                 let dailyPlaceList = document.querySelectorAll('.daily-wrap-div')
                 let arr = [...btnList];
                 let psuedoidx = arr.indexOf(currTarget);
                 // 토글 버튼 인덱스 추가 삭제 총괄
                 for (let i=0; i < btnList.length; i++) {
                    dailyPlaceList[i].style.display='none';
	             	btnList[i].classList.remove("active");
                 }
                 dailyPlaceList[psuedoidx].style.display='block';
	             btnList[psuedoidx].classList.add("active");
              });
	             totalDate.appendChild(objs);
	             let currDate = addDays(fromDate,idx);
	             let wdiv = document.createElement('div');
	             wdiv.setAttribute("class","daily-wrap-div");
	             wdiv.setAttribute('style','display:none');
	             
	             let div = document.createElement('div');
	             div.setAttribute("class","span-wrap-div");
				 let span1 = document.createElement('span');
	             let span2 = document.createElement('span');
	             let span3 = document.createElement('span');
	             span1.innerText = `DAY\${idx+1}`;
	             span2.innerText = "|";
	             span3.innerText = `\${transDate(currDate)}(\${week[currDate.getDay()]}요일)`;
	             
	             let liobjs = document.createElement('ul');
	             liobjs.setAttribute('class', 'daily-place-list');
	            
	             
	             div.appendChild(span1);
	             div.appendChild(span2);
	             div.appendChild(span3);
	             wdiv.appendChild(div);
	             wdiv.appendChild(liobjs);
	             totalPlace.appendChild(wdiv);
         }
         totalDate.children[1].classList.add("active");
         document.querySelector('.daily-wrap-div').style.display='block';
       }
       
       function addDays(date, days) { // 일을 증가시키는 메소드
    	    let ndate = new Date(date);
  		    let rdate= ndate.setDate(ndate.getDate() + days);
  		    return new Date(rdate); 
		}
       
       function register() {
    	   let zIndex = 999;
           let modal = document.getElementById('registerForm');
           let bg = document.createElement('div');
           
           bg.setStyle({
               position: 'fixed',
               zIndex: zIndex,
               left: '0px',
               top: '0px',
               width: '100%',
               height: '100%',
               overflow: 'auto',
               backgroundColor: 'rgba(0,0,0,0.4)'
           });
           document.body.append(bg);

           modal.querySelector('.modal_close_btn').addEventListener('click', function() {
               bg.remove();
                   modal.style.display = 'none';
           });
		
           modal.setStyle({
               position: 'fixed',
               display: 'block',
               boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

               zIndex: zIndex + 1,

               top: '50%',
               left: '50%',
               transform: 'translate(-50%, -50%)',
               msTransform: 'translate(-50%, -50%)',
               webkitTransform: 'translate(-50%, -50%)'
           });
       }
       
       function insertSchedule() {
           let datePicker = document.getElementsByClassName("data-range-picker")[0];
           let dateList = datePicker.value.split(' - ');
           let fromDate = new Date(dateList[0]);
           let toDate = new Date(dateList[1]);
           let title = document.getElementsByClassName("title-box")[0].value;
           let memo = document.getElementsByClassName("content-box")[0].value;
           
           let transit = sessionStorage.getItem("transit") || "car";
           let tmpAllList =[];
           let tmpList;
           let placeList = document.getElementsByClassName("daily-place-dt");
           let len = placeList.length;
           let memNo = <%= session.getAttribute("memNo") %> || 0;
           let schRegion = ${schDto.schRegion};
           let scheduleVO = {
        		   memNo:memNo,
        		   schTitle:title,
        		   fromDate:fromDate,
        		   toDate:toDate,
        		   schStatus:"BS003",
        		   memo:memo,	   
        		   schRegion:schRegion
           }
           for (let i = 0; i < len; i++) {
        	   
             let tmpSchList = [];
             tmpList = placeList[i].children;
             tmplen = tmpList.length;
             for (j = 0; j < tmplen-1; j++) {
            	let daycount = addDays(fromDate,i)
            	let distance = distArr.pop();
            	let dis = distance.split("km");
            	let duration = transit =="car" ? Math.ceil(dis[0]/36*60)+"분" : Math.ceil(dis[0]/20*60)+"분";
                let tmp = { 
                	  schNo:null,
                      schDate:daycount, // 1일차, 2일차, 3일차
                      fromPlc:tmpList[j].dataset["plcNo"],
                      toPlc:tmpList[j+1].dataset["plcNo"],
                      distance:distance,
                  	  duration:duration,
                      transit:transit,
                      num:j
                }
                tmpSchList.push(tmp);
             }
          tmpAllList.push(tmpSchList);
          }
           let sendData = {
        		   scheduleVO:scheduleVO,
        		   schdtVOs:tmpAllList
           }
           $.ajax({
                url: "/place/put/sch",
                type: "POST",
                data: JSON.stringify(sendData),
                contentType: "application/json; charset=utf-8;",
                dataType: "text",
                success:function(data){
                	location.href = data;
                },
                error: function(data){
                	Swal.fire({icon: 'error',text: data});
                }
            });  
           
        };
        
		function setArrNull() {
			const setConNull = (pmarkCon) => {
				for (let e of pmarkCon) {
					e.setMap(null);
				}
			}
			for (let eArr of polyArr) {
				setConNull(eArr);
			}
			for (let eArr of markArr) {
				setConNull(eArr);
			}
			markArr = [];
		    polyArr = [];
			distArr = [];
			
		}
		
       function initSch(){
    	   let zIndex = 99;
    	   let modal = document.getElementById('show-schedule');
    	   var mapContainer = document.getElementById('in-map'),
           mapOption = {
              center : new kakao.maps.LatLng(33.529252,126.589699), // 지도의 중심좌표
              level : 8
           };
           
           mapContainer.setStyle({
               width: '100%',
               height: '100%',
           });
           
           let dateAll = document.getElementById('all-date');
           let listAll = document.getElementById('all-schedule');
           // 노드를 이어붙일 애들 target
           let dpList = document.getElementsByClassName('daily-place-list');
           // 장소 추출할 리스트 현재 2차원임;
           let dateList = document.querySelector("#left-date-list").cloneNode(true);
           let dailyBtn = dateList.children;
           dailyBtn[0].innerText = "전체 일정 보기";
           dailyBtn[0].setAttribute("class","showAllBtn");
           let len = dailyBtn.length;
			for (let i = 0; i < len; i++) {
				dailyBtn[i].addEventListener("click", (event) =>{
					$(".outplcdt-wrap-div").remove();
					if(i==0) {
						$(".daily-place-dt").show();
					}else {
				        $(".daily-place-dt").hide();
					}
					let currTarget = event.currentTarget;
					let arr = [...dailyBtn];
				    let psuedoidx = arr.indexOf(currTarget);
					    for (let j = 0; j < len; j++) {
					    	dailyBtn[j].classList.remove("active");
					}
				        dailyBtn[psuedoidx].classList.add("active");
				})
				
				if(i==0) {
					dailyBtn[i].addEventListener("click", setArrNull);
					dailyBtn[i].addEventListener("click", drawLineAll)
				}
				else {
					dailyBtn[i].addEventListener("click", setArrNull);
					dailyBtn[i].addEventListener("click", drawLine);
			    }
             	dailyBtn[i].classList.remove("active");
			  }
           dailyBtn[0].classList.add("active");
           // 일정 추출할 리스트
           // 일정 생성 완료
           let dateLeng = dateList.children.length-1;
           
		   let leng = dpList.length;
           for (let i = 0; i < leng; i++) {
              
             let objs = document.createElement('ul');
             dnd(objs).sortable({
             	start:function(event, ui) {
             		ui.item.data('pos-idx', ui.item.index());
             		console.log(ui.item.index());
            	},
            	stop:function(event, ui) {
             		var startPos = ui.item.data('pos-idx');
             		var endPos = ui.item.index();
             		console.log(startPos+ " : " + endPos); // 시작점 : 끝나는점 
             	},
             	update:function(event,ui) {
             		setArrNull();
             		drawLineAll();
             	}
             });
             dnd(objs).disableSelection();

              objs.setAttribute('class','daily-place-dt');
              objs.style.display = 'block';
              objs.innerText="<"+(i+1)+"일차>";
              listAll.appendChild(objs);
			  // 일차 리스트에 이어 붙여주기          
			  
              let len = dpList[i].children.length; //span wrap div -1 
              for (let j = 0; j < len; j++) {
              let dailyplace = dpList[i].children[j].cloneNode(true); //span wrap div +1
              dailyplace.setAttribute('class','place-perday-list');
              dailyplace.lastElementChild.addEventListener('click',() => {
            	  deleteInLeft(event);
            	  setArrNull();
            	  drawLineAll();
              });
              
              objs.appendChild(dailyplace);
          }
        }
           dateAll.appendChild(dateList);  
           
           let bg = document.createElement('div');
           bg.setAttribute("class", "modal-background");
           bg.setStyle({
               position: 'fixed',
               zIndex: zIndex,
               left: '0px',
               top: '0px',
               width: '100%',
               height: '100%',
               overflow: 'scroll',
               backgroundColor: 'rgba(0,0,0,0.4)'
           });
           document.body.append(bg);

           modal.querySelector('.modal_close_btn').addEventListener('click', function() {
               bg.remove();
                   modal.style.display = 'none';
          $("#all-schedule").empty();
          $("#all-date").empty()         
           });

           modal.setStyle({
               position: 'fixed',
               display: 'flex',
               boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

               zIndex: zIndex + 1,

               top: '50%',
               left: '50%',
               transform: 'translate(-50%, -50%)',
               msTransform: 'translate(-50%, -50%)',
               webkitTransform: 'translate(-50%, -50%)'
           });
       
           const showCurrList = function (event){
         	 let idx = $(this).index()-1;
         	 
        	 let plcdtList = document.getElementsByClassName("place-dt-list");
        	   if(!(plcdtList[idx]==undefined)){
        		   return;
        	   }
  			 let currList = document.getElementsByClassName("daily-place-dt")[idx]; 
  			 let leng = currList.children.length;
  			 let owdiv = document.createElement("div");
  			 owdiv.setAttribute("class","outplcdt-wrap-div");
  			 owdiv.setAttribute("data-dno", idx+1);
  			 let tmpList = document.createElement("ul");
  			 let title = document.createElement("span");
  			 title.innerText = `\${idx+1}일차`;
  			 owdiv.appendChild(title);
  			 tmpList.setAttribute("class","place-dt-list");
  			 let transit = sessionStorage.getItem("transit");
  			 let geocoder = new kakao.maps.services.Geocoder();
  			 
  			 const geoChanger = (mX,mY) => {
  				 return new Promise((resolve,reject) => {
  					   geocoder.transCoord(mX, mY, (result,status) => {
  		  	               if (status === kakao.maps.services.Status.OK) {
  		  	            	    resolve(result);
  		  	                   } else {
  		  	       				reject(status); 
  		  	       			   }
  		  	               }, {
  			               input_coord: kakao.maps.services.Coords.WGS84,
  			               output_coord: kakao.maps.services.Coords.WCONGNAMUL
  			           });
  				})   
  			   }
  			 let geoArr = [];
  			 for (let i = 0; i < leng; i++) {
  				   let locaData = currList.children[i];
  				   let x = locaData.dataset["lng"];
  				   let y = locaData.dataset["lat"];
  				   let promise = geoChanger(x,y);
  				   geoArr.push(promise);
         } // for currList end 
         let pAll = Promise.all(geoArr);
         for (let i = 0; i < geoArr.length; i++) {
			let locaData = currList.children[i];
			pAll.then(result => {
				
				 resultset.push({x:result[i][0].x,y:result[i][0].y,title:locaData.dataset["title"]});
		         let dailyplace = locaData.cloneNode();
		         dailyplace.setAttribute("class", "place-dt-perday");
		         dailyplace.innerText = dailyplace.dataset["title"];
		         let rsid = resultset.length||0;
		         if(rsid>1){
		        	 let URL = `https://map.kakao.com/?map_type=TYPE_MAP&target=\${transit}&rt=\${resultset[rsid-2]["x"]},\${resultset[rsid-2]["y"]},\${resultset[rsid-1]["x"]},\${resultset[rsid-1]["y"]}&rt1=\${resultset[rsid-2]["title"]}&rt2=\${resultset[rsid-1]["title"]}&rtIds=%2C&rtTypes=%2C`;
		        	 let button = document.createElement("button");
			         button.setAttribute("type", "button");
			         button.addEventListener("click",() => {
                         window.open(URL, "카카오 지도", "toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); 
			         })
			         button.innerText="상세보기 "
			         let icon2 = document.createElement("i");
			         icon2.setAttribute("class", "fas fa-sort-down");
			         button.appendChild(icon2);
		        	 let span = document.createElement("span");
		        	 span.innerText = "STEP"+i;
		        	 
		        	 let icon1 = document.createElement("i");
		        	 icon1.setAttribute("class", "fas fa-long-arrow-alt-down");
		        	 
		        	 let dailypair = currList.children[i-1].cloneNode();
			         dailypair.setAttribute("class", "place-dt-perday");
			         dailypair.innerText = dailypair.dataset["title"];
		        	 let wdiv = document.createElement("div");
		        	 wdiv.setAttribute("class", "plcdt-wrap-div");
		        	 wdiv.appendChild(span);
		        	 wdiv.appendChild(dailypair);
		        	 wdiv.appendChild(icon1);
		        	 wdiv.appendChild(dailyplace);
		        	 wdiv.append(button);
		         	 tmpList.appendChild(wdiv)
		         } // if end // resolve end
		         	 
		         	 owdiv.appendChild(tmpList);
			         listAll.appendChild(owdiv);
	   				}, status => {console.log(status)}					         
			); // end then
			         resultset = []; // resultset을 다시금 초기화 해주는 작업;	   
		}
         
         		}    
  		for (let i = 0; i < dateLeng; i++) {
  	           dateList.children[i+1].addEventListener("click",showCurrList);
  		} // for event Listener end
         inmap = new kakao.maps.Map(mapContainer,
                 mapOption); // 지도를 생성합니다
                 mapContainer.style.width = '100%';
                 mapContainer.style.height = '100%';
                 inmap.relayout();
         drawLineAll(); // 수정후 마지막에 라인그리기
         };   
         
       function drawLineAll(event) {
    	   distArr = [];
    	   let latlngList = document.getElementsByClassName("daily-place-dt");
    	   let len = latlngList.length;
    	   const draw = (idx) => {
        	   
        	   let colors = ["21209c","3ec1d3","3490de","583d72","086972","f07b3f","b61aae","ea5455","2d4059","fdb827"];
    		   let posArr = [];
    		   let markCon = [];
    		   let polyCon = [];
        	   let latlngList = document.getElementsByClassName("daily-place-dt");
    		   let latlngData = latlngList[idx].children
    		   let leng = latlngData.length||0;
     	   
     	  	   const makeContent = (iidx) => {
     	  		const getInfo = () => {
    	 			  let placeNo = latlngData[iidx].dataset["plcNo"]
    	  		      let URL = "https://place.map.kakao.com/"+placeNo;
    	                window.open(URL, "카카오 지도", "toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
    	  		}
     	  	   let con = "data:image/svg+xml;charset=UTF-8,%0A%20%20%20%20%3Csvg%20width%3D%2240px%22%20height%3D%2240px%22%20version%3D%221.1%22%20viewBox%3D%220%200%2040%2040%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%3E%0A%20%20%20%20%20%20%20%20%3Cdefs%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cpath%20id%3D%22a%22%20d%3D%22m9.0828%2027.112c-5.3063-1.9908-9.0828-7.1105-9.0828-13.112%200-7.732%206.268-14%2014-14s14%206.268%2014%2014c0%206.0017-3.7765%2011.121-9.0828%2013.112l-4.0772%203.0579c-0.49778%200.37333-1.1822%200.37333-1.68%200l-4.0772-3.0579z%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cfilter%20id%3D%22b%22%20x%3D%22-21.4%25%22%20y%3D%22-19.7%25%22%20width%3D%22142.9%25%22%20height%3D%22139.4%25%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeOffset%20dx%3D%220%22%20dy%3D%220%22%20in%3D%22SourceAlpha%22%20result%3D%22shadowOffsetOuter1%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeGaussianBlur%20in%3D%22shadowOffsetOuter1%22%20result%3D%22shadowBlurOuter1%22%20stdDeviation%3D%222%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeComposite%20in%3D%22shadowBlurOuter1%22%20in2%3D%22SourceAlpha%22%20operator%3D%22out%22%20result%3D%22shadowBlurOuter1%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeColorMatrix%20in%3D%22shadowBlurOuter1%22%20values%3D%220%200%200%200%200%20%20%200%200%200%200%200%20%20%200%200%200%200%200%20%200%200%200%200.3%200%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Ffilter%3E%0A%20%20%20%20%20%20%20%20%3C%2Fdefs%3E%0A%20%20%20%20%20%20%20%20%3Cg%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20transform%3D%22translate(6%205)%22%20fill-rule%3D%22nonzero%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cuse%20fill%3D%22black%22%20filter%3D%22url(%23b)%22%20xlink%3Ahref%3D%22%23a%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cpath%20d%3D%22m9.4341%2026.176%200.13412%200.050321%204.1918%203.1438c0.14222%200.10667%200.33778%200.10667%200.48%200l4.1918-3.1438%200.13412-0.050321c5.0317-1.8878%208.4341-6.7117%208.4341-12.176%200-7.1797-5.8203-13-13-13-7.1797%200-13%205.8203-13%2013%200%205.4642%203.4024%2010.288%208.4341%2012.176z%22%20fill%3D%22%23"+ colors[idx] +"%22%20fill-rule%3D%22evenodd%22%20stroke%3D%22%23fff%22%20stroke-linejoin%3D%22square%22%20stroke-width%3D%222%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fg%3E%0A%20%20%20%20%20%20%20%20%3C%2Fg%3E%0A%20%20%20%20%20%20%20%20%3Ctext%20x%3D%2220px%22%20y%3D%2224px%22%20fill%3D%22%23fff%22%20font-family%3D%22'Open%20Sans'%2CArial%2C'Helvetica%20Neue'%2Csans-serif%22%20font-size%3D%2214%22%20font-weight%3D%22bold%22%20text-anchor%3D%22middle%22%3E"+(iidx+1)+"%3C%2Ftext%3E%0A%20%20%20%20%3C%2Fsvg%3E%0A"; 
     	  	   let hcon = "data:image/svg+xml;charset=UTF-8,%0A%20%20%20%20%3Csvg%20width%3D%2240px%22%20height%3D%2240px%22%20version%3D%221.1%22%20viewBox%3D%220%200%2040%2040%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%3E%0A%20%20%20%20%20%20%20%20%3Cdefs%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cpath%20id%3D%22a%22%20d%3D%22m9.0828%2027.112c-5.3063-1.9908-9.0828-7.1105-9.0828-13.112%200-7.732%206.268-14%2014-14s14%206.268%2014%2014c0%206.0017-3.7765%2011.121-9.0828%2013.112l-4.0772%203.0579c-0.49778%200.37333-1.1822%200.37333-1.68%200l-4.0772-3.0579z%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cfilter%20id%3D%22b%22%20x%3D%22-21.4%25%22%20y%3D%22-19.7%25%22%20width%3D%22142.9%25%22%20height%3D%22139.4%25%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeOffset%20dx%3D%220%22%20dy%3D%220%22%20in%3D%22SourceAlpha%22%20result%3D%22shadowOffsetOuter1%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeGaussianBlur%20in%3D%22shadowOffsetOuter1%22%20result%3D%22shadowBlurOuter1%22%20stdDeviation%3D%222%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeComposite%20in%3D%22shadowBlurOuter1%22%20in2%3D%22SourceAlpha%22%20operator%3D%22out%22%20result%3D%22shadowBlurOuter1%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeColorMatrix%20in%3D%22shadowBlurOuter1%22%20values%3D%220%200%200%200%200%20%20%200%200%200%200%200%20%20%200%200%200%200%200%20%200%200%200%200.3%200%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Ffilter%3E%0A%20%20%20%20%20%20%20%20%3C%2Fdefs%3E%0A%20%20%20%20%20%20%20%20%3Cg%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20transform%3D%22translate(6%205)%22%20fill-rule%3D%22nonzero%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cuse%20fill%3D%22black%22%20filter%3D%22url(%23b)%22%20xlink%3Ahref%3D%22%23a%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cpath%20d%3D%22m9.4341%2026.176%200.13412%200.050321%204.1918%203.1438c0.14222%200.10667%200.33778%200.10667%200.48%200l4.1918-3.1438%200.13412-0.050321c5.0317-1.8878%208.4341-6.7117%208.4341-12.176%200-7.1797-5.8203-13-13-13-7.1797%200-13%205.8203-13%2013%200%205.4642%203.4024%2010.288%208.4341%2012.176z%22%20fill%3D%22%23fff%22%20fill-rule%3D%22evenodd%22%20stroke%3D%22%23"+ colors[idx] +"%22%20stroke-linejoin%3D%22square%22%20stroke-width%3D%222%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fg%3E%0A%20%20%20%20%20%20%20%20%3C%2Fg%3E%0A%20%20%20%20%20%20%20%20%3Ctext%20x%3D%2220px%22%20y%3D%2224px%22%20fill%3D%22%23"+ colors[idx] +"%22%20font-family%3D%22'Open%20Sans'%2CArial%2C'Helvetica%20Neue'%2Csans-serif%22%20font-size%3D%2214%22%20font-weight%3D%22bold%22%20text-anchor%3D%22middle%22%3E"+(iidx+1)+"%3C%2Ftext%3E%0A%20%20%20%20%3C%2Fsvg%3E%0A";
     	  	   
     		   let content = document.createElement("img");
     		   content.setAttribute("class", "marker-img");
     		   content.setAttribute("src", con);
     		   content.setAttribute("style", "position: absolute; left: 0px; top: 0px; user-select: none; width: 40px; height: 40px; border: 0px; padding: 0px; margin: 0px; max-width: none; opacity: 1; transform: translate(-50%,-90%);");
     		   content.setAttribute("draggable","false");
     		   
     	  	   content.addEventListener("click", getInfo);
     	  	   content.addEventListener("mouseenter", (event) => {
     	  		   let currTarget = event.currentTarget;
     	  		   currTarget.setAttribute("src", hcon);
     	  	   });
     	  	   content.addEventListener("mouseleave", (event) => {
     	  		   let currTarget = event.currentTarget;
     	  		   currTarget.setAttribute("src", con);
     	  	   });
     	  	   return content;
     	  	   }
     	  	   
     	  	   let hovContent = document.createElement("div");
     	  	   let hovul = document.createElement("ul");
     	  	   let hovli = document.createElement("li");
			   /* img.src(currentTarget.dataset["img"]); */
			  
     	  	   
        	   for (let i = 0; i < leng; i++) {
        		let pos = new kakao.maps.LatLng(latlngData[i].dataset["lat"],latlngData[i].dataset["lng"]);
        		posArr.push(pos);
        		let mark = new kakao.maps.CustomOverlay({
        			clickable: true,
                    content: makeContent(i),
                    position: pos
                });
     			mark.setMap(inmap);
     			markCon.push(mark);
        	   }
     			markArr.push(markCon);
        	   let plen = posArr.length-1;
    		   for (let i = 0; i < plen; i++) {
    			   let polyline = new kakao.maps.Polyline({
    	    		    map: inmap,
    	    		    path:[posArr[i],posArr[i+1]],
    	    		    endArrow: true,
    	    		    strokeWeight: 3,
    	    		    strokeColor: "#"+colors[idx],
    	    		    strokeOpacity: 1,
    	    		    strokeStyle: 'solid'
    	    		    
    	    		})
    			   let dist = (polyline.getLength()/1000).toFixed("2")+"km";
				   distArr.push(dist);  
    			   polyCon.push(polyline);
    			}
    			   polyArr.push(polyCon);
    			   posArrSet.push(posArr);
        	   
           }
    	   
    	   
    	   for (let idx = 0; idx < len; idx++) {
    		   draw(idx);
    		   }
       }
       
       function drawLine(event) {
    	   let idx = $(this).index()-1;
    	   
		   const draw = (idx) => {
			   
			   let colors = ["21209c","3ec1d3","3490de","583d72","086972","f07b3f","b61aae","ea5455","2d4059","fdb827"];
			   let posArr = [];
    		   let markCon = [];
    		   let polyCon = [];
        	   let latlngList = document.getElementsByClassName("daily-place-dt");
    		   let latlngData = latlngList[idx].children
    		   let leng = latlngData.length||0;
     	   
     	  	   const makeContent = (iidx) => {
     	  		const getInfo = () => {
    	 			  let placeNo = latlngData[iidx].dataset["plcNo"]
    	  		      let URL = "https://place.map.kakao.com/"+placeNo;
    	                window.open(URL, "카카오 지도", "toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
    	  		}
     	  	   let con = "data:image/svg+xml;charset=UTF-8,%0A%20%20%20%20%3Csvg%20width%3D%2240px%22%20height%3D%2240px%22%20version%3D%221.1%22%20viewBox%3D%220%200%2040%2040%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%3E%0A%20%20%20%20%20%20%20%20%3Cdefs%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cpath%20id%3D%22a%22%20d%3D%22m9.0828%2027.112c-5.3063-1.9908-9.0828-7.1105-9.0828-13.112%200-7.732%206.268-14%2014-14s14%206.268%2014%2014c0%206.0017-3.7765%2011.121-9.0828%2013.112l-4.0772%203.0579c-0.49778%200.37333-1.1822%200.37333-1.68%200l-4.0772-3.0579z%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cfilter%20id%3D%22b%22%20x%3D%22-21.4%25%22%20y%3D%22-19.7%25%22%20width%3D%22142.9%25%22%20height%3D%22139.4%25%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeOffset%20dx%3D%220%22%20dy%3D%220%22%20in%3D%22SourceAlpha%22%20result%3D%22shadowOffsetOuter1%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeGaussianBlur%20in%3D%22shadowOffsetOuter1%22%20result%3D%22shadowBlurOuter1%22%20stdDeviation%3D%222%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeComposite%20in%3D%22shadowBlurOuter1%22%20in2%3D%22SourceAlpha%22%20operator%3D%22out%22%20result%3D%22shadowBlurOuter1%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeColorMatrix%20in%3D%22shadowBlurOuter1%22%20values%3D%220%200%200%200%200%20%20%200%200%200%200%200%20%20%200%200%200%200%200%20%200%200%200%200.3%200%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Ffilter%3E%0A%20%20%20%20%20%20%20%20%3C%2Fdefs%3E%0A%20%20%20%20%20%20%20%20%3Cg%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20transform%3D%22translate(6%205)%22%20fill-rule%3D%22nonzero%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cuse%20fill%3D%22black%22%20filter%3D%22url(%23b)%22%20xlink%3Ahref%3D%22%23a%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cpath%20d%3D%22m9.4341%2026.176%200.13412%200.050321%204.1918%203.1438c0.14222%200.10667%200.33778%200.10667%200.48%200l4.1918-3.1438%200.13412-0.050321c5.0317-1.8878%208.4341-6.7117%208.4341-12.176%200-7.1797-5.8203-13-13-13-7.1797%200-13%205.8203-13%2013%200%205.4642%203.4024%2010.288%208.4341%2012.176z%22%20fill%3D%22%23"+ colors[idx] +"%22%20fill-rule%3D%22evenodd%22%20stroke%3D%22%23fff%22%20stroke-linejoin%3D%22square%22%20stroke-width%3D%222%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fg%3E%0A%20%20%20%20%20%20%20%20%3C%2Fg%3E%0A%20%20%20%20%20%20%20%20%3Ctext%20x%3D%2220px%22%20y%3D%2224px%22%20fill%3D%22%23fff%22%20font-family%3D%22'Open%20Sans'%2CArial%2C'Helvetica%20Neue'%2Csans-serif%22%20font-size%3D%2214%22%20font-weight%3D%22bold%22%20text-anchor%3D%22middle%22%3E"+(iidx+1)+"%3C%2Ftext%3E%0A%20%20%20%20%3C%2Fsvg%3E%0A";
     	  	   let hcon = "data:image/svg+xml;charset=UTF-8,%0A%20%20%20%20%3Csvg%20width%3D%2240px%22%20height%3D%2240px%22%20version%3D%221.1%22%20viewBox%3D%220%200%2040%2040%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%3E%0A%20%20%20%20%20%20%20%20%3Cdefs%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cpath%20id%3D%22a%22%20d%3D%22m9.0828%2027.112c-5.3063-1.9908-9.0828-7.1105-9.0828-13.112%200-7.732%206.268-14%2014-14s14%206.268%2014%2014c0%206.0017-3.7765%2011.121-9.0828%2013.112l-4.0772%203.0579c-0.49778%200.37333-1.1822%200.37333-1.68%200l-4.0772-3.0579z%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cfilter%20id%3D%22b%22%20x%3D%22-21.4%25%22%20y%3D%22-19.7%25%22%20width%3D%22142.9%25%22%20height%3D%22139.4%25%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeOffset%20dx%3D%220%22%20dy%3D%220%22%20in%3D%22SourceAlpha%22%20result%3D%22shadowOffsetOuter1%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeGaussianBlur%20in%3D%22shadowOffsetOuter1%22%20result%3D%22shadowBlurOuter1%22%20stdDeviation%3D%222%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeComposite%20in%3D%22shadowBlurOuter1%22%20in2%3D%22SourceAlpha%22%20operator%3D%22out%22%20result%3D%22shadowBlurOuter1%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3CfeColorMatrix%20in%3D%22shadowBlurOuter1%22%20values%3D%220%200%200%200%200%20%20%200%200%200%200%200%20%20%200%200%200%200%200%20%200%200%200%200.3%200%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Ffilter%3E%0A%20%20%20%20%20%20%20%20%3C%2Fdefs%3E%0A%20%20%20%20%20%20%20%20%3Cg%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20transform%3D%22translate(6%205)%22%20fill-rule%3D%22nonzero%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cuse%20fill%3D%22black%22%20filter%3D%22url(%23b)%22%20xlink%3Ahref%3D%22%23a%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cpath%20d%3D%22m9.4341%2026.176%200.13412%200.050321%204.1918%203.1438c0.14222%200.10667%200.33778%200.10667%200.48%200l4.1918-3.1438%200.13412-0.050321c5.0317-1.8878%208.4341-6.7117%208.4341-12.176%200-7.1797-5.8203-13-13-13-7.1797%200-13%205.8203-13%2013%200%205.4642%203.4024%2010.288%208.4341%2012.176z%22%20fill%3D%22%23fff%22%20fill-rule%3D%22evenodd%22%20stroke%3D%22%23"+ colors[idx] +"%22%20stroke-linejoin%3D%22square%22%20stroke-width%3D%222%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fg%3E%0A%20%20%20%20%20%20%20%20%3C%2Fg%3E%0A%20%20%20%20%20%20%20%20%3Ctext%20x%3D%2220px%22%20y%3D%2224px%22%20fill%3D%22%23"+ colors[idx] +"%22%20font-family%3D%22'Open%20Sans'%2CArial%2C'Helvetica%20Neue'%2Csans-serif%22%20font-size%3D%2214%22%20font-weight%3D%22bold%22%20text-anchor%3D%22middle%22%3E"+(iidx+1)+"%3C%2Ftext%3E%0A%20%20%20%20%3C%2Fsvg%3E%0A";
     		   let content = document.createElement("img");
     		   content.setAttribute("class", "marker-img");
     		   content.setAttribute("src", con);
     		   content.setAttribute("style", "position: absolute; left: 0px; top: 0px; user-select: none; width: 40px; height: 40px; border: 0px; padding: 0px; margin: 0px; max-width: none; opacity: 1; transform: translate(-50%,-90%);");
     		   content.setAttribute("draggable","false");
     	  	   content.addEventListener("click", getInfo);
     	  	   /* content.addEventListener("click", () => {
     	  	   Swal.fire({
   				   title: latlngData[iidx].dataset["plc_title"],
   				   text: latlngData[iidx].dataset["addressDt"],
   				   imageUrl: latlngData[iidx].querySelector(".img-wrap-div>img").getAttribute("src"),
   				   imageWidth: 400,
   				   imageHeight: 200,
   				   imageAlt: 'Custom image',
   				 })
     	  	   }); */
     	  	   content.addEventListener("mouseenter", (event) => {
     	  		   let currTarget = event.currentTarget;
     	  		   currTarget.setAttribute("src", hcon);
     	  	   });
     	  	   content.addEventListener("mouseleave", (event) => {
     	  		   let currTarget = event.currentTarget;
     	  		   currTarget.setAttribute("src", con);
     	  	   });
     	  	   return content;
     	  	   }
    		   
        	   for (let i = 0; i < leng; i++) {
        		let pos = new kakao.maps.LatLng(latlngData[i].dataset["lat"],latlngData[i].dataset["lng"]);
        		posArr.push(pos);
        		let mark = new kakao.maps.CustomOverlay({
        			clickable: true,
                    content: makeContent(i),
                    position: pos
                });
     			mark.setMap(inmap);
     			markCon.push(mark);
        	   }
     			markArr.push(markCon);
        	   
        	   let plen = posArr.length-1;
    		   for (let i = 0; i < plen; i++) {
    			   let polyline = new kakao.maps.Polyline({
    	    		    map: inmap,
    	    		    path:posArr,
    	    		    endArrow: true,
    	    		    strokeWeight: 3,
    	    		    strokeColor: "#"+colors[idx],
    	    		    strokeOpacity: 1,
    	    		    strokeStyle: 'solid'
    	    		    
    	    		})
    			   polyCon.push(polyline);
    			}
    			   polyArr.push(polyCon);
        	   
           }
    	   draw(idx);
       }
       
       function searchAction(event) {
           let placeValue = $("#search-value").val();
           if(placeValue==""){
              Swal.fire({icon: 'error',text: "검색어를 입력해주세요"});
              return;
           }
           let placeList = $(".right-place-list");
           let pageNum = event.currentTarget.dataset["num"]||1;
           let regionNo = document.getElementsByClassName("data-range-picker")[0].dataset["regionNo"];
           
           let leftPlace = document.getElementsByClassName("selected-place");
           let index = getActiveDay();
           let leftPlaceList = document.getElementsByClassName("daily-wrap-div");
           let activePlaceList = leftPlaceList[index].children;
           placeList.empty();
           let tmplist = [];
           
           placeService.getList({
          	title:placeValue,
              regionNo:regionNo,
              pageNum:pageNum
              },
              (map) => {
                   let list = map["list"];
                   let pageMaker = map["pageMaker"];
                   let len = list.length||0;
                   let leng = activePlaceList.length||0;
                    
                    for (let i= 0; i<len-leng; i++) {
                       for (let j = 0; j < leng; j++) {
                             if(activePlaceList[j].dataset["title"]==list[i].plcTitle){
                                list.splice(i,1);
                          }
                       }
                    }
                    
                    const pagingWithpageMaker = (pageMaker)=> {
                        let pagingBar = document.getElementsByClassName("right-paging-bar")[0];
                        pagingBar.innerHTML = null;
                        let wrapperDiv = document.createElement("div");
                        wrapperDiv.setAttribute("class", "pageNoWrap");
                      let endPage = pageMaker.endPage;
                      let startPage = pageMaker.startPage;
                      if(pageMaker.prev) {
                         let btnObj = document.createElement("button");
                         btnObj.setAttribute("type", "button");
                         btnObj.setAttribute("class", "prev-btn");
                         btnObj.setAttribute("data-num", startPage-1);
                         btnObj.innerText ="<";
                         btnObj.addEventListener('click',searchAction);
                         pagingBar.appendChild(btnObj);
                      }
                      
                      for (let k = startPage; k <= endPage; k++) {
                         let pageObj = document.createElement("div");
                         pageObj.setAttribute("data-num", k);
                         pageObj.innerText = k;
                         pageObj.addEventListener('click',searchAction);
                         wrapperDiv.appendChild(pageObj);
                      }
                      pagingBar.appendChild(wrapperDiv);
                      if(pageMaker.next) {
                         let btnObj = document.createElement("button");
                         btnObj.setAttribute("type", "button");
                         btnObj.setAttribute("class", "next-btn");
                         btnObj.setAttribute("data-num", endPage+1);
                         btnObj.addEventListener('click',searchAction);
                         btnObj.innerText =">";
                         pagingBar.appendChild(btnObj);
                      }
                   }
                    pagingWithpageMaker(pageMaker);
                    
                    for (let i = 0; i < len; i++) {
                       let liobj = document.createElement("li");   
                       liobj.setAttribute('class', 'left clearfix');
                       let objs1 = document.createElement("div");
                       objs1.setAttribute('class','hoverable-place');
                       objs1.setAttribute('data-title',list[i].plcTitle.replace(" ","\n"));
                       objs1.setAttribute('data-region-no',list[i].regionNo);
                       objs1.setAttribute('data-address-dt',list[i].addressDt);
                       objs1.setAttribute('data-plc-no',list[i].plcNo);
                       objs1.setAttribute('data-holiday',list[i].holiday);
                       objs1.setAttribute('data-lat',list[i].lat);
                       objs1.setAttribute('data-lng',list[i].lng);
                       objs1.setAttribute('data-opening-h',list[i].openingH);
                       objs1.setAttribute('data-p-cate',list[i].pCate);
                       let span = document.createElement("span");
                       span.innerText=list[i].plcTitle.replace(" ","\n");
                       objs1.addEventListener('mouseover',placeOver);
                       
                       
                       let imgwrap = document.createElement("div");
                       imgwrap.setAttribute('class', 'img-wrap-div');
                       imgwrap.setAttribute('style', 'border-radius: 4px;overflow: hidden;backface-visibility: hidden;transform: translateZ(0);grid-area:img;');
                       
                       let objs1img = document.createElement('img');
                       objs1img.setAttribute('src',list[i].plcImg);
                       objs1img.setAttribute('style','width:80px;height:80px;border-radius:4px;');
                       
                       let btnobj1 = document.createElement("button");
                       btnobj1.setAttribute('class', 'add-button');
                       let iconobj1 = document.createElement("i");
                       iconobj1.setAttribute('class', 'fas fa-plus');
                       btnobj1.addEventListener('click', show);
                       btnobj1.addEventListener('click', (event) => {
                           let currTarget = event.currentTarget.parentElement;
                           let index = document.getElementsByClassName("left-place-list")
                           let parentI = (currTarget.children)[0].cloneNode(true);
                           let dailyPlaceList = document.getElementsByClassName("daily-place-list");
                           let idx = getActiveDay(); // idx 를 얻었다.
                           let currentList = dailyPlaceList[idx];
                           let currentPlaceList = currentList.children;
                           if(currentPlaceList.length>=6){
                          	  Swal.fire({icon: 'error',
              	  text: "하루에 장소는 6개까지만 가능합니다."})
                          	 return;
                           }
                           for (let i = 0; len = currentPlaceList.length ,i < len; i++) {
                              if(currTarget.dataset["plcNo"]==currentPlaceList[i].dataset["plcNo"]){
                                 return;
                              }
                           }
                                       let objs1 = currTarget.cloneNode();
                                       objs1.setAttribute('class','selected-place');
                                       let span = document.createElement("span");
                                       span.innerText = currTarget.dataset['title'];
                                       
                                       objs1.append(parentI);
  									 objs1.append(span);
                                       let btnobj1 = document.createElement("button");
                                       btnobj1.setAttribute('class', 'delete-button');
                                       let iconobj1 = document.createElement("i");
                                       iconobj1.setAttribute('class', 'fas fa-times');
                                       btnobj1.addEventListener('click',deleteInLeft);
                                       btnobj1.appendChild(iconobj1);
                                       objs1.appendChild(btnobj1);
                                       currentList.append(objs1);
                                       
                           dnd( function() {
                              dnd( ".daily-place-list" ).sortable();
                              dnd( ".daily-place-list" ).disableSelection();
                              
                              } );
                        });
                       btnobj1.appendChild(iconobj1);
                       
                       let btnobj2 = document.createElement("button");
                       btnobj2.setAttribute('class', 'detail-button');
                       let iconobj2 =document.createElement("i");
                       iconobj2.setAttribute('class', 'fas fa-search-plus');
                       btnobj2.addEventListener('click', (event) => { // 상세 정보 보기 페이지 URL + palceNo로 이루어져있다
                           let clickedBtn = event.currentTarget;
                           let placeNo = clickedBtn.parentElement.dataset["plcNo"];
                           let URL = "https://place.map.kakao.com/"+placeNo;
                           window.open(URL, "카카오 지도", "toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); 
                        });
                       btnobj2.appendChild(iconobj2);
                       imgwrap.appendChild(objs1img);
                       objs1.prepend(imgwrap);
                       objs1.appendChild(span);
                       objs1.appendChild(btnobj1);
                       objs1.appendChild(btnobj2);
                       liobj.appendChild(objs1);
                       placeList.append(liobj);
                    }
                 })
           return;
        }
         
        function deleteInLeft(event) {
           let deleteElement = event.currentTarget;
           deleteElement.parentElement.remove(); 
        }
        
        function getActiveDay(){
           let dateList = document.getElementsByClassName("daily-wrap-div");
           let idx;
           for (let i = 0; i < dateList.length; i++) {
              
              if(dateList[i].style.display=="block"){
                 idx = i;
              }
           }
           return idx;
        }

        function placeOver(event) {
               let currTarget = event.currentTarget;
               // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
               var bounds = new kakao.maps.LatLngBounds();
               
               const addMarker = (position) => {
                   let text = currTarget.dataset["holiday"]=="null" ? "연중 무휴":currTarget.dataset["holiday"];
                   let openH = currTarget.dataset["openingH"]=="null" ? "":currTarget.dataset["openingH"]; 
                   /* let content = `<div style="position: absolute;z-index:3;white-space:nowrap;">
  				                     <ul class="dotOverlay placeInfo">
  				                     <li> 
  				                         <span class="number">\${currTarget.dataset["title"]}</span>
  				                     </li>
  				                     <li>
  				                         <span class="label">\${text}</span>
  				                     </li>
  				                     <li>
  										 <span class="label">\${openH}</span>
  				                     </li>
  				                 </ul>
  				             	</div>`; */
  				             	
  				 let content = document.createElement("div");
  				 content.setAttribute("style", "position:absolute;z-index:3;white-space:nowrap;");
  				 let dotoverlay = document.createElement("ul");
  				 dotoverlay.setAttribute("class", "dotOverlay placeInfo");
  				 let li1 = document.createElement("li");
  				 let spannum = document.createElement("span");
  				 spannum.setAttribute("class", "number");
  				 spannum.innerText = currTarget.dataset["title"];
  				 li1.appendChild(spannum);
  				 
  				 let li2 = document.createElement("li");
  				 let spanlabel1 = document.createElement("span");
  				 spanlabel1.innerText = text;
  				 li2.appendChild(spanlabel1);
  				 
  				 let li3 = document.createElement("li");
  				 let spanlabel2 = document.createElement("span");
  				 spanlabel2.innerText = openH;
  				 li3.appendChild(spanlabel2);
  								 
  				 dotoverlay.appendChild(li1);
  				 dotoverlay.appendChild(li2);
  				 if(!(currTarget.dataset["openingH"]=="null")){
  				 dotoverlay.appendChild(li3) 
  				 }
  				 content.appendChild(dotoverlay);
                   overlay = new kakao.maps.CustomOverlay({
                       content: content,
                       position: position,
                       zIndex: 1
                   });
                   marker = new kakao.maps.CustomOverlay({
                      /*  content: '<span class="dot" style="overflow: hidden;float: left;width: 12px;height: 12px;background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png);"></span>', */
                     content: `<svg xmlns="http://www.w3.org/2000/svg" width="30px" height="30px" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid" class="lds-ripple" style="background: none;">
                         <circle cx="50" cy="50" r="27.1897" fill="none" ng-attr-stroke="{{config.c1}}" ng-attr-stroke-width="{{config.width}}" stroke="#2082c1" stroke-width="10">
                     <animate attributeName="r" calcMode="spline" values="0;40" keyTimes="0;1" dur="1" keySplines="0 0.2 0.8 1" begin="-0.5s" repeatCount="indefinite"/>
                     <animate attributeName="opacity" calcMode="spline" values="1;0" keyTimes="0;1" dur="1" keySplines="0.2 0 0.8 1" begin="-0.5s" repeatCount="indefinite"/>
                   </circle>
                   <circle cx="50" cy="50" r="3.96265" fill="none" ng-attr-stroke="{{config.c2}}" ng-attr-stroke-width="{{config.width}}" stroke="#2082c1" stroke-width="8">
                     <animate attributeName="r" calcMode="spline" values="0;40" keyTimes="0;1" dur="1" keySplines="0 0.2 0.8 1" begin="0s" repeatCount="indefinite"/>
                     <animate attributeName="opacity" calcMode="spline" values="1;0" keyTimes="0;1" dur="1" keySplines="0.2 0 0.8 1" begin="0s" repeatCount="indefinite"/>
                   </circle>
                 </svg>`,
                      position: position,
                       zIndex: 1
                   });
                   let markObj = {"marker":marker,"overlay":overlay};
                   markers.push(markObj);
                   marker.setMap(map); // 지도 위에 마커를 표출합니다
                   overlay.setMap(map);
                   return markObj;
                } 
                   
  	          const panTo = (marker) => {
  	               // 이동할 위도 경도 위치를 생성합니다 
  	               let moveLatLon = new kakao.maps.LatLng(marker.getPosition().getLat(),marker.getPosition().getLng());
  	               // 지도 중심을 부드럽게 이동시킵니다
  	               // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
  	               map.setProportion;
  	               map.panTo(moveLatLon);            
  	          }
  	                var placePosition = new kakao.maps.LatLng(
  	                      (currTarget.dataset["lat"]),
  	                      (currTarget.dataset["lng"])),
  	                marker = addMarker(placePosition);
  	                panTo(marker["marker"]);
  	                
  	                currTarget.addEventListener("mouseout",() => {
  	                   marker["marker"].setMap(null);
  	                   marker["overlay"].setMap(null);
  	                   markers.pop();
  	                }) 
        		  }
     </script>
  </body>
  </html>