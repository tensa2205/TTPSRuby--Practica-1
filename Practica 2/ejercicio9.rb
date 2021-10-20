module Reverso
    def di_tcejbo
        puts self.object_id.to_s.reverse
    end
    def ssalc
        puts self.class.name.reverse
    end
end

class Prueba
    include Reverso
end
p = Prueba.new
#Sin reverse
puts p.object_id
#Llamando métodos del módulo
p.di_tcejbo
p.ssalc
