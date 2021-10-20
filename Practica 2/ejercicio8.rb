=begin
    Meramente explicativo.
    ¿Qué diferencia hay entre el uso de include y extend a la hora de incorporar un módulo en una clase?

    Include es usado para importar código del módulo, métodos
        variables de instancia de forma que solo se agrega a
        las instancias de la clase. Ruby tira error si
        intentamos acceder los nuevos métodos/atributos del módulo
        usando la clase ya que la única forma de acceder
        a todo ese código es mediante una instancia.
    
    Extend también se usa para importar código del módulo,
    pero importa los métodos como métodos de clase. También
    es importante que si vamos a usar un módulo para extender
    , le definamos solo variables de clase. Si queremos acceder
    a los métodos de dicho módulo usando instancias, ruby tira
    error.

    Include -> agrega métodos a las instancias de clase.
    Extend -> agrega métodos a la clase pero no a sus instancias.

    Ejemplo en código de la página:
    https://www.geeksforgeeks.org/include-v-s-extend-in-ruby/
=end


# Ruby program of Include and Extend

# Creating a module contains a method
module Geek
    def geeks
        puts 'GeeksforGeeks!'
    end
end

class Lord    
    # only can access geek methods
    # with the instance of the class.
    include Geek
end
class Star
    # only can access geek methods
    # with the class definition.
    extend Geek
end

# object access 
Lord.new.geeks

# class access
Star.geeks 

# NoMethodError: undefined  method
# `geeks' for Lord:Class
Lord.geeks

# NoMethodError: undefined method 'geeks' for
# <Star:valorHexadecimal> (objeto)
Star.new.geeks