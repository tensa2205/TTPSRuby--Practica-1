=begin
Analizá y probá los siguientes métodos, que presentan una lógica similar, pero ubican el manejo
de excepciones en distintas partes del 
código. ¿Qué resultado se obtiene en cada caso? ¿Porqué?
=end
def opcion_1
    a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
    b = 3
    c = a.map do |x|
        x * b
    end
    puts c.inspect
end
def opcion_2
    c = begin
            a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
            b = 3
            a.map do |x|
                x * b
            end
        rescue
            0
        end
    puts c.inspect
end
def opcion_3
    a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
    b = 3
    c = a.map { |x| x * b } rescue 0
    puts c.inspect
end
def opcion_4
    a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
    b = 3
    c = a.map { |x| x * b rescue 0 }
    puts c.inspect
end

puts "1"
opcion_1 #Si se usa puts opcion_1 vemos q retorna 0
puts "2"
opcion_2
puts "3"
opcion_3
puts "4"
opcion_4
=begin
Opcion 1: No se obtiene resultado ya que la excepción se lanza antes
de poder hacer el inspect. Por lo tanto se retornaria 0 .
Opcion 2: se obtiene como resultado 0 ya que el bloque del begin
    realiza la operación del map que lanza excepción. La cual es agarrada
    por el rescue guardando el resultado en C. Después de dicha asignación
    se hace el inspect, mostrando así el valor de C.
Opción 3: se obtiene como resultado 0 ya que el bloque del map
    realiza la operación que lanza excepción. La cual es agarrada
    por el rescue fuera del bloque guardando el resultado en C. 
    Después de dicha asignación
    se hace el inspect, mostrando así el valor de C.
Opción 4: si mal no la entiendo, esta genera excepciones pero a diferencia
de las demás, guarda los ceros dentro del arreglo. Según veo, esto ocurre
por que el rescue se hace dentro del bloque.

Si se pusiera el rescue adentro de cada bloque que hace el map. Entonces
tendriamos el mismo resultado que opción 4.
=end