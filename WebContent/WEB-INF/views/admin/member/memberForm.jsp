<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원상세정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css" type="text/css">

<script type='text/javascript' src='${pageContext.request.contextPath }/js/common/validation.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/common/commons.js'> </script>

<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
<link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
<link type="text/css" rel="stylesheet" href="${pagaContext.request.contextPath}/styles/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet" href="${pagaContext.request.contextPath}/styles/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="${pagaContext.request.contextPath}/styles/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pagaContext.request.contextPath}/styles/animate.css">
<link type="text/css" rel="stylesheet" href="${pagaContext.request.contextPath}/styles/all.css">
<%-- <link type="text/css" rel="stylesheet" href="${pagaContext.request.contextPath}/styles/main.css"> --%>
<link type="text/css" rel="stylesheet" href="${pagaContext.request.contextPath}/styles/style-responsive.css">
<link type="text/css" rel="stylesheet" href="${pagaContext.request.contextPath}/styles/zabuto_calendar.min.css">
<link type="text/css" rel="stylesheet" href="${pagaContext.request.contextPath}/styles/pace.css">
<link type="text/css" rel="stylesheet" href="${pagaContext.request.contextPath}/styles/jquery.news-ticker.css">	
	
</head>
<body onload="setInitContents();">

<div class="wrap">	
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">

			<td width="30">&nbsp;</td>
			<td width="790">
				<div id="container">
					<div class="title">회원정보 입력</div>
					<form method="post" name="registMemberForm" action="">
						<table border="0" cellspacing="1" cellpadding="1">
							<tr>
								<th><span class="r">*</span>이름</th>
								<td><input name="mem_name" type="text" id="mem_name" size="20" /></td>
							</tr>
							<tr>
								<th><span class="r">*</span>주민등록번호</th>
								<td>
									<input name="mem_regno1" type="text" id="mem_regno1" size="20" /> - 
									<input name="mem_regno2" type="text" id="mem_regno2" size="20" />
								</td>
							</tr>
							<tr>
								<th><span class="r">*</span>아이디</th>
								<td><input name="mem_id" type="text" id="mem_id" size="20" /></td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호</th>
								<td><input name="mem_pass" type="password" id="mem_pass" size="20" /></td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호 확인</th>
								<td>
									<input name="mem_pass_confirm" type="password" id="mem_pass_confirm" size="20" />
									<span class="result"></span>
							</td>
							</tr>
							<tr>
								<th>이메일 주소</th>
								<td>
									<input name="mem_mail1" type="text" id="mem_mail1" size="20" />@
									<input name="mem_mail2" type="text" id="mem_mail2" size="20" /> 
									<input type="hidden" value="" name="mem_mail">
								</td>
							</tr>
							<tr>
								<th>거주지</th>
								<td>
									<select style="width: 130px; margin-right: 10px;" name="mem_sido" id="sido">
											<option selected="selected">선택하세요</option>
									</select>
									
									<select style="width: 130px;" name="mem_gugun" id="gugun">
										<option selected="selected">선택하세요</option>
									</select>
									<input type="hidden" value="" name="mem_add1">
								</td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td>
									<input name="mem_add2" type="text" id="mem_add2" size="60" />
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><select style="width: 100px;" name="mem_hp1" id="mem_hp1">
										<option selected="selected">선택하세요</option>
									</select> - 
									<input name="mem_hp2" type="text" id="mem_hp2" size="20" /> - 
									<input name="mem_hp3" type="text" id="mem_hp3" size="20" />
									<input type="hidden" value="" name="mem_hp">
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<!-- <input type="radio" name="mem_calendar" value="solar" />양력
									<input type="radio" name="mem_calendar" value="lunar" />음력  -->
									<select style="width: 130px; margin-left: 0px;" name="mem_year" id="year">
										<option selected="selected">선택하세요</option>
									</select> 
									<select style="width: 130px;" name="mem_month" id="month">
										<option selected="selected">선택하세요</option>
									</select> 
									<select style="width: 130px;" name="mem_day" id="day">
										<option selected="selected">선택하세요</option>
									</select>
									<input type="hidden" value="" name="mem_bir">
								</td>
							</tr>
						</table>
						<div style="float: right;">
							<button class="btn2" type="submit" value="회원가입" id="insertMember">회원가입</button>
							<input class="btn2" type="reset" value="취소" />
						</div>
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
<script type="text/javascript">
	$(function() {
		
		var sidoHtml = getSido();
		$('#sido').append(sidoHtml);
		
		var disernNumHtml = settingDisernNum();
		$('#mem_hp1').append(disernNumHtml);
			
		var date = new Date();
		var year = getYearsOptions(date);
		$('#year').append(year);
		
		var month = getMonthOptions();
		$('#month').append(month);
		
		
		// 선택한 월에 따른 마지막 일자 셋팅
		$('#month').on('change', function() {
			$('#day option').remove();
			let selectedDate = new Date($('#year').val(), $('#month').val());
			
			var day = getLastDate(selectedDate);
			var dayNum = "";
			for(var i = 1; i <= day; i++) {
				if(i < 10) {
					dayNum = "<option value='" + i + "'>" + "0" + i + "</option>";
				} else {
					dayNum = "<option value='" + i + "'>" + i + "</option>";
				}
				
				$('#day').append(dayNum);
			};
		});
		
		// 시도 변화에 따른 구군 셀렉트 옵션 셋팅
		$('select[name=mem_sido]').on('change', function(){
			let sido = $('select[name=mem_sido]').val();
			
			var gugunHtml = [];
			gugunHtml = getGugun(sido);
			$('#gugun option').remove();
			
			for(var i = 0; i < gugunHtml.length; i++) {
				var gugun = "<option value='" + gugunHtml[i] + "'>" + gugunHtml[i] + "</option>";
				$('#gugun').append(gugun);
			};
		});
		
		$('input[name=mem_pass_confirm]').keyup(function() {
			let pass = $('input[name=mem_pass]').val();
			let pass_confirm = $('input[name=mem_pass_confirm]').val();
			if(pass == pass_confirm) {
				$('.result').text('비밀번호가 일치합니다.').css('color', 'green');
				passCheck = true;
			} else {
				$('.result').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
				passCheck = false;
			}
		});
		
		var passCheck = false;
		$('form[name=registMemberForm]').submit(function() {
			
		   const mem_id = $('input[name=mem_id]').val();
			   if(!mem_id.validationID()) {
				alert('아이디를 바르게 입력해주세요.');
				return false;
			} 
			
		   const mem_pass = $('input[name=mem_pass]').val();
			   if(!mem_pass.validationPWD()) {
				alert('패스워드를 바르게 입력해주세요.');
				return false;
			} 
			
		   if(!passCheck){
				alert('비밀번호 확인값이 다릅니다.');
				return false;
			}
		   
		   const mailCheck = $('#mem_mail1').val() + "@" + $('#mem_mail2').val();
			if(!mailCheck.validationMAIL()){
				alert("이메일을 바르게 입력해주세요.");
				return false;
			};
		   
		   const gugun = $('#gugun').val();
			if(gugun == '선택하세요'){
				alert('주소를 입력해주세요.');
				return false;
			}
			
		   const add2 = $('#mem_add2').val();
		    if(add2 == ''){
		    	alert('상세주소를 입력해주세요.');
				return false;
		    }
			
		   const dayCheck = $('#day').val();
			if(dayCheck == '선택하세요'){
				alert('생년월일을 입력해주세요.');
				return false;
			}
				   
		   const mem_add1 = $('#sido').val() + " " + $('#gugun').val();
		   const mem_mail = $('#mem_mail1').val() + "@" + $('#mem_mail2').val();
		   const mem_hp = $('#mem_hp1').val() + "-" + $('#mem_hp2').val() + "-" + $('#mem_hp3').val();
		   const mem_bir = $('#year').val() + "/" + $('#month').val() + "/" + $('#day').val();
		   $('input[name=mem_add1]').val(mem_add1);
		   $('input[name=mem_mail]').val(mem_mail);
		   $('input[name=mem_hp]').val(mem_hp);
		   $('input[name=mem_bir]').val(mem_bir);
			
		   $(this).attr('action', '${pageContext.request.contextPath}/user/insertUser.do');
			
		});
	});
	
</script>
</html>