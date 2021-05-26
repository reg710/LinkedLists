# Would like the linked list to be able to:
#   [x] Add new node at the end
#   [x] Find last node in the list 
#   [x] Print out list of nodes
#   [x] Return node value by location
#   [x] Delete node at location
#   [] Return node value before/after value
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
        output = []
        while current_node.next_node != nil
            output << current_node.value
            current_node = current_node.next_node
        end
        output << find_final.value
        return output.join(" -> ")      
    end

    def node_at(index)
        current_node = @first  
        while index > 0
            if current_node.next_node == nil && index > 1
                return nil
            elsif current_node.next_node !=nil
                current_node = current_node.next_node
            end
            index -= 1         
        end
        return current_node
    end

    def value_at(index)
        node_at(index) == nil ? "none found" : node_at(index).value
    end

    def delete_at(index)
        previous_node = node_at(index - 1)
        after_node = node_at(index + 1)
        if node_at(index) != nil
            if index == 0 && @first.next_node == nil
                @first = nil
            elsif index == 0 
                @first = @first.next_node
            else
                previous_node.next_node = after_node
            end
        else
            return "none found"
        end
    end
end




