<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>

<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript'>
	function idCheck(){
		$.ajax({
			type : 'POST'
			,url : '${pageContext.request.contextPath}/user/member/idCheck.do'
			,dataType : 'JSON'
			,data : {mem_id : $('#mem_id').val()}
			,error : function(result){
				alert(result.status);
			}
			,success : function(result){
				//{flag : true | false}
				alert(result.flag);
				
			}
		});
	}
	
	function zipcodePopup(){
		// document 팝업 - 모달 : 출력되는 팝업에 존재하는 포커스를 잃지 않으면(팝업종료), 포커스가 이동이 불가.
		// 				  모달리스 : 출력되는 팝업에 존재하는 포커스를 존재해도 자유롭게 포커스가 이동이 가능.
		
		// 아귀먼트 : 1. url
		//		   2. 팝업의 타이틀 : windowName
		//		   3. 옵셥2 (브라우저별 상이)
		//		   4.
		
		var url = '${pageContext.request.contextPath }/user/member/zipcodeSearchForm.do';
		var opts = 'width=400px, height=430px, status=no resizable=no, scrollbars=no'; // status=no 출력안되게 막기 // scrollbars=no 스크롤바 출력 안되게 막기
		window.open(url, '우편번호 검색', opts);
	}
	

	function PicOpenPopup(){
		var url = '${pageContext.request.contextPath }/user/member/picOpen.do';
		var opts = 'width=400px, height=430px, status=no resizable=no, scrollbars=no'; // status=no 출력안되게 막기 // scrollbars=no 스크롤바 출력 안되게 막기
		window.open(url, '이미지 검색', opts);
	}
	
</script>
<body>
<form name="memberForm" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr><td rowspan="13" class="pic" colspan="2" style="vertical-align: bottom; width: 150px; text-align: center;">
			<div id="viewTable"></div>
			<img id="pic" src="" alt="사진을 사이즈에 맞게 올려주세요" 
				style="cursor: pointer; width: 250px; height: 200px"/><br/>
			<img src="${pageContext.request.contextPath }/image/btn_pic.gif" alt="사진올리기" class="btn" title="인적사항에 올릴 증명	을 검색합니다." 
				style="cursor: pointer;" onclick="PicOpenPopup();"/><br/>
			<div style="width: 100%" align="center">
				size : 235x315 이하
			</div>
			<input type="hidden" id="imgsrc" value="" name="mem_image" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">성 명</td>
		<td>
			<input type="text" name="mem_name" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">주민등록번호</td>
		<td>
			<input type="text" name="mem_regno1" size="6" value=""/>
  			<input type="text" name="mem_regno2" size="7" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">생년월일</td>
		<td>
		    <input type="radio" id="solar" value="solar" name="birth"/>양력
			<input type="radio" id="lunar" value="lunar" name="birth"/>음력  
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
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">아이디</td>
		<td>
			<input type="text" id="mem_id" name="mem_id" value="">&nbsp;&nbsp;<b><a href="javascript:idCheck();">[ID 중복검사]</a></b>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호</td>
		<td>
			<input type="text" name="mem_pass" value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호확인</td>
		<td>
			<input type="text" name="mem_pass_confirm" value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<div>
			<input type="hidden" name="mem_hometel"/>
			<select  name="mem_hometel1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>								        	
				<option value="033">033</option>				        	
				<option value="041">041</option>
				<option value="042">042</option>				        	
				<option value="043">043</option>				        	
				<option value="051">051</option>				        	
				<option value="052">052</option>
				<option value="053">053</option>				        					        	
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>				        					        					        	
				<option value="064">064</option>				        					        					        	
				<option value="070">070</option>				        					        					        	
			</select>	- 	
			<input type="text" name="mem_hometel2" size="4" value="" /> - 
			<input type="text" name="mem_hometel3" size="4" value="" />
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>

	<tr>
		<td class="fieldName" width="100px" height="25">회사전화번호</td>
		<td>
			<div>
			<input type="hidden" name="mem_comtel"/>
			<select name="mem_comtel1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>								        	
				<option value="033">033</option>				        	
				<option value="041">041</option>
				<option value="042">042</option>				        	
				<option value="043">043</option>				        	
				<option value="051">051</option>				        	
				<option value="052">052</option>
				<option value="053">053</option>				        					        	
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>				        					        					        	
				<option value="064">064</option>				        					        					        	
				<option value="070">070</option>				        					        					        	
			</select>	- 	
			<input type="text" name="mem_comtel2" size="4" value="" /> - 
			<input type="text" name="mem_comtel3" size="4" value="" />
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">핸드폰</td>
		<td>
			<input type="hidden" name="mem_hp"/>
			<select name="mem_hp1">
				<option value="010">010</option>
				<option value="016">016</option>				        	
				<option value="017">017</option>				        	
				<option value="019">019</option>				        	
			</select>	-
			<input type="text" name="mem_hp2" size="4" value="" /> - 
			<input type="text" name="mem_hp3" size="4" value="" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">이메일</td>
		<td>
			<input type="hidden" name="mem_mail" />
			<input type="text" name="mem_mail1" value="" /> @
			<select name="mem_mail2">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="gmail.com">gmail.com</option>				
			</select>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
		
	<tr>
		<td class="fieldName" width="100px" height="25">주소</td>
		<td>
			<input type="hidden" name="mem_zip" />
			<input type="text" name="mem_zip1" id="mem_zip1" size="3" value="" /> - 
			<input type="text" name="mem_zip2" id="mem_zip2" size="3" value="" />
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button" onclick="zipcodePopup();">우편번호검색</button><br>
			<input type="text" name="mem_add1" id="mem_add1" value="" />
			<input type="text" name="mem_add2" id="mem_add2" value="" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">직 업</td>
		<td>
			<input type="text" name="mem_job" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">취 미</td>
		<td>
			<input type="text" name="mem_like" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">가입하기</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
		</td>
	</tr>
