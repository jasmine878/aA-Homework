class Map

    def initialize
        @practice_map = []
    end

    def set(key, val)
        @practice_map << [key, val]
    end

    def get(key)
        @practice_map.each { |sub_array| return sub_array.last if sub_array.first == key }
    end

    def delete(key)
        new_array = []
        @practice_map.each { |sub_array| new_array << sub_array unless sub_array.first == key }
        new_array
    end

    def show
        @practice_map.first
    end
end


test_map = Map.new

# p test_map
test_map.set("a", 5)
test_map.set("b", 6)
test_map.set("c", 7)
# p test_map
p test_map.delete("c")

p test_map.show





