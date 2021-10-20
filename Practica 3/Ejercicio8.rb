=begin
Partiendo del script que modificaste en el inciso anterior, implementá una nueva clase de ex‑
cepción que se utilice para indicar que la entrada del usuario no es un valor numérico entero
válido. ¿De qué clase de la jerarquía de Exception heredaría?
=end

#Clase excepción
class LessThan15 < StandardError
    attr_reader :data
    def initialize(msg="The number is less than 15")
        super(msg)
    end
end

#Para probar
begin
    puts 'Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
    cantidad = Integer(gets)
    raise LessThan15.new() if cantidad < 15
rescue LessThan15 => error
    puts error.message
    retry
end
# Luego se almacenan los números
numeros = 1.upto(cantidad).map do
    puts 'Ingrese un número'
    numero = Integer(gets)
end
# Y finalmente se imprime cada número dividido por su número entero inmediato anterior
resultado = numeros.map { |x| x / (x - 1) rescue 0}
puts 'El resultado es: %s' % resultado.join(', ')