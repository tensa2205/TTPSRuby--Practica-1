class TrueClass
    def opposite
        !self
    end
end
class FalseClass
    def opposite
        !self
    end
end

puts true.opposite
puts false.opposite
puts true.opposite.opposite