<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/mypageheader.jsp" %>


  <!-- Page Content -->
    <div class="row">

       <div class="leftNav">

        <div class="list-group">	
        <ul>
  <li><a href="/mypage/pickPL" class="list-group-item">찜한장소</a></li>
  <li><a href="/mypage/pickSch" class="list-group-item">찜한일정</a></li>
  <li><a href="/mypage/past" class="list-group-item">지나간여행</a></li>
  <li><a href="/mypage/upcomming" class="list-group-item">다가올여행</a></li>
</ul>
        </div>
        </div>
      <!-- /.col-lg-3 -->
 <div class="content-mypage" style=" padding-top: 20px;">
        <div class="row">
<c:forEach items="${list }" var="sch">
            <div class="card h-100" id="resultcard">
            <a class='move' href='<c:out value="${sch.schNo }"/>'>
           <img class="card-img-top" src="http://placehold.it/700x400" alt="">
           </a>
              <div class="card-body">
                <h4 class="card-title">
                   <a class='move' href='<c:out value="${sch.schNo }"/>'>
                   다가올 <c:out value="${sch.schTitle }"></c:out>
                   </a>
                   
                </h4>
             
             <!-- Like  -->
              </div>
            </div>
</c:forEach>

<form id='actionForm' action="/mypage/upcomming" method='get'>
	<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum }'>
	<input type='hidden' name='amount' value = '${pageMaker.cri.amount }'>
</form>
        </div>
        <!-- /.row -->
 <div style="text-align: center;">
<ul class="pagination">
<c:if test="${pageMaker.prev }">
<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">Previous</a></li>
</c:if>

<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }">
<a href="${num}"> ${num }</a></li>
</c:forEach>

<c:if test="${pageMaker.next }">
<li class="paginate_button next">
<a href="${pageMaker.endPage +1 }">Next</a></li>
</c:if>
</ul>
</div>
      </div> 
      <!-- /.col-lg-9 -->


<script type="text/javascript">
	$(document).ready(function(){
		
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click",function(e){
			
			e.preventDefault();
			
			console.log('click');
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click",function(e){
			
			e.preventDefault();
		actionForm.append("<input type='hidden' name='sch_no' value='"+
				$(this).attr("href")+"'>");
			actionForm.attr("action","/mypage/upcomming/get");
			actionForm.submit();
			
		})
		
	});
	

</script> 
<%@include file="../includes/footer.jsp" %>