</table>
</form>
</body>

<script type='text/javascript' src='${pageContext.request.contextPath }/js/common/commons.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/common/validation.js'> </script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">


$(function(){
	
	
	
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
	
	

	
	
	$('form[name=memberForm]').submit(function(){
		
		var regno = $('input[name=mem_regno1]').val()+'-'+$('input[name=mem_regno2]').val();
		
		if(!regno.validationREGNO()){ 
			alert('주민등록번호를 제대로 입력해주세요');
			return;
		}
		if($('input[name=mem_name]').val()==""){
			alert('이름을 입력해주세요.');
			return false;
		}
		if($('input[name=mem_regno1]').val()==""){
			alert('주민등록번호를 입력해주세요.');
			return false;
		}
		if($('input[name=mem_regno2]').val()==""){
			alert('주민등록번호를 입력해주세요.');
			return false;
		}
		if($("#year option:selected").text()=="선택하세요"){
			alert('생년월일을 입력해주세요.');
			return false;
		}
		if($("#month option:selected").text()=="선택하세요"){
			alert('생년월일을 입력해주세요.');
			return false;
		}
		if($("#day option:selected").text()=="선택하세요"){
			alert('생년월일을 입력해주세요.');
			return false;
		}
		if($('#memberForm input[name=mem_id]').val()==""){
			alert('아이디를 입력해주세요.');
			return false;
		}
		if($('#memberForm input[name=mem_pass]').val()==""){
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		
		if($('input[name=mem_hometel2]').val()==""){
			alert('전화번호를 입력해주세요.');
			return false;
		}
		if($('input[name=mem_hometel3]').val()==""){
			alert('전화번호를 입력해주세요.');
			return false;
		}
		
		if($('input[name=mem_comtel2]').val()==""){
			alert('회사전화번호를 입력해주세요.');
			return false;
		}
		if($('input[name=mem_comtel3]').val()==""){
			alert('회사전화번호를 입력해주세요.');
			return false;
		}
		if($('input[name=mem_hp2]').val()==""){
			alert('핸드폰번호를 입력해주세요.');
			return false;
		}
		if($('input[name=mem_hp3]').val()==""){
			alert('핸드폰번호를 입력해주세요.');
			return false;
		}
		
		if($('input[name=mem_mail1]').val()==""){
			alert('이메일을 입력해주세요.');
			return false;
		}
		if($('input[name=mem_zip1]').val()==""){
			alert('우편번호를 선택해주세요.');
			return false;
		}
		if($('input[name=mem_zip1]').val()==""){
			alert('우편번호를 선택해주세요.');
			return false;
		}
		if($('input[name=mem_add1]').val()==""){
			alert('주소를 입력해주세요.');
			return false;
		}
		if($('input[name=mem_add2]').val()==""){
			alert('주소를 입력해주세요.');
			return false;
		}
		if($('input[name=mem_job]').val()==""){
			alert('직업을 입력해주세요.');
			return false;
		}
		if($('input[name=mem_like]').val()==""){
			alert('취미를 입력해주세요.');
			return false;
		}
		
		
		
		var mem_bir;
		
		
		//음력
		if($('input:radio[id=lunar]').is(':checked')){
			//mem_birth = 2020101
			var mem_birth = $("#year option:selected").text() + 
					$("#month option:selected").text() +
					$("#day option:selected").text();
		
			 if(gfnIsLeapYear(mem_birth)){ //윤년 = true 
				
				mem_birth = '1'+mem_birth;

			}else{ //평년
				mem_birth = '0'+mem_birth;
			}
			 
			
			 mem_bir = gfnLunar2Solar(mem_birth); //양력날짜로 변경되어들어옴
			 
	
			 var year = mem_bir.substring(0,4);

			 var month = mem_bir.substring(4,6);

			 var day = mem_bir.substring(6,8);
		
			 mem_bir = year+'-'+month+'-'+day;
			 
			 $('input[name=mem_bir]').val(mem_bir); 
			 
			
			
		}


		$(this).attr('action', '${pageContext.request.contextPath}/user/member/insertMemberInfo.do');

		//양력
		if($('input:radio[id=solar]').is(':checked')){
		 mem_bir = $("#year option:selected").text() + '-' +
		 				$("#month option:selected").text() + '-' +
		 					$("#day option:selected").text();
		$('input[name=mem_bir]').val(mem_bir); 
	
		}
		
		if($('#memberForm input[name=mem_pass]').val() != 
			         $('#memberForm input[name=mem_pass_confirm]').val()){
			alert('비밀번호를 확인해주세요.'+$('#memberForm input[name=mem_pass]').val()+'1');
			return false;
		}
		
		
		var mem_hometel = $('select[name=mem_hometel1]').val() + '-' +
		                  $('input[name=mem_hometel2]').val() + '-' +
		                  $('input[name=mem_hometel3]').val();
		$('input[name=mem_hometel]').val(mem_hometel);

		var mem_comtel = $('select[name=mem_comtel1]').val() + '-' +
		                  $('input[name=mem_comtel2]').val() + '-' +
		                  $('input[name=mem_comtel3]').val();
		$('input[name=mem_comtel]').val(mem_comtel);
		
		var mem_hp = $('select[name=mem_hp1]').val() + '-' +
					        $('input[name=mem_hp2]').val() + '-' +
					        $('input[name=mem_hp3]').val();
		$('input[name=mem_hp]').val(mem_hp);

		var mem_mail = $('input[name=mem_mail1]').val() + '@' +
		               $('select[name=mem_mail2]').val();
		$('input[name=mem_mail]').val(mem_mail);
		
		var mem_zip = $('input[name=mem_zip1]').val() + '-' +
		              $('input[name=mem_zip2]').val();
		$('input[name=mem_zip]').val(mem_zip);
		
		return true;
	});
	
	 
	
	
});





</script>
</html>








