def bubble_sort(arr)
  initial_arr = arr
  p initial_arr
  for j in (0...arr.length)
    for i in (0...arr.length - 1)
      next unless arr[i] > arr[i + 1]

      this = arr[i]
      that = arr[i + 1]
      arr[i] = that
      arr[i + 1] = this
    end
    p arr
  end
  arr
end

arr = [4, 3, 78, 2, 0, 2]

bubble_sort(arr)
