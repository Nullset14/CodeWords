# An abstract Queue class
#
class Queue

  def initialize
    raise 'Cannot instantiate abstract class'
  end

  def enqueue(object)
  end

  def dequeue()
  end

  def is_empty?
    size.equal?(0)
  end

  def is_full?
    size.equal?(max_size)
  end

  def print_queue
    rear > head ? queue[head..rear] : queue[rear..head]
  end

  private

  attr_reader :queue, :head, :rear, :max_size, :size

end

# An implementation of Queue using Array
#
class ArrayQueue < Queue

  def initialize(max_size)
    @size, @max_size = 0, max_size.to_i
    @queue = []
    @head, @rear = 0, -1
  end

  def enqueue(object)
    raise 'Queue is full...' if is_full?
    @rear = (rear + 1) % max_size
    @size = size + 1
    queue[rear] = object
    rear
  end

  def dequeue
    raise 'Queue is empty...' if is_empty?
    object = queue[head]
    @size = size - 1
    @head = (head + 1) % max_size
    object
  end

end

cq = CircularQueue.new(10)
cq.enqueue('3')
cq.enqueue('4')
cq.enqueue('8')
cq.enqueue('14')
cq.enqueue('19')
print cq.print_queue, "\n" # ["3", "4", "8", "14", "19"]
cq.dequeue
cq.enqueue('25')
print cq.print_queue, "\n" # ["4", "8", "14", "19", "25"]
cq.dequeue
print cq.print_queue, "\n" # ["8", "14", "19", "25"]