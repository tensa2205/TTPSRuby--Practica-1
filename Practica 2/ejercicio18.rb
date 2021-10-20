fibonacci = Enumerator.new do |caller|
    i1, i2 = 1, 1
    loop do
        caller.yield i1 #Imprime i1
        i1, i2 = i2, i1+i2 #i1 ahora va a tener el valor de i2, i2 va a tener la suma de i1 + i2
    end
end

=begin 
    El método loop ejecuta el código dentro del bloque.
    Se puede salir con break cuando se cumple la condición.
    Si hay iteradores, loop terminará cuando el enumerator se quede sin valores.
=end

6.times { puts fibonacci.next }