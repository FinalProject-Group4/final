<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>로그인</title>
<style>
	#id_area, #pwd_area{
		height: 75px;
	}
	
	#find_info{
		height: 50px;
	}
	
	#login_text{
		text-align: center;
	}
	
	#id_label, #pwd_label{
		line-height: 35px;
		font-size: 20px;
	}
	
	#find_info{
		text-align: right;
	}
	
    .section { border-top: 1px dashed #dadada;}
	
	#h1tag {
	border-bottom: 10px solid #f8e9e2;	
	padding-bottom: 20px;
	margin-top: 40px;
    } 
    
    .btn_login {
    background-color: #f8c7b8;
	color: #464646;
    border: none;
    width: 100%;
    height: 40px;
    font-size: 20px;
    font-family: 'InfinitySans-RegularA1'
    }
    
    .btn_login:hover {background: #ffb3b3; cursor: pointer;}
	
</style>
</head>
<body>

	<c:import url="../common/header.jsp" />
	
	 <section class="section" style="padding-top: 40px;">
	  <div class="container">
		<div class="row">
		   <div class="col-2"></div>
			<div class="col-8" id="login_area">
				<form class="form-signin" action="${pageContext.request.contextPath}/member/login_action.do" method="post">
					<div id="h1tag"><h1 class="h1 font-weight-normal" id="login_text" style="text-align: center; color: black; font-size: 50px;">SIGN IN</h1></div>
					 <br><br>
					<div class="col-8 offset-2" id="id_area">
						<div class="row">
							<div class="col-2" style="padding: 0;">					
								<label for="userId" id="id_label">ID : </label>
							</div>
							<div class="col-10">
								<input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력해 주세요" required autofocus>
							</div>
						</div>
					</div>
					<div class="col-8 offset-2" id="pwd_area">
						<div class="row">
							<div class="col-2" style="padding: 0;">
								<label for="userPwd" id="pwd_label">PW : </label>
							</div>
							<div class="col-10">
								<input type="password"  name="userPwd" id="userPwd" class="form-control" placeholder="비밀번호를 입력해 주세요" required>
							</div>
						</div>
					</div>
						<div class="col-7 offset-3" id="find_info">
							<a href="#" onclick="openWin('id_Find');">아이디 찾기&nbsp; </a> | <a href="#" onclick="openWin('pw_Find');">&nbsp;비밀번호 찾기</a>
						</div>
					   <hr style="background-color: #f8e9e2; height: 10px; margin-bottom: 40px;">
						<div class="col-4 offset-4" id="btn_area">
							<button class="btn_login" type="submit">로그인</button>
						<br><br><br><br>
					</div>
				</form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

	<c:import url="../common/footer.jsp" />

</body>
	<script>
		function openWin(page_info){
			
			var url = "${pageContext.request.contextPath}/member/page_move.do?" + page_info;

			window.open(url,'_blank','menubar=no');
			
		};

		
	</script>
</html>