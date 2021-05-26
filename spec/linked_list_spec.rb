require 'linked_list'

describe Node do
    
    it "can be created with 'test' value" do
        node = Node.new("test")
        expect(node.value).to eql "test"
        expect(node.next_node).to eql nil
    end

end

describe LinkedList do
    
    it "can be created" do
        list = LinkedList.new("test")
        expect(list.first.value).to eql "test"
        expect(list.first.next_node).to eql nil
    end

    context "#add" do
        it "can add second node, linked to first node" do
            list = LinkedList.new("test")
            added_node = list.add("second")
            expect(list.first.next_node).to eql added_node
        end

        it "will store value in second node with no connection" do
            list = LinkedList.new("test")
            added_node = list.add("second")
            expect(added_node.value).to eql "second"
            expect(added_node.next_node).to eql nil 
        end

        it "can return value of second node by only referring to @first" do
            list = LinkedList.new("test")
            added_node = list.add("second")
            expect(list.first.next_node.value).to eql "second"
        end

        it "can add third node connected to second" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            third_node = list.add("third")
            expect(second_node.value).to eql "second"
            expect(second_node.next_node).to eql third_node
            expect(third_node.value).to eql "third"
            expect(third_node.next_node).to eql nil
        end
    end

    context "#find_final" do

        it "can return first node when it's the only one" do
            list = LinkedList.new("test")
            expect(list.find_final.value).to eql "test"
            expect(list.find_final.next_node).to eql nil
        end

        it "can return second node when it is the last" do
            list = LinkedList.new("test")
            list.add("second")
            expect(list.find_final.value).to eql "second"
            expect(list.find_final.next_node).to eql nil
        end

        it "can return third node when it is the last" do
            list = LinkedList.new("test")
            list.add("second")
            list.add("third")
            expect(list.find_final.value).to eql "third"
            expect(list.find_final.next_node).to eql nil
        end
    end

    context "#print_list" do
        
        it "can print out single node value" do
            list = LinkedList.new("test")
            expect(list.print_list).to eql "test"
        end

        it "can print out two node values" do
            list = LinkedList.new("test")
            list.add("second")
            expect(list.print_list).to eql "test -> second"
        end

        it "can print out three node values" do
            list = LinkedList.new("test")
            list.add("second")
            list.add("third")
            expect(list.print_list).to eql "test -> second -> third"
        end
    end

    context "#node_at" do
        it "can return first node" do
            list = LinkedList.new("test")
            expect(list.first.value).to eql "test"
            expect(list.first.next_node).to eql nil
        end

        it "can return second node" do
            list = LinkedList.new("test")
            added_node = list.add("second")
            expect(list.node_at(1)).to eql added_node
        end

        it "can return third node" do
            list = LinkedList.new("test")
            list.add("second")
            third_node = list.add("third")
            expect(list.node_at(2)).to eql third_node
        end

    end

    context "#value_at" do

        it "can return first node value" do
            list = LinkedList.new("test")
            expect(list.value_at(0)).to eql "test"
        end

        it "can return second node value" do
            list = LinkedList.new("test")
            list.add("second")
            expect(list.value_at(1)).to eql "second"
        end

        it "can return third node value" do
            list = LinkedList.new("test")
            list.add("second")
            list.add("third")
            expect(list.value_at(2)).to eql "third"
        end

        it "returns error if index is out of bounds" do
            list = LinkedList.new("test")
            expect(list.value_at(2)).to eql "none found"
        end
    end

    context "#delete_at" do
        
        it "can remove one node from a one node list" do
            list = LinkedList.new("test")
            list.delete_at(0)
            expect(list.first).to eql nil
        end

        it "can remove first node from a two node list" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            list.delete_at(0)
            expect(list.first.value).to eql "second"
            expect(list.first.next_node).to eql nil
        end

        it "can remove third node from a four node list" do
            list = LinkedList.new("test")
            second = list.add("second")
            third = list.add("third")
            fourth = list.add("fourth")
            list.delete_at(2)
            expect(list.value_at(2)).to eql "fourth"
            expect(list.node_at(2)).to eql fourth
        end

        it "returns error if index is out of bounds" do
            list = LinkedList.new("test")
            expect(list.delete_at(2)).to eql "none found"
        end

    end
end
