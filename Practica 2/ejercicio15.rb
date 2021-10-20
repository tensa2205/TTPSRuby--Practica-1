def da_nil?(&block)
    block_given?
end

puts da_nil? { }
# => true
puts da_nil? do 'Algo distinto de nil' end
# => false