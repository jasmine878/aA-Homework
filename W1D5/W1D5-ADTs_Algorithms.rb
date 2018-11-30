class Stack
    def initialize
        @practice_stack = []
    end

    def push(el)
        @practice_stack << el
    end

    def pop
        @practice_stack.delete_at(-1)
    end

    def peek
        @practice_stack.last
    end
end


# array = Stack.new
# p array
# array.push(5)
# array.push(6)
# array.push(7)
# p array
# array.pop
# p array

# p array.peek



