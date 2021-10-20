=begin
    Toca recordar que los modulos que se incluyen en una clase mediante la palabra extend implicará que todos los métodos del módulo
    se agregan a la clase en sí y no a las instancias. Por lo tanto podemos usar eso para extender create como método de clase.
=end
module GenericFactory
    def create(**args)
        new(**args)
    end
    def initialize(**args)
        raise NotImplementedError
    end
end

class ITFactory
    extend GenericFactory
    def initialize(**args)
        puts "Fui instanciado sin usar new"
    end
end

objetoIT =  ITFactory.create
puts objetoIT