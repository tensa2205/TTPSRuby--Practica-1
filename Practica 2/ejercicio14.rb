VALUE = 'global'
module A
    VALUE = 'A'
    class B
        VALUE = 'B'
        def self.value
            VALUE
        end
        def value
            'iB'
        end
    end
    def self.value
        VALUE
    end
end
class C
    class D
        VALUE = 'D'
        def self.value
            VALUE
        end
    end
    module E
        def self.value
            VALUE
        end
    end
    def self.value
        VALUE
    end
end
class F < C
    VALUE = 'F'
end

=begin 
¿Qué imprimen cada una de las siguientes sentencias? ¿De dónde está obteniendo el valor?

Resul -> se ve que imprimen global ya que no encuentran el valor en su scope.
=end
puts A.value #A imprime desde método de clase
puts A::B.value #B imprime desde método de clase
puts C::D.value #D imprime desde método de clase
puts C::E.value #D - Pero en realidad imprime global ya que supon
puts F.value #F - Pero en realidad imprime global

puts "===================="


puts A::value #A
puts A.new.value #Error, no podemos instanciar módulos
puts B.value #B - Error, constante no inicializada
puts C::D.value #D
puts C.value #imprime global
puts F.superclass.value #imprime global
