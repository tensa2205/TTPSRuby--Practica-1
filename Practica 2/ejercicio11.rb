=begin
    Básicamente,  ITFactory al llamar el método de clase self.create (los métodos de clase en ruby se prefijan con self.)
    Este método hace un new que automáticamente llama a initialize, por eso se redefine el constructor initialize en el hijo.
=end
class GenericFactory
    def self.create(**args)
        new(**args)
    end
    def initialize(**args)
        raise NotImplementedError
    end
end

class ITFactory < GenericFactory
    def initialize(**args)
        puts "Fui instanciado sin usar new"
    end
end

objetoIT =  ITFactory.create
puts objetoIT