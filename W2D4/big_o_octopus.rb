#Sluggish Octopus
#find the longest fish in O(n^2)
#this is the slowest option

#for an array of length n
# it takes n.length time to iterate
# O(n^2) is similar to two each statements.

def sluggish_o(fishes)
    #comparing fishes with itself.
    #if fish1 is smaller than any other fish
    # it's not the biggest fish.
    #the largest fish has no other fish longer than itself.
    
    fishes.each_with_index do |fish1, idx1|
        longest_fish = true
        
        fishes.each_with_index do |fish2, idx2|
            next if idx1 == idx2
            longest_fish = false if fish2.length > fish1.length
        end
        return fish1 if longest_fish
    end
        
    end

#n log n search

class Array
    def dominant_octopus(&prc)
        prc || Proc.new { |x, y| x <=> y }

        return self if self.count <= 1
        mid = self.count / 2
        sorted_left = self.take(midpoint).dominant_octopus(&prc)
        sorted_right = self.drop(midpoint).dominant_octopus(&prc)

        Array.merge(sorted_left, sorted_right, &prc)
    end

    def self.merge(left, right, &prc)
        merged = []

        until left.empty? || right.empty?
            case prc.call(left.first, right.first)
            when -1
                merged << left.shift
            when 0
                merged << left.shift
            when 1
                merged << right.shift
            end
        end

        merged.concat(left)
        merged.concat(right)

        merged
    end
end