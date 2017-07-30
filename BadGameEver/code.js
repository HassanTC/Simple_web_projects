

$(document).ready(

 function(){
	var row =1 ; var col=1 ; var flag = true ;

$("#fs").click(function(){
	
row =  +$("#row").val();

});

$("#sc").click(function(){
	
col =  +$("#col").val();
	
});
$("#play").click(function(){
	
	if(flag){
		flag=false;
for(var i = 0 ; i < row ; i ++){
	$("#insert").append('<br / >');
	for(var j = 0 ; j < col; j ++){
		
		$("#insert").append('<div class ="dis"></div>');
		
	}
	}
}

$("div").on("mouseenter",function(){
	$(this).css({"background-color":"blue"});
});

});
$("#new").click(function(){
	$(".all").remove();
	flag=true;
	$("body").append('<span class="all"><p id ="insert"></p></span>');
});
});