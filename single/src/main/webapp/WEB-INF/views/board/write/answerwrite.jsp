<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%-- <input type="hidden" name="userId" value="${answerList.userId }">
<input type="hidden" name="replyNum" value="${answerList.replyNum }"> --%>


<div class="row">
	<div class="col-lg-2"></div>
	<div class="col-lg-5"></div>
	<div class="col-lg-5"></div>
</div>
<div class="row">
	<div class="col-lg-2"></div>
	<div class="col-lg-8" style="border: 1px solid #444444;">
		<br> <br>



		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-3">답변쓰기</div>
			<div class="col-lg-8"></div>
		</div>
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<hr style="background-color: #6c757d">
			</div>
			<div class="col-lg-1"></div>
		</div>

		<!-- 글쓰기 -->
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<div class="container">
					<div class="form-group">
						<textarea class="form-control" rows="5" id="replyContent" name="text"></textarea>
					</div>
					<button id="completeBtn" type="button" class="btn btn-primary">완료</button>
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
		<br><br><br>



	</div>
	<div class="col-lg-2"></div>
</div>
<br>