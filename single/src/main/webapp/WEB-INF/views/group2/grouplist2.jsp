<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css" >
<%@ include file="/WEB-INF/views/commons/movetop.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_danger.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_success.jsp"%>
<script src="${root}/resources/js/group/group.js"></script>
<c:set var="parameter" value="${requestScope.parameter}"></c:set>


<script>
$(function(){
	var page = "${parameter.page}";
	var key = "${parameter.key}";
	var word = "${parameter.word}";
	var isMyGroup = "${parameter.isMyGroup}";
	var groupCategoryNum = "${parameter.groupCategoryNum}";
	
	//2019-07-12 형태희 추천받기 버튼
	$(".recomandBtn").on("click", function () {
		$.ajax({
			 url : "${root}/group2/grouplist2",
			 method : "get",
			 success : function(result) {
				console.log(result);
				if(isMyGroup == 'yes'){
					//console.log(result);
					$(".group-list").html(result);
					$(".groupcard").click(groupenter);
				}else{
					//console.log(result);
					$(".group-list").html(result);
					$(".groupcard").click(groupcardClick);
				}
			}
			
		});	
	
	});
});


function getGroupList(page, key, word, isMyGroup, groupCategoryNum){
	if(page == null || (typeof page) == "undefined" || page == ""){
		page = "1";
	}
	if(key == null || (typeof key) == "undefined" || key.length == 0){
		key = "";
	}
	if(isMyGroup == null || (typeof isMyGroup) == "undefined"){
		isMyGroup = "";
	}
	if(groupCategoryNum == null || (typeof groupCategoryNum) == "undefined"){
		groupCategoryNum = "";
	}
	
	$.ajax({
		url : "${root}/group/grouplist"
		, method : "get"
		, data : {
			"page" : page
			, "key" : key
			, "word" : word
			, "isMyGroup" : isMyGroup
			, "groupCategoryNum" : groupCategoryNum
		}
		, success : function(result) {
			if(isMyGroup == 'yes'){
				console.log(result);
				$(".group-list").html(result);
				$(".groupcard").click(groupenter);
			}else{
				console.log(result);
				$(".group-list").html(result);
				$(".groupcard").click(groupcardClick);
			}
		}
	});
}
function groupenter(e){
	var groupNum = $(this).attr("data-num");
	location.href = "${root}/group/" + groupNum;
}

function groupcardClick(){
	var groupNum = $(this).attr("data-num");
	$.ajax({
		url : "${root}/group/groupdetail"
		, method : "get"
		, dataType : "json"
		, data : {
			"groupNum" : groupNum
		}
		, success : function(result) {
			//console.log(result);
			groupDetailModalSetting(result);
			$("#groupDetailModal").modal("show");
		}
	});
	
} 

</script>

<%@ include file="groupdetailmodal.jsp"%>
<%@ include file="groupheader.jsp"%>
<%@ include file="groupsearch.jsp" %>

<!-- 여기서부터 실제 데이터 영역 -->
<section class="contents">
	<div class="container">
		<div class="row">
			<h1 class="col-lg-4 col-md-4 col-sm-3 my-4">총 ${requestScope.size} 개의 모임</h1>
			<!-- <div class="btn-group col-lg-8 col-md-8 col-sm-9 right" style="padding: 0px;"> -->
				<c:if test="${!empty sessionScope.userInfo}">
				<div class="col-lg-2 col-md-2 col-sm-3 my-4 category">
					<button type="button" class="btn btn-success mygrouplist">내 모임 보기</button>
				</div>
				</c:if>
				
				<div class="col-lg-2 col-md-2 col-sm-3 my-4 category">
					<button type="button" class="btn btn-primary pagebtn" data-page="create">모임 만들기</button>
				</div>
				
				<c:if test="${!empty sessionScope.userInfo}">
					<div class="col-lg-2 col-md-2 col-sm-3 my-4 category">
						<button type="button"  class="btn btn-info recomandBtn">추천 받기</button>
					</div>
				</c:if>
				<div class="dropdown col-lg-2 col-md-2 col-sm-3 my-4 category">
					<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">카테고리</button>
					<div class="dropdown-menu">
						<a class="dropdown-item">스터디</a> 
						<a class="dropdown-item">취미</a> 
						<a class="dropdown-item">친목도모</a>
						<a class="dropdown-item">맛집탐방</a>
					</div>
				</div>
			<!-- </div> -->
		</div>
		<!-- Marketing Icons Section -->
		<div class="row group-list">
			<!-- 모임 출력 시작 -->
			
			
			
			<!-- 모임 출력 종료 -->
		</div>
	</div>
</section>

<!-- /.container -->

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>