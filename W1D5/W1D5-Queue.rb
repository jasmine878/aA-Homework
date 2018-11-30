class Queue

    def initialize
        @practice_queue = []
    end

    def enqueue(el)
        @practice_queue.unshift(el)
    end

    def dequeue
        @practice_queue.pop
    end

    def peek
        @practice_queue.last
    end
end


test_queue = Queue.new

p test_queue
test_queue.enqueue(5)
test_queue.enqueue(6)
test_queue.enqueue(7)
p test_queue
test_queue.dequeue
p test_queue

p test_queue.peek





