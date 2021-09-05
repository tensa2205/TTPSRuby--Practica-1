=begin
• Obtener la lista de ancestros (superclases) de una clase.
• Conocer la lista de métodos de una clase.
• Conocer la lista de métodos de instancia de una clase.
• Conocer las variables de instancia de una clase.
• Obtener el valor de una variable de instancia de un objeto (sin utilizar un método generado
con attr_reader o similar) accediéndolo desde fuera de éste.
• Establecer el valor de una variable de instancia de un objeto (sin utilizar un método gene‑
rado con attr_writer o similar) desde fuera de éste.
=end

#Ancestros de una clase
    # object.class.ancestors
puts Array.new.class.ancestors

puts "----------------------------------------------\n"
puts "----------------------------------------------\n"
puts "----------------------------------------------\n"

#Métodos de una clase
    # Class.methods(false)

puts Array.methods


puts "----------------------------------------------\n"
puts "----------------------------------------------\n"
puts "----------------------------------------------\n"

#Métodos de instancia de una clase
    # Class.instance_methods

puts Hash.instance_methods

puts "----------------------------------------------\n"
puts "----------------------------------------------\n"
puts "----------------------------------------------\n"


#Obtener variables de instancia de una clase
    # instanciaDeObjeto.instance_variables
class MyClass
    def initialize(p1,p2)
        @var1 = p1
        @var2 = p2
    end
end
mc = MyClass.new('John','Doe')
puts mc.instance_variables

puts "----------------------------------------------\n"
puts "----------------------------------------------\n"
puts "----------------------------------------------\n"

#Obtener valor de variables de instancia sin usar getter o attr_reader
puts mc.instance_variable_get("@var1")
#o
puts mc.instance_variable_get(:@var2)

puts "----------------------------------------------\n"
puts "----------------------------------------------\n"
puts "----------------------------------------------\n"

#Setear valor de variable de instancia sin usar setter o attr_writer
puts mc.instance_variable_set(:@var2, 'Douw')