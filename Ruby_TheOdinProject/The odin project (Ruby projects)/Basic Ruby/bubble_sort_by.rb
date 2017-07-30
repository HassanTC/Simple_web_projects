def bubble_sort_by(arr)
  continue = true
  return arr if arr.size <= 1
  while continue
    continue = false
    for i in 0..arr.size - 2
      compare = yield(arr[i], arr[i+1])
      if compare > 0
        tmp = arr[i]
        arr[i] = arr[i+1]
        arr[i+1] = tmp
        continue = true
      end
    end
  end
  arr
end
puts bubble_sort_by(["hi","hello","hey"]) { |left,right| left.length - right.length}
