class Node
    attr_accessor :value
    attr_accessor :next_node

    # when creating a new node it will have a given value and no connection
    def initialize(value)
        @value = value
        @next_node = nil
    end
end

# Would like the linked list to be able to:
#   - Add new node at the end
#   - Find last node in the list 
#   - Print out list of nodes
#   - Add node by location
#   - Add node before/after value
#   - Delete node at location
#   - Delete node by value
#   

class LinkedList
    attr_accessor :first

    # Could you also include a :last attribute? What would that change? Can an attribute depend on a method within the class?
    # In this setup, when creating a new list, you'll have to include the value of the first node
    def initialize(value)
        @first = Node.new(value)
    end

    # check for node that has nil value in next_node, and add new node with info as value
    def add(info)
        # if @first.value == nil
        #     @first.value = info
        # else
        #     if @first.next_node == nil
        #         new_node = Node.new(info)
        #         @first.next_node = new_node
        #     else    
        #         @first.next_node.add(info)
        #     end
        # end

        # current_node = @first
        # while current_node.next_node != nil
        #     current_node = current_node.next_node
        # end
        # current_node.next_node = Node.new(info)

        if @first
            find_final.next_node = Node.new(info)
        else
            @first = Node.new(info)
        end
    end

    def find_final
        current_node = @first

        return current_node if !current_node.next_node

        while (current_node = current_node.next_node)
            return current_node if !current_node.next_node
        end
    end
end


