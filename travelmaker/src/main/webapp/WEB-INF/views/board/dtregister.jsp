<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>

<!-- <link rel="stylesheet" href="/resources/css/main.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>

.transit, .distance{
 font-size: 13px;
}

.contents{
	width: 70%;
	margin-top: 50px;
	margin-bottom: 100px;
	margin-left: auto;
	margin-right: auto;

}
.ct_body{
	padding: 30px;
	/* background-image: url('/resources/imgUpload/2020/12/10/ff752342-efbc-4691-b3f5-7d6d5ef9c2fe_다운로드.jpg');  */
	height: 270px;
	background-repeat: no-repeat;
  	background-size: cover;
  	background-position:center center;
  	margin-bottom:10px;
}

/* .form-group input {
    width: 100%;
    margin: 10px 0;
    padding: 7px 10px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 3px;
}
.form-group textarea {
    width: 100%;
    height: 500px;
    margin: 10px 0;
    padding: 5px 10px;
    font-size: 16px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 3px;
}
#form {
    width: 650px;
    margin: 0 auto;
}
.form-group label {
    font-weight: bold;
    font-size: 15px;
} */

.col-25{
  float: left;
  width: 25%;
  margin-top: 6px;

}

.col-75{
  float: left;
  width: 75%;
  margin-top: 6px;


}
/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

.boardcontainer{
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 30px 30px 50px 30px;

}
@media screen and (max-width: 600px) {
  .col-25, .col-75 {
    width: 100%;
    margin-top: 0;
  }
}


.form-control, select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

.boardContents{
	width: 100%;
	height: auto;
	background-color: white;
	display:flex;
}

.mainMsg{
	margin-left: 5%;
}

.mainMsg b{
	font-size:30px;
	color:white;

}


/*스케쥴 */
.schedule_dt_box {
   width: 63%;
}

.schdt_top{
   height: 70px;
   display: flex;
}

.dt_top_left{
   width: 15%;
   background-color: #203341;
   color:white;
    text-align: center;
   line-height: 70px;    
   border-right: 1px solid gray;
}

.dt_top_right{
   border-top: 1px solid gray;
   border-right: 1px solid gray;
   padding-left: 10px;
   width: 85%;
   display: flex;
   justify-content: space-between;
}
.daily_date{
   margin-top: auto;
   margin-bottom: auto;
}

.schdt_bottom{
   height: 100px;
   display:flex;
}
.dt_bottom_left{
   width: 15%;
   text-align: center;
   border-top: 1px solid gray;
   border-left: 1px solid gray;
   border-right: 1px solid gray;
   padding-top: 40px;
}

.daily_count{
   font-size:14px;   
   margin-left:auto;
   margin-right:auto;
   color:white;
   background-color:#203341;
   border-radius: 50%;
   width: 20px;
    height: 20px;
    text-align: center;
}

.dt_bottom_right{
   padding-left: 10px;
   width: 85%;
   line-height: 100px;  
   border-right: 1px solid gray;
   border-top: 1px solid gray;
}
.dt_bottom_right img{
   width: 75px;
   height: 75px;
}   
.dt_box_footer{
   display:flex;
   background-color: #e6e6e6;
   border:1px solid gray;
}
.dt_footer_left{
   width: 15%;
   text-align: center;
}

.dt_footer_right{
   width: 85%;
}

#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  table-layout:fixed;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #203341;
  color: white;
}
#tabletitle{

   text-align:center;
}

.left {
     width: 45%;
     margin-right : 5%;

}

.right {
     width: 50%;

}

.dtbtn { 
	font-size:15px;
	color: black;

	background-color:white;
	border: 1px solid gray;
	border-radius: 14px;
	padding: 5px 20px 5px 20px;
	float: right;
}

.dtbtn:hover{
   background-color: #203341;
   color:white;
}
.flex-container{
	margin-top: 10px;
	border-radius : 5px;
	background-color: white;
	padding: 40px;

}

.select_img{
	text-align:center;
}

.filecontent{

	text-align: center;
}

.imgcontent input{
	margin-top:10px;
	width: 92%;
	height:30px;
}

</style>

  

