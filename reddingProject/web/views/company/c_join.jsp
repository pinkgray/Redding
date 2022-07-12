<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>REDDING♥</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_join.css">

<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
	</div>
	<br>

	<!-- 멤버 나브 -->
	<div>
		<jsp:include page="/views/member/m_nav.jsp"></jsp:include>
	</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">

			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">

				<div class="com_wrap">
					<h3 align="left" id="com_title">Join us</h3>
					<form action="<%=request.getContextPath()%>/companyjoin.cme"
						method="post" id="CompanyJoin" enctype="multipart/form-data">
						<table class="comTable">
							<tr>
								<td colspan="3" id="com_label">기본 정보</td>
							</tr>
							<tr>
								<td>사업자 등록번호<span id="star">*</span></td>
								<td>
									<div class="fileBox">
										<input type="text" class="fileName" id = "reg_num" name = "reg_num" readonly="readonly">
										<label for="uploadBtn" class="btn_file">찾아보기</label> <input
											type="file" name = "uploadFile" id="uploadBtn" class="uploadBtn">
									</div>
								</td>
							</tr>
							<tr>
								<td>아이디<span id="star">*</span></td>
								<td><input type="text" maxlength="30" name="memberId"
									id="memberId">
									<button type="button" onclick="registerCheckFunction()">중복확인</button>
									<span id="idcheck"></span></td>
							</tr>
							<tr>
								<td>비밀번호<span id="star">*</span></td>
								<td><input type="password" name="memberPwd" id="memberPwd">
									<span id="Spwd1">(8~16자 이상 입력 )</span></td>
								<td></td>
							</tr>
							<tr>
								<td>비밀번호 확인<span id="star">*</span></td>
								<td><input type="password" name="password2" id="password2">
									<span id="Spwd2"></span></td>
								<td></td>
							</tr>
							<tr>
								<td>업체 종류<span id="star">*</span></td>
								<td><input type="radio" name="company_type" id="studio"
									value="스튜디오" checked> <label for="studio">스튜디오</label>
									<input type="radio" name="company_type" id="dress" value="드레스">
									<label for="dress">드레스</label> <input type="radio"
									name="company_type" id="make" value="메이크업"> <label
									for="make">메이크업 & 헤어</label></td>
							</tr>
							<tr>
								<td>업체명<span id="star">*</span></td>
								<td><input type="text" maxlength="30" name="name" id="name"></td>
								<td></td>
							</tr>
							<tr>
								<td>대표자 명<span id="star">*</span></td>
								<td><input type="text" maxlength="30" name="rep_name"
									id="rep_name"></td>
								<td></td>
							</tr>
							<tr>
								<td class="col1">전화번호&nbsp;&nbsp;<span id="star">*</span></td>
								<td class="col2"><input type="text" name="tel1"
									style="width: 60px;"> &nbsp;- <input type="text"
									name="tel2" style="width: 60px;">&nbsp;- <input
									type="text" name="tel3" style="width: 60px;">&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td>주소<span id="star">*</span></td>
								<td><input type="text" id="postcode" placeholder="우편번호"
									name="postcode"> <input type="button"
									onclick="execDaumPostcode()" value="우편번호 찾기" style = "width : 100px;"><br>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" id="address" placeholder="주소"
									name="address"><br></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" id="detailAddress"
									placeholder="상세주소" name="detailAddress"> <input
									type="text" id="extraAddress" placeholder="참고항목"
									name="extraAddress"></td>
							</tr>
							<tr>
								<td>입금계좌<span id="star">*</span></td>
								<td>
									<select name="bankcode" id="bankcode">
										<option value=''>선택하세요</option>
										<option value="003">기업은행</option>
										<option value="004">국민은행</option>
										<option value="011">농협중앙회</option>
										<option value='012'>단위농협</option>
										<option value='020'>우리은행</option>
										<option value='031'>대구은행</option>
										<option value='005'>외환은행</option>
										<option value='023'>SC제일은행</option>
										<option value='032'>부산은행</option>
										<option value='045'>새마을금고</option>
										<option value='027'>한국씨티은행</option>
										<option value='034'>광주은행</option>
										<option value='039'>경남은행</option>
										<option value='007'>수협</option>
										<option value='048'>신협</option>
										<option value='037'>전북은행</option>
										<option value='035'>제주은행</option>
										<option value='064'>산림조합</option>
										<option value='071'>우체국</option>
										<option value='081'>하나은행</option>
										<option value='088'>신한은행</option>
										<option value='209'>동양종금증권</option>
										<option value='243'>한국투자증권</option>
										<option value='240'>삼성증권</option>
										<option value='230'>미래에셋</option>
										<option value='247'>우리투자증권</option>
										<option value='218'>현대증권</option>
										<option value='266'>SK증권</option>
										<option value='278'>신한금융투자</option>
										<option value='262'>하이증권</option>
										<option value='263'>HMC증권</option>
										<option value='267'>대신증권</option>
										<option value='270'>하나대투증권</option>
										<option value='279'>동부증권</option>
										<option value='280'>유진증권</option>
										<option value='287'>메리츠증권</option>
										<option value='291'>신영증권</option>
										<option value='238'>대우증권</option>
								</select>
							</td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" name="accnum" id="accnum"
									placeholder="계좌번호(-없이 적어주세요)"></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" name="accpnm"
									id="accpnm" placeholder="예금주">
								</td>
							<!-- 	<td>
									<input type="checkbox" id="sbm-flag" name="checkacc" style="display:none">
									<label id="sbm-no" style="background:red;color:white;border-radius:3px;padding:3px;">미인증</label>
									<label id="sbm-ok" style="background:green;color:white;border-radius:3px;padding:3px;display:none">인증됨</label>
									<button class="btn btn-primary btn-xs" id="confirmacc" onclick="fnSearchAccessToken()">확인하기</button>
									<button class="btn btn-primary btn-xs" style="display:none" id="changeacc" onclick="">변경하기</button>
								</td>  -->
							</tr>
							<tr>
								<td></td>
								<td><input type = "text" placeholder = "생년월일(ex>971009)" id = "birth"></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<div style = "align:center margin-left : 30%">
									<input type="checkbox" id="sbm-flag" name="checkacc" style="display:none">
									<label id="sbm-no" style="color:red;background:white;border-radius:3px;padding:3px;">미인증</label>
									<label id="sbm-ok" style="color:green;background:white;border-radius:3px;padding:3px;display:none">인증됨</label>
									<button type = "button" class="btn btn-primary btn-xs" id="confirmacc" onclick="fnSearchAccessToken()">확인하기</button>
									<button type = "button" class="btn btn-primary btn-xs" style="display:none" id="changeacc" onclick="">변경하기</button>
									</div>
								</td>
							</tr>
							<tr>
								<td class="col1">이메일&nbsp;&nbsp;<span id="star">*</span></td>
								<td class="col2"><input type="text" name="email1" style = "width:130px">&nbsp;&nbsp;@&nbsp;&nbsp;
									<input type="text" name="email2" id="email2" style = "width:130px">&nbsp;&nbsp;
									<select name="email3" id="email3">
										<option>직접입력</option>
										<option>naver.com</option>
										<option>daum.net</option>
										<option>nate.com</option>
										<option>hotmail.com</option>
										<option>yahoo.com</option>
										<option>empas.com</option>
										<option>korea.com</option>
										<option>gmail.com</option>
								</select>&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="check" id="emailckbtn">인증하기</button>
									<span id="Semailck"></span> <input type="hidden"
									id="email_check" name="email_check" value="인증안됨">
									<input type = "hidden" readonly = "readonly" name = "code_check" id = "code_check" ></td>
							</tr>
							<tr>
								<td colspan="3" id="com_label">추가 정보</td>
							</tr>
							<tr>
								<td>홈페이지</td>
								<td><input type="url" name="homepage" id="homepage"
									value="http://"></td>
							</tr>
							<tr>
								<td>영업시간</td>
								<td><input type="time" name="strartime" id="startime">
									~ <input type="time" name="endtime" id="endtime"></td>
							</tr>
							<tr>
								<td>휴무일</td>
								<td>
									<input type = "checkbox" value = "월" id = "Monday" name = "weekend">
									<label for = "Monday">월</label>
									<input type = "checkbox" value = "화" id = "Tuesday" name = "weekend">
									<label for = "Tuesday">화</label>
									<input type = "checkbox" value = "수" id = "Wednesday" name = "weekend">
									<label for = "Wednesday">수</label>
									<input type = "checkbox" value = "목" id = "Thusday" name = "weekend">
									<label for = "Thusday">목</label>
									<input type = "checkbox" value = "금" id = "Friday" name = "weekend">
									<label for = "Friday">금</label>
									<input type = "checkbox" value = "토" id = "Saturday" name = "weekend">
									<label for = "Saturday">토</label>
									<input type = "checkbox" value = "일" id = "Sunday" name = "weekend">
									<label for = "Sunday">일</label>
								</td>
							</tr>
						</table>
					</form>
					<table>
					<form name="authCodeFrm" id="authCodeFrm" method="GET"
						action="https://testapi.open-platform.or.kr/oauth/2.0/authorize">
					<tbody>
					<tr>
						<th>
						</th>
						<td><span><input type="hidden" id="client_id"
															name="client_id" style="width: 200px"
															value="l7xx9051de32ac3d42d5a56d6b7c5b3b3f26"></span>
					
					</tr>
					</form>
				<tr>
					<th>
					</th>
					<td><span><input type="hidden" id="client_secret"
														name="client_secret" style="width: 200px"
														value="28375a2caae8451e99764e43ad5928c5"></span></td>
				</tr>
				<tr>
					<th>
					</th>
					<td><span><input type="hidden" id="access_token"
														name="access_token" style="background: #e0e0e0"></span> <!-- <button type="button" onclick="fnSearchAccessToken()">토큰발급</button> --></td>
				</tr>
				<tr>
					<th>
					</th>
					<td><span><input type="hidden" class="txt"
														id="bank_code_std" name="bank_code_std"></span></td>
				</tr>
				<tr>
					<th>
					</th>
					<td><span><input type="hidden" class="txt"
														id="account_num" name="account_num"></span></td>
				</tr>
				<tr>
					<th>
					</th>
					<td><span><input type="hidden" class="txt"
														id="account_holder_info" name="account_holder_info"
														value="" /></span>
				
			`	</tr>
				<tr>
					<th>
					</th>
					<td><span style="width: 200px"><input type="hidden"
														class="txt" id="tran_dtime" title="요청일시 입력"
														name="tran_dtime" /></span>
				</tr>
			</tbody>
		</table>
					<br> <br>
					<div class="com_term">
						<input type="checkbox" id="terms_all"> <label
							id="all_check">이용약관,개인정보 처리방침 모두 동의</label> <br> <br> <label>이용약관</label><br>
						<textarea style= "resize:none;" readonly >
기업 회원 약관 (개정 및 적용 2019. 05. 05)
제1조 (목적)
본 약관은 Redding(이하 "회사")이 각각 운영하는 웹사이트(이하 "사이트")를 통해 인터넷 관련 "서비스"를 제공함에 있어, 회사가 제공하는 "서비스"와 관련하여, 이를 이용하는 가입자(이하 "회원" 또는 "기업회원")의 이용조건 및 제반 절차, 기타 필요한 사항을 규정함을 목적으로 한다.

제2조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 아래와 같다.

① "사이트"라 함은 "회사"와 "계열사"가 "서비스"를 "기업회원" 에게 제공하기 위하여 단말기(PC, TV, 휴대형 단말기 등의 각종 유무선 장치를 포함) 등 정보 통신 설비를 이용하여 설정한 가상의 영업장 또는 회사가 각각 운영하는 웹 사이트를 말하며, 아이디 및 비밀번호(이하 "통합 계정")를 이용하여 "서비스"를 제공받을 수 있는 아래의 "사이트"로 정의한다.
1. Redding : www.Redding.co.kr
② "서비스"라 함은 "회사"가 기업(단체, 사업자, 교육기관) 또는 개인이 구인, 구직과 교육을 목적으로 등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를 제공하는 "서비스"와 해당 인터넷 주소에서 제공하는 모든 부대 "서비스"를 말한다.
③ "기업회원"이라 함은 자사의 직접 고용의 목적으로 채용을 원하는 기업이나 헤드헌팅, 아웃소싱, 인재파견, 채용대행 등 인력 중개를 주 목적으로 사업을 수행하는 업체가 본 "서비스"를 이용하기 위하여 동 약관에 동의하고 회사와 이용계약을 체결하여 이용자 ID를 부여받은 기업과 단체를 말한다.
④ "이용자 ID" 또는 "회원 ID"라 함은 "회원"의 식별과 "회원"의 "서비스" 이용을 위하여 "회원"이 선정하고 "회사"가 부여하는 문자와 숫자의 조합을 말한다.
⑤ "비밀번호"라 함은 회사의 "서비스"를 이용하려는 사람이 이용자 ID를 부여받은 자와 동일인임을 확인하고 회원의 권익을 보호하기 위하여 회원이 선정한 문자와 숫자의 조합을 말한다.
제3조 (약관의 명시와 개정)
① "회사"는 이 약관의 내용과 상호, 영업소 소재지, 사업자등록번호, 연락처 등을 이용자가 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 이용자에게 공지해야 한다.
② "회사"는 약관의 규제 등에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용 촉진 및 정보 보호 등에 관한 법률 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있다.
③ "회사"가 약관을 개정할 경우에는 개정 약관 적용일 최소 7일 전(약관의 변경이 소비자에게 불리한 경우에는 30일 전)부터 웹 사이트 초기화면 공지사항 또는 이메일을 통해 고지한다.
④ 이용자는 변경된 약관에 대해 거부할 권리가 있다. "이용자"는 변경된 약관이 공지된 지 15일 이내에 거부 의사를 표명할 수 있다. "이용자"가 거부하는 경우 본 "서비스" 제공자인 "회사"는 15일의 기간을 정하여 "이용자"에게 사전 통지 후 당해 "이용자"와의 계약을 해지할 수 있다. 만약, "이용자"가 거부 의사를 표시하지 않고 "서비스"를 계속 이용하는 경우에는 동의하는 것으로 간주한다.
제4조 (약관 외 준칙)
① 이 약관에서 규정하지 않은 사항에 관해서는 약관의 규제 등에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용 촉진 및 정보 보호 등에 관한 법률 등의 관계법령에 따른다.
② 각 "사이트" 및 "서비스" 이용약관이 별도로 있는 경우에는 해당 "서비스" 이용약관이 우선한다.
③ "회원"이 "회사"와 개별 계약을 체결하여 "서비스"를 이용할 경우에는 개별 계약이 본 약관에 우선한다.
제5조 (이용계약의 성립)
① "회사"의 "서비스" 이용계약(이하 "이용계약"이라 한다)은 "서비스"를 이용하고자 하는 자의 본 약관과 개인정보 처리방침의 내용에 대한 동의 및 이용 신청(회원가입신청)에 대하여 "회사"가 승낙함으로써 성립한다.
② "서비스"를 이용하고자 하는 자가 이용 신청 당시 웹상의 "동의함" 버튼을 누르면 본 약관 및 개인정보 처리방침에 대하여 동의한 것으로 간주한다.
③ 제1항의 승낙은 이용 신청자의 본 약관에 대한 동의를 확인하고 전자메일 또는 서면으로 통지함으로써 이루어지고 이러한 승낙의 통지가 이용 신청자에게 도달하면 이용계약이 성립한다.
제6조 (서비스 이용 신청)
① "회원"으로 가입하여 본 "서비스"를 이용하고자 하는 이용 고객은 본 약관 외 개인정보 처리방침에서 정한 필수 수집항목 등을 제공하여야 한다.
② 모든 "회원"은 반드시 "회원" 인증 (휴대폰 인증 또는 아이핀 인증)을 거쳐야 하며, 회사명과 사업자등록번호를 제공하여야만 "서비스"를 이용할 수 있다. 회원 인증을 하지 않았거나 회사명과 사업자등록번호를 허위로 등록한 경우, 사용자는 일체의 권리를 주장할 수 없다.
③ "회사"는 타인의 명의를 도용하여 이용 신청을 한 "회원"의 모든 ID를 삭제 조치하고, 관계법령에 따라 처벌을 요구할 수 있다.
④ 사업자등록번호가 없는 기관이나 단체는 "회사"가 정한 별도의 절차에 따라 이용 신청을 할 수 있다.
제7조 (이용 신청의 승낙과 제한)
① "회사"는 전조의 규정에 의한 이용 신청 고객에 대하여 업무 수행상 또는 기술상 지장이 없는 경우에는 원칙적으로 접수 순서에 따라 "서비스" 이용을 승낙한다.
② "회사"는 아래 사항에 해당하는 경우에 대해서는 이용 신청을 승낙하지 아니한다.
1. 실제 회사명과 사업자등록번호가 아니거나 타사의 정보를 이용하여 신청한 경우
2. 이용계약 신청서의 내용을 허위로 기재한 경우
③ "회사"는 "회원"의 회사명과 사업자등록번호 허위 여부를 판단하기 위해 사업자등록증 송부를 요구할 수 있으며, 이에 응하지 않을 경우 "회사"는 임의로 "회원"의 ID를 삭제할 수 있다.
④ "회사"는 아래 사항에 해당하는 경우에는 그 신청에 대하여 승낙 제한 사유가 해소될 때까지 승낙을 유보할 수 있다. 다만, 이러한 경우에는 그 사유를 고지하여야 한다.
1. 회사가 설비의 여유가 없는 경우
2. 회사의 기술상 지장이 있는 경우
3. 기타 회사의 사정(회사의 귀책사유 있는 경우도 포함)으로 이용 승낙이 곤란한 경우
제8조 (서비스의 내용)
① "회사"는 제2조 2항의 "서비스"를 제공할 수 있으며 그 내용은 다음 각 호와 같다.
1. 채용정보 등록 서비스
2. 온라인 채용관리 서비스
3. 구인/구직과 관련된 제반 서비스
4. 이력서 열람 서비스
5. 이용자 간의 교류와 소통과 관련된 서비스
6. 자료 거래에 관련된 서비스
7. 기타 회사가 추가 개발하거나 제휴 계약 등을 통해 회원에게 제공하는 일체의 서비스
② "회사"는 필요한 경우 "서비스"의 내용을 추가 또는 변경할 수 있다. 다만, 이 경우 "회사"는 "회원"의 권리 또는 의무에 영향을 주는 경우 추가 또는 변경 내용을 "회원"에게 공지해야 한다.
제9조 (기업정보, 채용공고 등록, 이력서 검색)
① "기업회원"은 구직을 원하는 "개인회원"이 채용공고를 열람한 후 해당 기업에 대한 판단을 돕기 위해 기업정보를 정확히 기재하여야 하며, 회사는 기업정보 상세보기 하단에 명시된 업체와의 제휴를 통해 추가적인 "기업정보"를 "개인회원"에게 제공할 수 있다.
② "기업회원"은 직업안정법 제34조 및 동법 시행령 제34조 거짓 구인공고의 범위에 위배되지 않도록 채용공고를 작성하여 등록해야 하며 거짓 구인공고의 범위는 다음과 같다.
1. 구인을 가장하여 물품 판매, 수강생 모집, 직업소개, 부업알선, 자금 모집 등을 행하는 공고
2. 거짓 구인을 목적으로 구인자의 신원(업체명 또는 성명)을 표시하지 아니하는 공고
3. 구인자가 제시한 직종, 고용형태, 근로조건 등이 응모할 때의 그것과 현저히 다른 공고
4. 기타 공고의 중요 내용이 사실과 다른 공고
5. 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우
6. 공공질서 및 미풍양속에 위반되는 내용인 경우
7. 현행법에 위배되는 내용이나 범죄적 행위에 결부된다고 인정되는 내용일 경우
8. 회사의 저작권 또는 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
9. 게시판의 성격에 부합하지 않는 게시물의 경우
10. 기타 관계 법규에 위배되는 내용이나, 사이트의 원활한 운영을 위하여 운영자가 필요하다고 판단한 경우
③ "기업회원"은 남녀 고용 평등과 일, 가정 양립 지원에 관한 법률 제7조에 의거하여 근로자의 모집 및 채용에 있어서 남녀를 차별하여서는 아니 된다.
④ 제2항, 제3항을 위반한 경우 이에 대한 책임은 전적으로 "기업회원"에게 있다.
⑤ "회사"는 "기업회원"이 등록한 기업정보 및 채용공고를 "회사"가 정한 방법에 의해 노출할 수 있으며, "회사"가 지정한 기간이 지난 채용공고는 "회사"가 임의로 마감시킬 수 있다.
⑥ "기업회원"은 유/무료로 사람인 "개인회원"이 등록한 이력서를 검색할 수 있으며 "회사"가 제시하는 별도의 커뮤니케이션을 통하여 "개인회원"에게 연락을 취할 수 있다. 단, 이력서 연락처의 열람 및 연락의 목적은 직원 채용활동에 국한되어야 하며, 기업의 영업ㆍ마케팅ㆍ제3자 제공 시에는 개인정보보호법, 직업안정법, 정보통신망 이용 촉진 및 정보 보호 등에 관한 법률에 의거하여 법적 책임을 질 수 있다.
⑦ "회사"는 "기업회원"이 이력서를 검색하고, "개인회원"에게 연락할 수 있는 권한에 제한을 둘 수 있으며, "기업회원"이 적절하지 않은 방법으로 "개인회원"에게 연락하거나, "개인회원"에게 불편을 끼친 경우, 채용공고 및 회원정보를 임의로 수정/삭제할 수 있다.
제10조 (제휴를 통한 서비스)
① "회사"는 제휴 관계를 체결한 여타 인터넷 웹 사이트 또는 신문, 잡지 등의 오프라인 매체를 통해 "사이트"에 등록한 "기업회원"의 기업정보와 채용공고가 열람될 수 있도록 "서비스"를 제공할 수 있다.
② "회사"는 제휴를 통해 타 사이트 및 매체에 등록될 수 있음을 고지하고 동의를 받아야 하며, 제휴 "사이트" 전체 목록을 "사이트" 내에서 상시 열람할 수 있도록 해야 한다.
제11조 (서비스의 요금)
① "기업회원" 가입과 채용공고 등록비용은 무료이다. 다만 "개인회원" 또는 "사이트"에 방문한 "회원"에게 자신의 정보를 보다 효과적으로 노출시키기 위한 유료 옵션과 유료 이력서 검색 및 기타 "서비스"를 이용하기 위한 별도의 "서비스"는 유료로 제공될 수 있다.
② "회사"는 유료 "서비스"를 제공할 경우 "사이트"에 요금에 대해서 공지를 하여야 한다.
③ "회사"는 유료 "서비스" 이용금액을 "서비스"의 종류 및 기간에 따라 "회사"가 예고 없이 변경할 수 있다. 다만, 변경 이전에 적용 또는 계약한 금액은 소급하여 적용하지 아니한다.
제12조 (S-포인트의 이용)
① S-포인트는 사람인 "사이트" 내에서만 적립 및 사용이 가능하며, 유료 "서비스" 결제 및 입금 완료 후 실 결제금액에서 차등 적립된다. 이 외 이벤트/프로모션 등으로 적립될 수 있으며 적립률은 변동될 수 있다.
② 적립된 S-포인트는 유료 "서비스" 결제시 현금처럼 사용 가능하다. (1포인트=1원) 단, S-포인트는 현금으로 출금할 수 없다.
③ 위의 적립 사유가 해제되었을 경우 적립된 S-포인트를 "회원" 보유분에서 회수하며, 중도 환불이 아닌 경우 사용한 S-포인트를 재 적립 받을 수 있다. 이때, 회수할 S-포인트가 없을 경우 차후 결제건을 취소하거나 최종 환불금액에서 차감한다.
④ S-포인트의 이용은 "서비스" 운영 정책에 따라 유료 "서비스"별 적립기준, 적립률, 사용조건 및 제한 등은 달라질 수 있으며, 이에 대한 사항은 "서비스" 화면에 게시하거나 메일로 공지한다.
⑤ S-포인트 적립 시 별도의 유효기간을 정한 바가 없으면 적립일로부터 1년(365일)의 유효기간을 가지며, 별도의 유효기간이 설정된 경우 그 기간에 따른다.
⑥ S-포인트는 유효기간이 지나거나, "회원"이 선택한 개인정보 보유기간 동안 "사이트"에 로그인하지 않을 경우, "회원"이 가입을 해지한 경우, 제20조 ③항에 의해 가입 해지하거나 "서비스"가 중지된 경우 S-포인트는 전액 자동 소멸되어 복구되지 않으며, 재가입한 아이디(ID)로 이관되지 않는다. 또한, 동일회사가 두 개 이상의 아이디(ID)를 사용할 경우 특정 아이디(ID)로 S-포인트를 통합하여 사용할 수 없다.
제13조 (서비스 이용시간)
① "회사"는 특별한 사유가 없는 한 연중무휴, 1일 24시간 "서비스"를 제공한다. 다만, "회사"는 "서비스"의 종류나 성질에 따라 제공하는 "서비스" 중 일부에 대해서는 별도로 이용시간을 정할 수 있으며, 이 경우 "회사"는 그 이용 시간을 사전에 "회원"에게 공지 또는 통지하여야 한다.
② "회사"는 자료의 가공과 갱신을 위한 시스템 작업시간, 장애 해결을 위한 보수작업 시간, 정기 PM 작업, 시스템 교체 작업, 회선 장애 등이 발생한 경우 일시적으로 "서비스"를 중단할 수 있으며 계획된 작업의 경우 공지란에 "서비스" 중단 시간과 작업 내용을 알려야 한다.
제14조 (서비스 제공의 중지)
① "회사"는 다음 각 호에 해당하는 경우 "서비스"의 제공을 중지할 수 있다.
1. 설비의 보수 등 회사의 필요에 의해 사전에 회원들에게 통지한 경우
2. 기간통신사업자가 전기통신서비스 제공을 중지하는 경우
3. 기타 불가항력적인 사유에 의해 서비스 제공이 객관적으로 불가능한 경우
② 전항의 경우, "회사"는 기간의 정함이 있는 유료 "서비스" 이용자들에게는 그 이용기간을 연장하는 등의 방법으로 손실을 보상하여야 한다.
제15조 (정보의 제공 및 광고의 게재)
① "회사"는 "회원"에게 "서비스" 이용에 필요가 있다고 인정되거나 "서비스" 개선 및 회원 대상의 "서비스" 소개 등의 목적으로 하는 각종 정보에 대해서 전자우편이나 서신 우편을 이용한 방법으로 제공할 수 있다.
② "회사"는 제공하는 "서비스"와 관련되는 정보 또는 광고를 "서비스" 화면, 홈페이지 등에 게재할 수 있으며, "회원"들에게 메일을 통해 알릴 수 있다.
③ "회사"는 "서비스"상에 게재되어 있거나 본 "서비스"를 통한 광고주의 판촉활동에 "회원"이 참여하거나 교신 또는 거래를 함으로써 발생하는 모든 손실과 손해에 대해 책임을 지지 않는다.
④ 본 "서비스"의 "회원"은 "서비스" 이용 시 노출되는 광고 게재에 대해 동의하는 것으로 간주한다.
제16조 (자료 내용의 책임과 회사의 정보 수정 권한)
① 자료 내용은 "회원"이 등록한 기업정보 및 채용공고와 "사이트"에 게시한 게시물을 말한다.
② "회원"은 자료 내용 및 게시물을 사실에 근거하여 성실하게 작성해야 하며, 만일 자료의 내용이 사실이 아니거나 부정확하게 작성되어 발생하는 모든 책임은 "회원"에게 있다.
③ 모든 자료 내용의 관리와 작성은 "회원" 본인이 하는 것이 원칙이나 사정상 위탁 또는 대행 관리를 하더라도 자료 내용의 책임은 "회원"에게 있으며 "회원"은 주기적으로 자신의 자료를 확인하여 항상 정확하게 관리가 되도록 노력해야 한다.
④ "회사"는 "기업회원"이 등록한 자료 내용에 오자, 탈자 또는 사회적 통념에 어긋나는 문구가 있을 경우 이를 언제든지 수정할 수 있다.
⑤ "회사"는 "회원"이 등록한 자료를 "회사"가 운영하는 같은 목적의 타 "사이트"에도 게재할 수 있다.
⑥ "회원"이 등록한 자료로 인하여 타인(또는 타법인)으로부터 허위사실 및 명예훼손 등으로 삭제요청이 접수된 경우 "회사"는 "회원"에게 사전 통지 없이 본 자료를 삭제할 수 있으며, 자료 삭제후 메일 등의 방법으로 "회원"에게 통지할 수 있다.
제17조 (자료 내용의 활용 및 온라인 입사 지원 정보)
① "기업회원"이 입력한 정보는 채용 및 고용동향 통계 자료로 활용될 수 있으며 채용공고는 매체를 통해 언론에 배포될 수 있다. 단, 활용되는 정보 중 개인을 식별할 수 있는 정보는 제외된다.
② "회사"는 "사이트"의 온라인 입사 지원 시스템을 통해 지원한 "개인회원"이 자신의 이력서 열람 여부 및 지원자 통계 자료를 "개인회원"에게 제공할 수 있다.
③ "회사"가 작성한 게시물 또는 저작물에 대한 저작권 및 기타 지적 재산권은 "회사"에 귀속한다.
④ "회원"이 "사이트" 내에 게시한 게시물의 저작권은 "회원"에게 귀속된다. 단, "회원"은 자신이 창작, 등록한 게시물에 대해 무상의 비독점적 사용권을 "회사"에 부여하고, 이 사용권은 "회사"가 "사이트"를 운영하는 동안 계속 유효하며, "회원" 탈퇴한 후에도 이와 같다.
⑤ 게시물에 대한 권리와 책임은 게시물을 게시한 "회원"에게 있으며, "회사"는 "회원"의 동의 없이 이를 "회사"가 운영하는 "사이트" 이외에 영리적 목적으로 사용할 수 없다. 단, 비영리적인 경우에는 해당되지 않는다.
⑥ "사이트"에서 정당한 절차를 거쳐 "기업회원"이 열람한 개인 "회원"의 이력서 정보는 해당 기업의 인사 자료이며, 이에 대한 관리 권한은 해당 기업의 정책에 따른다.
제18조 (회사의 의무)
① "회사"는 본 약관에서 정한 바에 따라 계속적, 안정적으로 "서비스"를 제공할 수 있도록 최선의 노력을 다해야 한다.
② "회사"는 "서비스"와 관련한 회원의 불만사항이 접수되는 경우 이를 지체없이 처리하도록 노력하여야 하며, 즉시 처리가 곤란한 경우에는 그 사유와 처리 일정을 "서비스" 화면 또는 기타 방법 등을 통해 동 "회원"에게 통지하여야 한다.
③ "회사"는 유료 결제와 관련한 결제사항 정보를 1년 이상 보존한다. 다만 "회원" 자격이 없는 "회원"은 예외로 한다.
④ 천재지변 등 예측하지 못한 일이 발생하거나 시스템의 장애가 발생하여 "서비스"가 중단될 경우 이에 대한 손해에 대해서는 "회사"가 책임을 지지 않는다. 다만 자료의 복구나 정상적인 "서비스" 지원이 되도록 최선을 다할 의무를 진다.
⑤ "회원"의 자료를 본 "서비스" 이외의 목적으로 제3자에게 제공하거나 열람하게 할 경우에는 반드시 "회원"의 동의를 얻어야 한다.
⑥ "기업회원"이 "사이트"에 등록한 기업정보, 채용공고 내용은 "사이트"를 방문하는 일반 대중에게 공개함을 원칙으로 하며 "회사"는 공개 기간을 지정할 수 있다. 단, 일부 비공개 항목은 "사이트"에서 제시하는 별도의 옵션을 통해 지정할 수 있으며, "회사"는 이 항목에 대한 비공개 의무를 진다.
⑦ 구직자의 정보의 정확성은 구인자가 직접 확인하여야 하며 "회사"는 이와 관련하여 어떠한 책임도 지지 아니한다.
제19조 (회원의 의무)
① "회원"은 관계법령과 본 약관의 규정 및 기타 "회사"가 통지하는 사항을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 해서는 안 된다.
② "회원"이 신청한 유료 "서비스"는 등록 또는 신청과 동시에 "회사"와 채권, 채무 관계가 발생하며, "회원"은 이에 대한 요금을 지정한 기일 내에 납부하여야 한다.
③ "회원"이 결제수단으로 신용카드를 사용할 경우 비밀번호 등 정보 유실 방지는 "회원" 스스로 관리해야 한다. 단, "사이트"의 결함에 따른 정보 유실의 발생에 대한 책임은 "회원"의 의무에 해당하지 아니한다.
④ "회원"은 "서비스"를 이용하여 얻은 정보를 "회사"의 사전동의 없이 복사, 복제, 번역, 출판, 방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다.
⑤ "회원"은 본 "서비스"를 건전한 구인 구직 이외의 목적으로 사용해서는 안되며 이용 중 다음 각 호의 행위를 해서는 안 된다.
1. 다른 회원의 아이디를 부정 사용하는 행위
2. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
3. 타인의 명예를 훼손하거나 모욕하는 행위
4. 타인의 지적 재산권 등의 권리를 침해하는 행위
5. 해킹 행위 또는 바이러스의 유포 행위
6. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 계속적으로 전송하는 행위
7. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있다고 판단되는 행위
8. 사이트의 정보 및 서비스를 이용한 영리 행위
9. 그밖에 선량한 풍속, 기타 사회질서를 해하거나 관계법령에 위반하는 행위
⑥ "기업회원"은 "사이트"를 통해 열람한 이력서 정보를 "회사" 및 당사자의 허락 없이 재배포할 수 없으며 본 정보에 대한 출력 및 복사 등의 관리 책임은 전적으로 "기업회원"에게 있다.
제20조 (회원의 가입해지/서비스 중지/자료 삭제)
① "기업회원"이 가입 해지를 하고자 할 때는 고객센터 또는 "기업회원 탈퇴” 메뉴를 이용해 해지 신청을 해야 한다. 이때 "회원"은 사람인에 대해 개별 또는 일괄 탈퇴 여부를 선택할 수 있다.
② "회원"이 계약을 해지할 경우, 관련 법 및 개인정보 처리방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸된다.
③ 다음의 사항에 해당하는 경우 "회사"는 사전 동의 없이 가입해지나 "서비스" 중지, 채용공고 삭제 조치를 취할 수 있다.
1. 회원의 의무를 성실하게 이행하지 않았을 때
2. 규정한 유료 서비스 이용 요금을 납부하지 않았을 때
3. 본 서비스 목적에 맞지 않는 분야에 정보를 활용하여 사회적 물의가 발생한 때
4. 회원이 등록한 정보의 내용이 사실과 다르거나 조작되었을 때
5. 동일 회원 ID로 게재 중인 동일 내용 채용공고를 중복 등록했을 때
6. 동일 기업이 특별한 이유 없이 중복 가입했을 때
7. 허위 채용공고를 등록했을 때
8. 지사, 지점, 영업소 등의 경우 구체적인 지사, 지점, 영업소 명칭을 사용하지 않고 기업명을 등록했거나 지사, 지점, 영업소의 사업자등록번호가 별도 있음에도 불구하고 본사의 사업자등록번호로 기업회원 가입을 했을 때
9. 사업자등록증에 나타난 정보와 기업회원 가입 시의 정보가 일치하지 않을 때
10. 모집요강에 적합한 분류를 지정하지 않았을 때. 특히, 교육기관이나 이벤트 업체 또는 영업대행 기관의 경우 영업, 마케팅, 텔레마케팅, 상담 인력을 모집하고자 할 경우 반드시 텔레마케팅 또는 고객상담, 교육/강사/학원 등 반드시 직접 관련되는 해당 업종, 직종 분류만 지정해야 한다.
11. 기업회원 가입 또는 채용공고 등록 시 본 서비스에서 안내하는 방법으로 가입하지 않았거나 등록하지 않았을 때
12. 추천인 모집 공고, 재택 쇼핑몰 분양 공고, 직업소개, 부업알선 공고를 등록했을 때
13. 임금체불 사실이 접수되었거나 근로 감독원에 진정서가 접수되어 있는 기업
14. 구직자의 불편&피해사례 (채용공고를 통해 구직자가 입사 과정에서 피해가 발생한 경우 또는 재직 중 기업회원이 관계법령을 위반하여 피해가 발생한 경우 등)가 접수된 채용공고
15. 기타 본 서비스 명예를 훼손하였거나 회사가 판단하기에 적합하지 않은 목적으로 회원가입을 하였을 때
16. 불순한 의도로 유료 서비스를 반복적으로 결제/취소할 때
17. 타 기업의 사업자등록번호나 상호를 도용하여 허위로 기업정보를 등록하거나 휴·폐업 사업자등록번호로 기업정보를 등록했을 때
18. 회사명, 담당자 성명, 사무실 연락처 등 구인업체의 중요 정보를 정확하게 기입하지 않았을 때
19. 동일 사업자가 마감일이 지나지 않은 동일 내용의 채용공고를 다수 ID를 사용하여 중복 등록했을 때
20. 작성자가 제시한 직종, 업무내용, 근로조건 등이 실제와 현저히 다를 때
21. 채용공고의 모집요강만으로 업무에 대한 내용이 명확하지 않을 때
22. 다단계, 피라미드 식의 모집 내용을 등록했을 때
23. 구인을 가장하여 유학알선, 물품 판매, 자금 모금 등을 행하는 내용을 등록했을 때
24. 회원 모집 형태의 공고 또는 카드 회원 모집(수당제공고) 내용을 등록했을 때
25. 취업 수수료 등 취업 관련 비용을 필요로 하는 채용공고를 등록했을 때 (운송, 물류, 지입, 인력 용역 등)
26. 불건전한 내용의 유흥업소 채용공고를 등록했을 때
27. 동업자 모집, 프랜차이즈 모집, 점포 개설, 창업, 사이트 홍보 등 직원 채용이 아닌 공고를 등록했을 때
28. 기타 관계 법규에 위배되는 내용이거나 사이트의 원활한 운영을 위하여 운영자가 필요하다고 판단한 경우
29. 메일이나 문자메시지 수신자가 스팸으로 신고하거나 회원이 발송하는 메시지가 불법 스팸임이 판명될 경우
30. 방송통신위원회 또는 한국정보보호진흥원이 불법 스팸 전송 사실을 확인하여 이용 정지를 요청하는 경우
31. 미래창조과학부(거짓으로 표시된 전화번호로 인한 이용자 피해 예방에 관한) 고시 제2015-32호 제10조 제1항에 따라 미래창조과학부 또는 중앙전파관리소, 한국 인터넷진흥원(KISA)에서 번호 변작 등으로 판명되어 이용 정지를 요청한 경우
32. 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우
33. 공공질서 및 미풍양속에 위반되는 내용인 경우
34. 회사의 저작권 또는 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
35. 게시판의 성격에 부합하지 않는 게시물의 경우
④ "기업회원"이 유료 "서비스"를 이용하는 중 "회사"의 책임에 의해 정상적인 "서비스"가 제공되지 않을 경우 "회원"은 본 "서비스"의 해지를 요청할 수 있으며 "회사"는 해지일까지 이용일 수를 1일 기준금액으로 계산하여 이용금액을 공제후 환급한다.
⑤ "회사"는 회원 가입이 해제된 경우에 해당 "회원"의 정보를 임의로 삭제할 수 있다.
⑥ "회원"인 개인사업자와 법인사업자의 휴·폐업 여부가 "회사"가 정한 별도의 절차에 따라 확인된 경우 건별 인재정보 열람 상품의 적립된 건수는 모두 소멸된다.
제21조 (손해배상)
① "회사"가 이 약관의 제8조, 제18조, 제20조 규정에 위반한 행위로 이용자에게 손해를 입히거나 기타 "회사"가 제공하는 모든 "서비스"와 관련하여 "회사"의 책임 있는 사유로 인해 이용자에게 손해가 발생한 경우 "회사"는 그 손해를 배상하여야 한다.
② "회원"이 이 약관의 제6조, 제19조, 제20조 규정에 위반한 행위로 "회사" 및 제3자에게 손해를 입히거나 "회원"의 책임 있는 사유에 의해 "회사" 및 제3자에게 손해를 입힌 경우에는 "회원"은 그 손해를 배상하여야 한다.
③ "회사"는 "회원"이 "서비스"를 이용하여 기대하는 수익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않으며, "회사"가 무료로 제공하는 "서비스"의 이용과 관련하여 개인정보 처리방침에서 정하는 내용에 위반하지 않은 한 어떠한 손해도 책임지지 않는다.
④ "회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우 "서비스" 제공에 관한 책임이 면제된다.
⑤ "회사"는 "서비스" 이용과 관련하여 "회원"에게 발생한 손해 가운데 "회원"의 고의, 과실 및 "회원"의 귀책사유로 인한 "서비스" 이용의 장애 및 손해에 대하여는 책임을 지지 않는다.
제22조 (이용요금 오류의 조정)
"회사"는 이용요금에 오류가 있는 경우 이용자의 요청, 또는 "회사"의 사전 통지에 의하여 다음에 해당하는 조치를 취한다.

① 과다 납입한 요금에 대해서는 과 납입 금액을 환불하며, 이용자가 동의할 경우 다음 달에 청구할 요금에서 해당 금액만큼을 감하여 청구한다.
② 요금을 환불받아야 할 이용자가 요금 체납이 있는 경우에는 환불해야 할 요금에서 이를 우선 공제하고 반환한다.
③ "회사"는 과소 청구액에 대해서는 익월에 합산 청구한다.
제23조 (허위 구인공고 경고)
허위 구인공고 또는 허위 구인 조건을 제시한 자는 직업 안정 법 제47조에 의해 5년 이하의 징역 또는 2천만 원 이하의 벌금형을 받을 수 있으며, "회사"는 이를 직권으로 고발할 수 있다.
제24조 (신용 정보의 제공 활용 동의)
① "회사"가 회원가입과 관련하여 취득한 "회원"의 신용 정보를 타인에게 제공하거나 활용하고자 할 때에는 신용 정보의 이용 및 보호에 관한 법률 제32조의 규정에 따라 사전에 그 사유 및 해당기관 또는 업체명 등을 밝히고 해당 "회원"의 동의를 얻어야 한다.
② 본 "서비스"와 관련하여 "회사"가 "회원"으로부터 신용 정보 이용 및 보호에 관한 법률에 따라 타인에게 정보제공 활용에 동의를 얻은 경우 "회원"은 "회사"가 신용 정보 사업자 또는 신용 정보 집중기관에 정보를 제공하여 "회원"의 신용을 판단하기 위한 자료로 활용하거나, 공공기관에서 정책자료로 활용되도록 정보를 제공하는 데 동의한 것으로 간주한다.
제25조 (분쟁의 해결)
① "회사"와 "회원"은 "서비스"와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다.
② 전항의 노력에도 불구하고, "회사"와 "회원" 간에 발생한 전자거래 분쟁에 관한 소송은 제소 당시의 "회원"의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방 법원의 전속 관할로 한다. 다만, 제소 당시 "회원"의 주소 또는 거소가 분명하지 아니하거나, 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기한다.
제26조 (서비스 환불)
① "회사"는 원칙적으로 "서비스" 이용료를 환불하지 않는다. 특히, 다음 각 호의 경우는 이용료 환불 불가 외에 다른 제재 조치를 취할 수 있다.
1. 회원이 서비스 이용규정 위반이 명백한 경우
2. 기업회원 약관 제20조에 의거 회원이 불량 공고를 등록하고 유료 서비스를 신청한 경우
② "회사"는 다음 각 호에 경우에는 이용료를 환불할 수 있다.
1. 유료 서비스 이용이 개시되지 않은 경우
2. 네트워크 또는 시스템 장애로 서비스 이용이 불가능한 경우
③ 이용료를 환불받고자 하는 "회원"은 "회사"에 유선 상의 방법으로 환불을 요청해야 한다.
④ "회사"는 "회원"으로부터 전항의 요청을 받는 즉시 사실 확인 후, 환불 요건에 부합하는 경우 정당한 사유 없이 이용료 환불을 거부할 수 없다.
2019.05.05
Redding        
          </textarea>
						<div id="terms">
							이용약관에 동의하십니까?&nbsp;&nbsp; <input type="checkbox" id="condition1">동의함
						</div>
						<br> <br> <label>개인정보처리방침</label><br>
						<textarea style= "resize:none;"  readonly>
1. 개인정보 수집 및 이용 현황
가. 회사는 서비스 제공을 위한 최소한의 범위 내에서 이용자의 동의 하에 개인정보를 수집하며, 수집한 모든 개인정보는 고지한 목적 범위 내에서만 사용됩니다. 또한, 제공하는 서비스(채용 정보제공 등) 특성상 「근로기준법」에 따라 만15세 미만인 경우 회원가입을 허용하지 않습니다. 회사에서 제공하는 서비스 유형에 따라 다음과 같이 개인정보를 수집, 이용, 보유 및 파기하고 있습니다.

개인회원

수집방법	수집항목	수집 및 이용목적
회원가입	(필수)
아이디, 비밀번호, 이름, 휴대폰번호, 생년월일, 이메일	본인 확인 및 가입의사 확인, 상담 및 문의처리, 회원 맞춤형 채용정보 제공(맞춤채용, 오늘의 공채, 사람인 추천, 매칭연구소 추천, 관심기업)
(선택)
본인확인값(CI, DI) 또는 아이핀인증결과, 성별, 주소, 마케팅 정보 수신 동의(이메일, SMS/MMS, App push, Web push)	서비스 이용에 따른 본인 확인, 신규 서비스 안내, 설문, 이벤트 관련 정보 및 참여 기회 제공, 광고 및 마케팅 정보 제공
간편 로그인
(소셜 계정 연동)	(필수)
소셜 계정 아이디(이메일)	소셜 로그인 서비스를 통한 개인회원 서비스 제공(사람인 계정)
소셜계정
회원가입	(필수)
소셜 계정에서 공개 설정한 정보	홈페이지 회원 가입 및 관리, 상담 및 문의처리, 회원 맞춤형 채용정보 제공(맞춤채용, 오늘의 공채, 사람인 추천, 매칭연구소 추천, 관심기업)
(선택)
개인정보 수정 페이지에 입력한 정보(소셜 계정에서 공개 설정한 정보 제외), 본인확인값(CI, DI) 또는 아이핀인증결과, 마케팅 정보 수신동의(이메일, SMS/MMS, App push, Web push)	서비스 이용에 따른 본인 확인, 신규 서비스 안내, 설문, 이벤트 관련 정보 및 참여 기회 제공, 광고 및 마케팅 정보 제공
이력서 작성	(필수)
희망연봉, 이름(한글), 주소, 휴대폰, 이메일, 성별, 학력사항(재학기간, 학교명, 전공, 지역), 경력사항(경력구분, 총 경력, 해외근무 국가 및 기간, 상세 경력사항(근무기간, 회사명, 직급(직책), 연봉, 직종)	이력서 등록을 통한 입사지원 등 취업활동 서비스 제공, 각종 맞춤형 취업서비스 제공
(선택)
수집되는 개인정보 항목 자세히 보기
기업 자사 양식
이력서 작성	(필수)
해당 기업에서 설정한 정보	이력서 등록을 통한 입사지원
※ 기업 자사 양식 이력서는 해당기업 정책에 따라 해당기업에서 저장 및 관리합니다.
※ 당사는 웹사이트 내 6개월간 보관된 후 파기합니다.
(선택)
해당 기업에서 설정한 정보
인성검사	(필수)
인성검사 결과	맞춤형 취업서비스 제공
유료서비스 이용	(필수)
결제정보(카드(카드사명, 카드번호), 휴대폰(휴대폰번호, 통신사정보), 실시간계좌이체(은행명, 계좌번호))	유료서비스 구매 및 이용 시 요금 정산
※ 결제정보는 결제대행업체에서만 저장하며, 당사는 저장 및 관리하고 있지 않습니다.

기업회원

수집방법	수집항목	수집 및 이용목적
회원가입 및
공고등록	(필수)
본인확인값(CI, DI) 또는 아이핀인증결과, 아이디, 비밀번호, 사업자등록번호, 회사명, 대표자명, 회사주소, 업종, 기업담당자정보(이름, 휴대폰번호, 이메일)	서비스 이용에 따른 본인확인, 홈페이지 회원 가입 및 관리, 상담 및 문의처리, 채용동향 및 공지사항 전달
(선택)
마케팅 정보 수신 동의(이메일, SMS/MMS, App push, Web push)	신규 서비스 안내, 설문, 이벤트 관련 정보 및 참여 기회 제공, 광고 및 마케팅 정보 제공
유료서비스 이용	(필수)
결제정보(카드(카드사명, 카드번호), 휴대폰(휴대폰번호, 통신사정보), 실시간계좌이체(은행명, 계좌번호)), 계산서 발행정보 및 수령자 정보	유료서비스 구매 및 이용 시 요금 정산
※ 결제정보는 결제대행업체에서만 저장하며, 당사는 저장 및 관리하고 있지 않습니다.

서비스 이용에 따른 자동 수집 및 생성 정보

수집항목	수집 및 이용목적
쿠키, 서비스이용기록(방문일시, IP, 불량이용기록), 모바일 기기정보(디바이스토큰, 디바이스ID, IP주소)	접속관리, 이용자별 사용환경 제공, 활동정보 파악, 이벤트 및 프로모션 통계 확인, 맞춤형 채용정보 제공
귀하께서는 회사가 위와 같이 수집하는 개인정보에 대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부할 수 있습니다. 다만, 이때 회원에게 제공되는 서비스가 제한될 수 있습니다.


나. 회사는 모바일앱 서비스를 위하여 이용자의 스마트폰 내 정보 및 기능 중 아래 사항에 대해 접근 합니다. 필수 접근항목은 앱 설치 또는 최초 실행 시 안내 및 동의를 받으며, 선택 접근항목은 해당 서비스 이용 시 별도 동의를 받습니다(선택항목 거부로 인한 기본 서비스 이용 제한은 없음)

구분	접근항목	접근목적
필수 접근	UUID	사용자 식별
선택 접근	저장공간(사진/미디어/파일), 카메라, 사진	프로필 및 파일 등록(이력서)
위치	현재 주소 채용정보 보기 서비스 제공
2. 개인정보 보유 및 이용기간
회사는 이용자의 개인정보를 고지 및 동의 받은 사항에 따라 수집?이용 목적이 달성되기 전 또는 이용자의 탈퇴 요청이 있기 전까지 해당 정보를 보유합니다. 다만, 아래의 사유로 인하여 보관이 필요한 경우 외부와 차단된 별도 DB 또는 테이블에 분리 보관 됩니다.

가.	온라인/모바일 서비스 제공을 위해 수집한 회원가입 정보 : 회원탈퇴 시까지
나. 관련 법령에 의한 개인정보 보유
1) 통신비밀보호법
서비스 이용기록, 접속로그, 접속IP정보 : 3개월
2) 전자상거래 등에서의 소비자보호에 관한 법률
표시 광고에 관한 기록 : 6개월
계약 또는 청약철회 등에 관한 기록 : 5년
대금결제 및 재화등의 공급에 관한 기록 : 5년
소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
3) 부가가치세법
세금계산서, 영수증 등 거래내역 관련 정보 : 5년
다. 개인정보 유효기간제(휴면계정 정책)
회원이 선택한 개인정보 보유기간 동안 사람인에서 제공하는 서비스(웹사이트, 모바일웹, 모바일앱) 이용기록이 없을 경우, 서비스 미 이용자의 개인정보는 일반 이용자의 개인정보와 분리하여 별도로 저장 및 관리됩니다(휴면계정으로 전환)
회사는 휴면계정으로 전환되는 시점 도래 30일 이전에 해당내용에 대해 이메일 등을 통해 이용자에게 공지합니다.
분리 저장된 개인정보는 관련 법령에 특별한 규정이 있는 경우를 제외하고 해당 개인정보를 이용하거나 제공하지 않으며, 관련 법령에 따라 일정기간 동안 보유되고 해당 기간 종료 후 파기됩니다. 다만, 파기되지 않은 개인정보는 해당 이용자의 요청에 따라 서비스 이용을 재개하는 시점에 다시 제공됩니다.
         </textarea>
						<div id="terms">
							개인정보 수집 및 이용에 동의하십니까?&nbsp;&nbsp; <input type="checkbox"
								id="condition2">동의함
						</div>
					</div>
					<br> <br>
					<div id="com_btn">
						<input type="reset" id="reset" value="뒤로가기">&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" id="submit" value="회원가입" onclick = "JoinEvent();">
					</div>
					<script>
			   		 function execDaumPostcode() {
			       			 new daum.Postcode({
			           		 oncomplete: function(data) {
			              
			                var addr = ''; 
			                var extraAddr = ''; 
			
			                if (data.userSelectedType === 'R') { 
			                    addr = data.roadAddress;
			                } else { 
			                    addr = data.jibunAddress;
			                }
			
			                if(data.userSelectedType === 'R'){
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    document.getElementById("extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("extraAddress").value = '';
			                }
			
			                document.getElementById('postcode').value = data.zonecode;
			                document.getElementById("address").value = addr;
			                document.getElementById("detailAddress").focus();
			            }
			        }).open();
			        
			    }
			    
			  
			  //아이디 중복 체크
			  function registerCheckFunction(){
				var userId = $("#memberId").val();
				var count = 0;
				
				//아이디 유효성 검사
				for (var i = 0 ; i < userId.length; i++){
					ch = userId.charAt(i);
					
					if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')
							&&!(ch >= 'A' && ch <= 'Z')) {
		                alert("아이디는 대소문자, 숫자만 입력가능합니다.");
		                return false;
		            }
				}
				
				if (userId == ""){
					alert("아이디를 입력해주세요.");
				}else if(userId.length < 4){
					alert("아이디는 4자 이상으로 입력해주셔야합니다.");
				}else if (count > 0){
					alert("아이디는 특수기호를 쓸수 없습니다.");
				}else {
				
	          		$.ajax({
	          			url : "/redding/idcheck.me",
	          			type : "post",
	          			data : {userId : userId},
	          			success : function(data){
	          				if (data === "success"){
	          					//alert("아이디 사용가능");
	          					$("#idcheck").text("아이디사용가능");
	          					$("#idcheck").css("color","blue");
	          				}else {
	          					$("#idcheck").text("아이디중복");
	          					$("#idcheck").css("color","red");
	          					$("#memberId").val("");
	          				}
	          			}, 
	          			error : function(){
	          				console.log("실패!");
	          			}
	          		});
				}
			}
			 
			  function JoinEvent(){
						//전송 클릭
					 	var Sidcheck = $("#idcheck").text();
						var Spwd1 = $("#Spwd1").text();
						var Spwd2 = $("#Spwd2").text();
						
						var reg_num = $("#reg_num").val();				//사업자 등록번호
						var memberid = $("#memberId").val();			//아이디
						var memberpwd1 = $("#memberPwd").val();			//비밀번호
						var memberpwd2 = $("#password2").val();			//비밀번호 확인
						var memberName = $("#name").val();				//업체명
						var rep_name = $("#rep_name").val();			//대표자명
						var tel1 = $("input[name=tel1]").val();		//전화번호1
						var tel2 = $("input[name=tel2]").val();			//전화번호2
						var tel3 = $("input[name=tel3]").val();			//전화번호3
						var email1 = $("input[name=email1]").val();		//이메일1
						var email2 = $("#email2").val();				//이메일2
						var postcode = $("input[name=postcode]").val();			//인증코드
						var address = $("#address").val();					//주소1
						var detailAddress = $("input[name=detailAddress]").val();	//주소2
						var accountcode = $("input[name=bankcode]").val();		//은행코드
						var account_num = $("#accnum").val();			//계좌번호
						var account_name = $("#accpnm").val();					//예금주	
						var checkaccount = $("#sbm-no").is(':visible');
						
						//회원가입 체크
						if (reg_num == ""){
							alert("사업자등록증을 넣어주세요");			
						}else if(memberid == ""){
							alert("아이디 입력해주세요");			
						}else if (Sidcheck != "아이디사용가능"){
							alert("아이디 중복 체크 해주세요");	
						}else if (memberpwd1 == ""){
							alert("비밀번호 다시 확인해주세요");
						}else if (Spwd1 != ""){
							alert("비밀번호 다시 확인해주세요");
						}else if (memberpwd2 == "" ){
							alert("비밀번호 다시 확인해주세요");
						}else if (Spwd2 != "비밀번호가 일치합니다."){
							alert("비밀번호 다시 확인해주세요");
						}else if (memberName == "") {
							alert("업체명을 입력해주세요.");
						}else if (rep_name == ""){
							alert("대표자명을 입력해주세요.");
						}else if (tel1 == ""){
							alert("전화번호 입력해주세요");
						}else if (tel2 == "") { 
							alert("전화번호 입력해주세요");
						}else if (tel3 == ""){
							alert("전화번호 입력해주세요");
						}else if (email1 == ""){
							alert("이메일 입력해주세요");
						}else if (email2 == ""){
							alert("이메일 입력해주세요");
						}else if ($("#email_check").val() != "인증됨"){
							alert("이메일 확인해주세요");
						}else if (postcode == ""){
							alert("주소 입력해주세요");
						}else if (address == ""){
							alert("주소 입력해주세요");
						}else if (detailAddress == ""){
							alert("주소 입력해주세요");
						}else if (accountcode == "--선택해주세요--"){
							alert("은행 입력해주세요");
						}else if (account_num == ""){
							alert("은행 입력해주세요");
						}else if (account_name == ""){
							alert("은행 입력해주세요");
						}else if (checkaccount == true){
							alert("은행 인증해주세요");	 
						}else if ($("#condition1").is(":checked") == false ){
							alert("약관의 동의해주세요");
						}else if ($("#condition2").is(":checked") == false){
							alert("약관의 동의해주세요");
						}else{  
						//	console.log(account_num + account_name + accountcode);
							console.log("넘어감");
							$("#CompanyJoin").submit();
						} 
						
					
			  }
			  
		 
			$(function(){
				//엔터 막기
				document.addEventListener('keydown', function(event) {
				    if (event.keyCode === 13) {
				        event.preventDefault();
				    }
				}, true);
				
				//비밀번호 누를때 생기는 함수
				$("#memberPwd").change(function(){
					$("#password2").val("");
					var memberPwd = $("#memberPwd").val();
					
					if (memberPwd.length < 8){
						$("#Spwd1").html("8자이상로 작성해주세요");
						$("#Spwd1").css("color" , "red");
					}else{
						$("#Spwd1").html("");
					}
				});
				
				//비밀번호 확인 누를때 생기는 함수
				$("#password2").change(function(){
					var memberPwd = $("#memberPwd").val();
					var memberPwd2 = $("#password2").val()
					
					if (memberPwd != memberPwd2){
						$("#Spwd2").html("비밀번호가 일치하지 않습니다");
						$("#Spwd2").css("color" , "red");
					}else {
						$("#Spwd2").html("비밀번호가 일치합니다.");
						$("#Spwd2").css("color" , "blue");
					}
					
					
				});
				
				//select에서 바꿀때
				$("#email3").change(function(){
					$("#email3").children().eq(0).attr("disabled","true");
					
					var value = $(this).val();
					
					$("#email2").val(value);
				});
				
				//이메일 인증
				$("#emailckbtn").click(function(){
					
					var email1 = $("input[name=email1]").val();		//이메일1
					var email2 = $("#email2").val();
					
					var email = email1 + "@" + email2;
					
					if (email1 == ""){
						alert("이메일을 작성해주세요");
					}else if (email2 == ""){
						alert("이메일을 작성해주세요");
					}else {
						$.ajax({
		          			url : "/redding/send",
		          			type : "post",
		          			data : {email : email},
		          			success : function(data){
		          				 $("#code_check").val(data);
		          	   
		          	          	popupOpen();
		          	                    
		          			}, 
		          			error : function(){
		          				console.log("실패!");
		          			}
		          		});
					}
					
					
				});
				
				//이용약관 모두 동의
				$("#all_check").click(function(){
					$("#terms_all").attr("checked",true);
					$("#condition1").attr("checked",true);
					$("#condition2").attr("checked",true);
				});
				
				//이용약관 모두 동의
			 	$("#terms_all").change(function(){
			 		if ($("#terms_all").is(":checked") == true){
			 			$("#terms_all").attr("checked",true);
						$("#condition1").attr("checked",true);
						$("#condition2").attr("checked",true);
			 		}else {
				 		$("#terms_all").attr("checked",false);
						$("#condition1").attr("checked",false);
						$("#condition2").attr("checked",false);
			 		}
				});
				
			 	
			 	var uploadFile = $('.fileBox .uploadBtn');
			 	uploadFile.on('change', function(){
			 		if(window.FileReader){
			 			var filename = $(this)[0].files[0].name;
			 		} else {
			 			var filename = $(this).val().split('/').pop().split('\\').pop();
			 		}
			 		$(this).siblings('.fileName').val(filename);
			 	});
				
				
		
			});
			
			function popupOpen(){
				
				var url= "<%=request.getContextPath()%>/views/common/checkcode.jsp";    //팝업창에 출력될 페이지 URL
				var winWidth = 200;
			    var winHeight = 200;
			    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
			    var myWindow = window.open(url,"TestName",popupOption);
			}
			
				//은행계좌
				$.support.cors = true;
				var reqDate = new Date();
				var year = reqDate.getFullYear() +"";
				var month = (reqDate.getMonth() + 1) > 10?reqDate.getMonth() + 1 + "":"0" + (reqDate.getMonth() + 1);
				var date = (reqDate.getDate() > 10?reqDate.getDate() + "":"0" + reqDate.getDate());
				var hour = reqDate.getHours() > 9?reqDate.getHours() + "":"0" + reqDate.getHours();
				var min = reqDate.getMinutes() > 10?reqDate.getMinutes() + "":"0" + reqDate.getMinutes();
				var sec = reqDate.getSeconds() > 10?reqDate.getSeconds() + "":"0" + reqDate.getSeconds();
				
				var currentTime = year + month + date + hour + min + sec;
				console.log(currentTime)
				$("#tran_dtime").val(currentTime);
				/* 사용자인증 Access Token 획득 */
				function fnSearchAccessToken() {
					$("#bank_code_std").val($("#bankcode").val());
					$("#account_num").val($("#accnum").val());
					var client_id = $("#client_id").val();
					var client_secret = $("#client_secret").val();
					var grant_type = "client_credentials";
					var scope = "oob";
					$.ajax({
						//url: "/tpt/test/getOauthToken",
						url : "https://testapi.open-platform.or.kr/oauth/2.0/token",
						type : "POST",
						//cache: false,
						contenType : "application/json",
						data : {
							"client_id" : client_id,
							"client_secret" : client_secret,
							"grant_type" : grant_type,
							"scope" : scope
						},
						dataType : "json",
						success : function(data, data2, data3) {
							var list = JSON.parse(data3.responseText);
							$("#access_token").val(list.access_token);
							$("#user_seq_no").val(list.user_seq_no);
							fnSearchRealName();
						},
						error : function(data, data2, data3) {
							alert('error!!!');
						}
					});
				}
				/* 계좌실명조회API */
				function fnSearchRealName() {
					var bank_code_std = $("#bank_code_std").val();
					var account_num = $("#account_num").val();
					$("#account_holder_info").val($("#birth").val());
					var account_holder_info = $("#account_holder_info").val();
					var tran_dtime = $("#tran_dtime").val();
					var access_token = "Bearer " + $("#access_token").val();
					var resData = {
						"bank_code_std" : bank_code_std,
						"account_num" : account_num,
						"account_holder_info" : account_holder_info,
						"tran_dtime" : tran_dtime
					};
					$.ajax({
								url : "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name",
								beforeSend : function(request) {
									request.setRequestHeader("Authorization",
											access_token);
								},
								type : "POST",
								data : JSON.stringify(resData),
								dataType : "json",
								success : function(data, data2, data3) {
									console.log(data)
									if (data.account_holder_name == $("#accpnm").val()) {
		
										$("#sbm-flag").attr("checked", true);
										$("#sbm-ok").show();
										$("#sbm-no").hide();
										var checkacc = "인증됨";
										var pro_no = $
										{
											pro_no
										}
										;
										var bankcode = $('[name=bankcode]').val();
										var accpnm = $('[name=accpnm]').val();
										var accnum = $('[name=accnum]').val();
		
										
										alert('인증 성공!!!');
										$("#confirmacc").hide();
										$("#changeacc").show();
										$("#sbm-flag").attr("checked", true);
												$("#sbm-ok").show();
										$("#sbm-no").hide();
										$("[name=accpnm]").attr("readonly",
														"readonly");
										$("[name=accnum]").attr("readonly",
														"readonly");
										/* $("[name=bankcode]").not(":selected")
														.attr("disabled", "disabled"); */
										
										$("#bankcode").each(function(index){

											if($(this).val()==bankcode){

												$(this).attr("selected","selected"); // attr적용안될경우 prop으로 
											}
										})
														
														
										$("#accpnm").val(accpnm);
									    $("#accnum").val(accnum);
		
									} else {
										alert('인증 실패');
										$("#sbm-flag").attr("checked", false);
										$("#sbm-ok").hide();
										$("#sbm-no").show();
									}
								},
								error : function(data, data2, data3) {
									alert('error!!!');
								}
							});
				}


			</script>
			</div>

			</div>
			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>
		</div>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

</body>
</html>