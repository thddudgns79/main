
function repFunction(){
	var x = document.getElementById("repType").value;
	if(x =='외출'){
		document.getElementById("repDate").innerHTML = "young";
	}else if(x =='지하철 연착'){
		$('date[name=repDate]').attr('value','현재날짜');
		$('input[name=inTime]').attr('value','현재날짜+09:00:00');
	}else if(x =='조퇴'){
		$('date[name=repDate]').attr('value','현재날짜');
		$('input[name=inTime]').attr('value','현재날짜+09:00:00');
	}else if(x =='병가'){
		$('date[name=repDate]').attr('value','현재날짜');
		$('input[name=inTime]').attr('value','현재날짜+09:00:00');
		$('input[name=outTime]').attr('value','현재날짜+18:00:00');
	}else if(x =='경조사'){
		$('date[name=repDate]').attr('value','현재날짜');
		$('input[name=inTime]').attr('value','현재날짜+09:00:00');
		$('input[name=outTime]').attr('value','현재날짜+18:00:00');
	}else if(x =='예비군'){
		$('date[name=repDate]').attr('value','현재날짜');
		$('input[name=inTime]').attr('value','현재날짜+09:00:00');
		$('input[name=outTime]').attr('value','현재날짜+18:00:00');
	}
}

$('.datepicker').datepicker({
	 weekStart:1,
	 color: 'red'
});

function check(){
	var result = true;
	
	//ID 유효성 검사
	if($('#repType').val() == ''){
		$("#repMsg").text('내용을 입력해주세요.');
		result= false;
	}
	
	if($('#repDate').val() == ''){
		$("#dateMsg").text('내용을 입력해주세요.');
		result= false;
	}
	
	if($('#inTime').val() == ''){
		$("#inMsg").text('내용을 입력해주세요.');
		result= false;
	}
	
	
	if($('#outTime').val() == ''){
		$("#outMsg").text('내용을 입력해주세요.');
		result= false;
	}
	
	if($('#multiFile').val() == null){
		$("#fileMsg").text('내용을 입력해주세요.');
		result= false;
	}
	
	
	return result;
}

