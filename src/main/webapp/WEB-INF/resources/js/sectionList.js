
function check(){
	var result = true;
	
	if($('#sectionTitle').val() == ''){
		$("#message").text('내용을 입력해주세요.');
		result= false;
	}else{
		$("#message").text('');
	}
	
	if($('#sectionDescription').val() == ''){
		$("#message").text('내용을 입력해주세요.');
		result= false;
	}else{
		$("#message").text('');
	}
	
	return result;
}

