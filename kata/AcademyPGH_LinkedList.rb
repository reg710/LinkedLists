# This code is from an AcademyPGH livestream on linked lists:
# https://www.twitch.tv/videos/899743456?filter=all&sort=time

class Node
    attr_accessor :value
    attr_accessor :next

    def initialize
        @value = nil
        @next = nil
    end

    def to_string
        # each car knows what's in itself and can pass message to next car only
        # have to separate out last car to avoid nil error
        # This is an example of recursion because the function is calling the same function
        # the first if statement is the base case (where it stops) for recursion
        if @next == nil
            return @value
        else
            return @value + " -> " + @next.to_string
        end
    end

    def add color
        if @value == nil
            @value = color
        else
            # at the end of the train, need to add new car and add value, link up to previous last car
            # Again first is base case, second is recursive call
            if @next == nil
                new_node = Node.new
                new_node.value = color
                @next = new_node
            else    
                @next.add(color)
            end
        end
    end

    # my_array[4] ... first.value_at(3)
    def value_at steps_to_go
        # are we at 0 steps to go?
        if steps_to_go == 0
            return @value
        else
            # pass the question on the next node!
            if @next
                return @next.value_at(steps_to_go - 1)
            else
                # unless there is no next node, then give up
                return "none found"
            end
        end
    end

    def find_final
        if @next == nil
            return @value
        else
            @next.find_final
        end
    end    
    
end