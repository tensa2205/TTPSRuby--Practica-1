def contar(stringQuery, searchedStr)
    stringQuery.downcase().split(" ").select{|word| word.include? searchedStr.downcase}.size()
end

puts contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")