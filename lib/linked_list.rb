# Would like the linked list to be able to:
#   [x] Add new node at the end
#   [x] Find last node in the list 
#   [x] Print out list of nodes
#   [x] Return node value by location
#   [] Return node value before/after value
#   [] Delete node at location
#   [] Delete node by value

class Node
    attr_accessor :value
    attr_accessor :next_node

    def initialize(value)
        @value = value
        @next_node = nil
    end
end

class LinkedList
    attr_accessor :first

    def initialize(value)
        @first = Node.new(value)
    end

    def add(info)
        find_final.next_node = Node.new(info)
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
        last_node = find_final
        output = []
        while current_node != last_node
            output << current_node.value
            current_node = current_node.next_node
        end
        output << last_node.value
        return output.join(" -> ")      
    end

    def value_at(index)
        current_node = @first  
        while index > 0
            if current_node.next_node == nil && index > 1
                return "none found"
            elsif current_node.next_node !=nil
                current_node = current_node.next_node
            end
            index -= 1         
        end
        return current_node.value
    end
end


