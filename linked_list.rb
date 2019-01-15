class LinkedList
    attr_accessor :head
    attr_accessor :tail
    def initialize
        @head = nil
        @tail = nil
    end
    def append(value)
        if @head.nil?
            @head = Node.new(value)
        else
            current = @head
            until current.next_node.nil?
                current = current.next_node
            end
            @tail = Node.new(value)
            current.next_node = @tail
        end
        
    end

    def prepend(value)
        if @head.nil?
            append(value)
        else
            @first = Node.new(value)
            @first.next_node = @head
            @first, @head = @head, @first
        end
    end

    def size
        counter = 1
        current = @head
        until current.next_node.nil?
            current = current.next_node
            counter += 1
        end
        print counter
    end

    def head
        print @head.value
    end

    def tail
        print @tail.value
    end

    def at(index)
        counter = 0
        current = @head
        until counter == index
            current = current.next_node
            counter += 1
        end
        print current.value
    end

    def pop
        current = @head
        until current.next_node == @tail
            current = current.next_node
        end
        current, @tail = @tail, current
        @tail.next_node = nil
    end

    def contains?(value)
        current = @head
        until current.value == value || current.next_node.nil?
            current = current.next_node
        end
        if current.value == value
            return true
        else
            return false
        end
    end

    def find(data)
        counter = 0
        current = @head
        until current.value == data
            current = current.next_node
            counter += 1
        end
        print counter
    end

    def to_s
        current = @head
        until current.next_node.nil?
            print "( #{current.value} ) -> "
            current = current.next_node
        end
        print "( #{current.value} ) -> "
        print " nil "
    end
end

   
class Node
    attr_accessor :next_node, :value

    def initialize(value = nil, next_node = nil)
        @value = value 
        @next_node = next_node
    end

end

a = LinkedList.new()
a.append("G")
a.append("B")
a.append("Q")
a.prepend("Z")
a.head
a.tail
a.size
a.pop
a.size
a.at(2)
print a.contains?("Z")
print a.contains?("Q")
print a.contains?("V")
a.find("Z")
a.find("B")
a.to_s