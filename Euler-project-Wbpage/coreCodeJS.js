var first = function(){
	var ans = 0 ; 
	for(var i = 1 ; i < document.getElementById("inp1").value; i++)
		if(i%3===0||i%5===0)ans+=i;
    document.getElementById("out1").innerHTML = ans;
	}
	
	
	var second= function(){
		var res= 0 ; 
		var arr=[1,2];
		var i ;
		for(i = 2 ; i < document.getElementById("inp2").value ; i++)
		{
          arr.push(arr[i-1]+arr[i-2]);
		 
		}
	document.getElementById("out2").innerHTML = arr[i-1];
	}