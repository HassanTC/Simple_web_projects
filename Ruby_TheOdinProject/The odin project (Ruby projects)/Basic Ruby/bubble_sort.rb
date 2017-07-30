def bubble_sort(arr)
  continue = true
  return arr if arr.size <= 1
  while continue
    continue = false
    for i in 0..arr.size - 2
      if arr[i] > arr[i+1]
        tmp = arr[i]
        arr[i]= arr[i+1]
        arr[i+1] = tmp
        continue = true
      end
    end
  end
  arr.inspect
end




puts  bubble_sort([4,3,78,2,0,2])
