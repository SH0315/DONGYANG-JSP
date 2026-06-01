function movePage(targetUrl){
	var form = document.boardform;
	
	//등록화면 submit 이동
	if (targetUrl == 'insertBoard.jsp') {
		if (form.name.value == ""){
			alert("이름을 입력해주세요.");
			form.name.focus();
			return;
		}
		if (form.passwd.value==""){
			alert("암호를 입력해주세요.");
			form.passwd.focus();
			return;
		}
		
		// 2. [확인] 누르면 목적지 주소를 등록 페이지로 변경
		form.action = targetUrl;
		form.submit()			
	}
	
	//수정변경화면으로 submit 이동
	if (targetUrl == 'updateBoard.jsp') {
			if (form.name.value == ""){
				alert("이름을 입력해주세요.");
				form.name.focus();
				return;
			}
			if (form.passwd.value==""){
				alert("암호를 입력해주세요.");
				form.passwd.focus();
				return;
			}
			
			// 2. [확인] 누르면 목적지 주소를 수정 페이지로 변경
			form.action = 'updateBoard.jsp'
			form.submit()			
		}
		
	//삭제화면으로 submit 이동
	if (targetUrl == 'deleteBoard.jsp') {
			if (form.passwd.value == ""){
				alert("암호를 입력해주세요.");
				form.passwd.focus();
				return;
			}
			ok = confirm("삭제하시겠습니까?");
			if (ok){
				// 2. [확인] 누르면 목적지 주소를 등록 페이지로 변경
				form.action = 'deleteBoard.jsp'
				// 3. 데이터를 실어서 서버로 전송
				form.submit()	
			}
		}
}






