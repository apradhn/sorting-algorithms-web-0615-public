require "pry"
def your_sort(array, &block)
  if array.size < 2
    array
  else
    normalized_block = block || Proc.new do |a, b|
      a <=> b
    end
    head = [array.shift]
    tail = array
    j = 0
    while tail.size > 0
      direction = normalized_block.call(head[0], tail[0])
      if direction == 1 || direction == 0
        head.unshift(tail.shift)
      else
        i = 0
        while i < head.size
          i += 1
          if i == head.size
            head << tail.shift
            break
          elsif normalized_block.call(head[i], tail[0]) == 1
            head.insert(i, tail.shift)
            break
          end
        end
      end
      j += 1
    end
    head
  end
end