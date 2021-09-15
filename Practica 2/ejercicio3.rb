=begin
entrada = [10, 9, 1, 2, 3, 5, 7, 8]
# Dada `entrada', invocá a #ordenar utilizando los valores que contiene la variable
ordenar(entrada) # <= Esto no funciona. Corregí esta invocación para que funcione.   
=end
def ordenar(*array)
    array.sort
end
entrada = [10, 9, 1, 2, 3, 5, 7, 8]
puts ordenar(*entrada) 