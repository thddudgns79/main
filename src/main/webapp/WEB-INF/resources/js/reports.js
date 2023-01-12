function repFunction(){
	$('input[name=repDateStr]').attr('readonly',false);
	$('input[name=inTimeStr]').attr('readonly',false);
	$('input[name=outTimeStr]').attr('readonly',false);
	var x = document.getElementById("repType").value;
	if(x =='외출'){
		document.getElementById('repDateStr').valueAsDate = new Date();
		$('input[name=repDateStr]').attr('readonly',true);
		$('input[name=inTimeStr]').attr('value',null);
		$('input[name=outTimeStr]').attr('value',null);
	}else if(x =='지하철 연착'){
		document.getElementById('repDateStr').valueAsDate = new Date();
		$('input[name=repDateStr]').attr('readonly',true);
		$('input[name=inTimeStr]').attr('value','09:00:00');
		$('input[name=inTimeStr]').attr('readonly',true);
		$('input[name=outTimeStr]').attr('value',null);
	}else if(x =='조퇴'){
		$('input[name=repDateStr]').attr('readonly',true);
		document.getElementById('repDateStr').valueAsDate = new Date();
		$('input[name=inTimeStr]').attr('value','');
		$('input[name=outTimeStr]').attr('value','18:00:00');
		$('input[name=outTimeStr]').attr('readonly',true);
	}else if(x =='병가'){
		document.getElementById('repDateStr').valueAsDate = new Date();
		$('input[name=inTimeStr]').attr('value','09:00:00');
		$('input[name=inTimeStr]').attr('readonly',true);
		$('input[name=outTimeStr]').attr('value','18:00:00');
		$('input[name=outTimeStr]').attr('readonly',true);
	}else if(x =='경조사'){
		document.getElementById('repDateStr').valueAsDate = new Date();
		$('input[name=inTimeStr]').attr('value','09:00:00');
		$('input[name=inTimeStr]').attr('readonly',true);
		$('input[name=outTimeStr]').attr('value','18:00:00');
		$('input[name=outTimeStr]').attr('readonly',true);
	}else if(x =='예비군'){
		document.getElementById('repDateStr').valueAsDate = new Date();
		$('input[name=inTimeStr]').attr('value','09:00:00');
		$('input[name=inTimeStr]').attr('readonly',true);
		$('input[name=outTimeStr]').attr('value','18:00:00');
		$('input[name=outTimeStr]').attr('readonly',true);
	}else if(x =='--전체--'){
		document.getElementById('repDateStr').valueAsDate = new Date();
		$('input[name=inTimeStr]').attr('value',null);
		$('input[name=outTimeStr]').attr('value',null);
	}
}

function check(){
	var result = true;
	
	if($('#repType').val() == ''){
		$("#repMsg").text('사유를 선택해주세요.');
		result= false;
	}else{
		$("#repMsg").text('');
	}
	
	if($('#repDateStr').val() == ''){
		$("#dateMsg").text('날짜를 선택해주세요.');
		result= false;
	}else{
		$("#dateMsg").text('');
	}
	
	if($('#inTimeStr').val() == ''){
		$("#inMsg").text('시간을 입력해주세요.');
		result= false;
	}else{
		$("#inMsg").text('');
	}
	
	
	if($('#outTimeStr').val() == ''){
		$("#outMsg").text('시간을 입력해주세요.');
		result= false;
	}else{
		$("#outMsg").text('');
	}
	
	if($('#reason').val() == ''){
		$("#reasonMsg").text('내용을 입력해주세요.');
		result= false;
	}else{
		$("#reasonMsg").text('');
	}
	
	
	if($('#multiFile').val() == ''){
		$("#fileMsg").text('파일을 선택해주세요.');
		result= false;
	}else{
		$("#fileMsg").text('');
	}
	return result;
}

