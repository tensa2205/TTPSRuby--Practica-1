def contar_palabras(stringQuery, searchedStr)
    stringQuery.downcase().split(" ").select{|word| word.eql? searchedStr.downcase}.size()
end
puts contar_palabras("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")