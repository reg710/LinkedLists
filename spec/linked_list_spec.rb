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
            second_node = list.add("second")
            expect(list.node_at(1)).to eql second_node
        end

        it "can return third node" do
            list = LinkedList.new("test")
            list.add("second")
            third_node = list.add("third")
            expect(list.node_at(2)).to eql third_node
        end

        it "returns nil if index is one out of bounds" do
            list = LinkedList.new("test")
            expect(list.node_at(1)).to eql nil
        end

        it "returns nil if index is two out of bounds" do
            list = LinkedList.new("test")
            expect(list.node_at(2)).to eql nil
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

    context "#remove_at" do
        
        it "can remove one node from a one node list" do
            list = LinkedList.new("test")
            list.remove_at(0)
            expect(list.first).to eql nil
        end

        it "can remove first node from a two node list" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            list.remove_at(0)
            expect(list.first.value).to eql "second"
            expect(list.first.next_node).to eql nil
        end

        it "can remove second node from a two node list" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            list.remove_at(1)
            expect(list.first.value).to eql "test"
            expect(list.first.next_node).to eql nil
        end

        it "can remove third node from a four node list" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            third_node = list.add("third")
            fourth_node = list.add("fourth")
            list.remove_at(2)
            expect(list.value_at(2)).to eql "fourth"
            expect(list.node_at(2)).to eql fourth_node
        end

        it "can remove fourth node from a four node list" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            third_node = list.add("third")
            fourth_node = list.add("fourth")
            list.remove_at(3)
            expect(list.node_at(2)).to eql third_node
            expect(third_node.next_node).to eql nil
        end

        it "returns error if index is out of bounds" do
            list = LinkedList.new("test")
            expect(list.remove_at(2)).to eql "none found"
        end
    end

    context "#first_node_with" do
        
        it "returns first node in one node list" do
            list = LinkedList.new("test")
            expect(list.first_node_with("test")).to eql list.first
        end

        it "returns second node in two node list" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            expect(list.first_node_with("second")).to eql second_node
        end

        it "returns second node in three node list" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            third_node = list.add("third")
            expect(list.first_node_with("second")).to eql second_node
        end
        
        it "returns third node in three node list" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            third_node = list.add("third")
            expect(list.first_node_with("third")).to eql third_node
        end
        
        it "returns error if value is not found" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            third_node = list.add("third")
            expect(list.first_node_with("peanut")).to eql "none found"
        end
    end

    context "#value_before" do
        
        it "returns first node when searching second node value" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            expect(list.value_before("second")).to eql "test"
        end

        it "returns second node when searching third node value" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            third_node = list.add("third")
            expect(list.value_before("third")).to eql "second"
        end

        it "returns error if first node matches value searched" do
            list = LinkedList.new("test")
            expect(list.value_before("test")).to eql "none found"
        end

        it "returns error if value is not found" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            third_node = list.add("third")
            expect(list.value_before("cashew")).to eql "none found"
        end
    end

    context "#value_after" do
        
        it "returns second node when searching first node value" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            expect(list.value_after("test")).to eql "second"
        end

        it "returns third node when searching second node value" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            third_node = list.add("third")
            expect(list.value_after("second")).to eql "third"
        end

        it "returns error if last node matches value searched" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            third_node = list.add("third")
            expect(list.value_after("third")).to eql "none found"
        end

        it "returns error if value is not found" do
            list = LinkedList.new("test")
            second_node = list.add("second")
            third_node = list.add("third")
            expect(list.value_after("cashew")).to eql "none found"
        end
    end

    context "#delete" do
    end
end