<div class="contents">
<!--상단 -->

	<div class="boardContents">
	<!-- 좌측 register -->
		<div class="left">
		
		<div class="boardcontainer">
			<form role="form" action="/board/dtregister" method="post" enctype="multipart/form-data">
			
				<div class="row">
				<div class="col-25">
				<label>게시글 제목</label> 
				</div>
				<div class="col-75">
				<input class="form-control" name='boardTitle' value='${board.boardTitle}' readonly="readonly">
			</div>
			</div>

			
				<div class="row">
				<div class="col-25">
				<label>일정명</label>
				</div>
				<div class="col-75">
				<input class="form-control" name='schNo' value='${schedule.schTitle }' readonly="readonly">
				<input type="hidden" name='boardNo' value='${board.boardNo }'>
			</div>
				</div>

				<div class="row">
				<div class="col-25">
					<label>게시글 내용</label>
					</div>
					<div class="col-75">
					<textarea id="boardCon" name="boardCon" style="height:200px"></textarea>
				</div>
				</div>			
				<br>
				사진등록
				<div class="flex-container">
				<button type="button" class="fileAdd_btn dtbtn" >사진추가</button>
						<span id="fileIndex"></span>
			</div>
			
			<br>
				<button id="dtbtn" type="button" onclick="location.href='/board/list'" class="dtbtn btn-default">취소</button>	
				<button id="dtbtn" type="submit" class="dtbtn btn-default" >게시글 등록</button>

				</form>
				</div>
				</div>
			
				
				
	<div class='right'>
		<div class="content_wrap">


<table id="customers">
   <tr id="tabletitle">
      <th><i class="fa fa-calendar"></i>날짜</th>
      <th><i class="fa fa-globe"></i>&nbsp도시</th>
      <th><i class="fa fa-thumb-tack"></i>&nbsp일정</th>
      <th><i class="fa fa-car"></i>&nbsp교통</th>
      <!-- <th><i class="fa fa-bed"></i>&nbsp숙소</th> -->
   </tr>
   
   <c:set var="count" value="0"></c:set>
   <c:forEach items="${Schdt}" begin="0" end="${Schdt.size() }" var="schdt" varStatus="status">
       <c:if test="${Schdt[status.index].SCH_DATE ne Schdt[status.index-1].SCH_DATE  }">
       
          <c:set var="count" value="${count+1 }"/>
          
      <tr>
         <td style="text-align:center;"><fmt:formatDate value="${schdt.SCH_DATE}" type="date" dateStyle="full" /><br>
         DAY<c:out value="${count}"/></td>
         <td><i class="fa fa-map-marker"></i>제주도<br>jeju</td>
         <td>
         <c:set var="dtCnt" value="0"/>
         <c:forEach items="${Schdt }" begin="0" end="${Schdt.size() }" var="dt" varStatus="vs">   
            <c:if test="${schdt.SCH_DATE eq dt.SCH_DATE }">
                      <c:if test="${schdt.SCH_DATE eq dt.SCH_DATE}">
                      <c:set var="dtCnt" value="${dtCnt+1 }"/>
                     <c:out value="${dtCnt }"/>.<c:out value="${dt.FROMTITLE }"/><br>
               </c:if>
               
               <!-- 마지막  -->
            <c:if test="${Schdt[status.index].SCH_DATE ne Schdt[vs.index+1].SCH_DATE}">
            <c:out value="${dtCnt+1}"/>.<c:out value="${dt.TOTITLE }"/>
            
            </c:if>
            </c:if>
         </c:forEach>
         </td>
      <td><c:out value="${schdt.TRANSIT }"/></td>
      <!-- <td></td> -->
      </tr>
   
   </c:if>
   </c:forEach>
</table>
</div>
</div>
	</div>
	</div>

<script type="text/javascript">
$(document).ready(function(){
	fn_addFile();
	function fn_addFile(){
		var fileIndex = 1;
		var contentIndex= 1;
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div class='filecontent'><input type='file' id='boarddtImg' name='file_"+(fileIndex++)+"'>"
			+"<div class='select_img'><img src=''/></div>"		
			+"<div class='imgcontent'><input type='text' name='newContent'/></div>"
			+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div><br>");
		});

	
 		$(document).on("change","#boarddtImg",function(){
 			
 			
 			var tmp = $(this);
			if (this.files && this.files[0]) {
				var reader = new FileReader;
					reader.onload = function(data) {
				tmp.next().children().attr("src", data.target.result)
					.width(300)
					.height(200);
				}
				reader.readAsDataURL(this.files[0]);
				}
			
		}); 
		
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
		
		});
	}
});

</script>