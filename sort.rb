def your_sort(array, &block)
  if array.empty?
    array
  else
    block ||= Proc.new {|a, b| a <=> b}
    head, tail = [array.shift], array
    until tail.empty?
      if block.call(head[0], tail[0]) >= 0
        head.unshift(tail.shift)
      else
        i = 0 
        while i < head.size
          break if block.call(head[i], tail[0]) >= 0
          i += 1
        end
        i == 0 ? head.unshift(tail.shift) : head.insert(i, tail.shift)
      end
    end
    head
  end
end