class Node
    attr_accessor :value
    attr_accessor :next_node

    def initialize(value)
        @value = value
        @next_node = nil
    end
end

# Would like the linked list to be able to:
#   [x] Add new node at the end
#   [x] Find last node in the list 
#   [x] Print out list of nodes
#   [] Add node by location
#   [] Add node before/after value
#   [] Delete node at location
#   [] Delete node by value
 

class LinkedList
    attr_accessor :first

    def initialize(value)
        @first = Node.new(value)
    end

    def add(info)
        if @first
            find_final.next_node = Node.new(info)
        else
            @first = Node.new(info)
        end
    end

    def find_final
        current_node = @first
        while current_node.next_node != nil
            current_node = current_node.next_node
        end
        return current_node
    end

    def print_list
        current_node = @first
        output = []
        while current_node != find_final
            output << current_node.value
            current_node = current_node.next_node
        end
        output << find_final.value
        return output.join(" -> ")      
    end
end


