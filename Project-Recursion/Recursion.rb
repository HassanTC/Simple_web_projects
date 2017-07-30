def fibs(n)
	fib = []
	fib[0],fib[1]=1,1
	for i in 2..n
		fib[i]=fib[i-1]+fib[i-2]
	end
	fib
end


def fibs_rec(n)
(n==1 || n == 0)? 1 : fibs_rec(n-1)+fibs_rec(n-2) 
end

def merge_sort(arr)
	return arr if arr.length == 1
	mid = arr.length/2
	left = merge_sort(arr[0..mid-1])
	right = merge_sort(arr[mid..-1])
	merge(left,right)
end

def merge(arr1,arr2,merged=[])

	i=0 
	j=0 
	while i < arr1.length || j < arr2.length
		if i < arr1.length && j<arr2.length
			if arr1[i] <= arr2[j]
				merged << arr1[i]
				i+=1
			else
				merged << arr2[j]
				j+=1
			end
		elsif i<arr1.length
			merged << arr1[i]
			i+=1
		elsif j<arr2.length
			merged << arr2[j]
			j+=1
		end
	end
	merged
end


array = [10,9,8,-300,250,1,7,6,5,4,3,2,1]
p merge_sort(array)
p fibs(5)
p fibs_rec(5)
