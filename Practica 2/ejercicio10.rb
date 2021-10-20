=begin 
TracePoint.trace(:call) do |t|
            counter[sym] += 1 if t.method_id == sym
            puts self
        end
=end


module Countable
    attr_accessor :counter_sym
    def counter
        @counter_sym ||= {}
    end

    def count_invocations_of(sym)
        @counter_sym[sym] = 0
        contar(sym)
    end
    def invoked?(sym)
        counter_sym.has_key?(sym) && counter_sym[sym] > 0 ? 1 : 0
    end
    def invoked(sym)
        counter_sym.has_key?(sym) ? counter_sym[sym] : 0
    end

    #No funciona xq maneja counter_sym como variable de clase
    def contar(sym)
        TracePoint.trace(:call) do |t|
            @counter_sym[sym] += 1 if t.method_id == sym  
        end
    end
    
end

class Greeter
    include Countable # Incluyo el Mixin

    def initialize
        counter
    end

    def hi
        puts 'Hey!'
    end

    def bye
        puts 'See you!'
    end
    # Indico que quiero llevar la cuenta de veces que se invoca el método #hi
    #count_invocations_of :hi
end

#Inicialización
a = Greeter.new
a.count_invocations_of :hi
b = Greeter.new
b.count_invocations_of :hi

#Antes
puts a.invoked? :hi
# => 0
puts b.invoked? :hi
# => 0

#Llamados
a.hi
# Imprime "Hey!"

puts a.invoked :hi
# => 1

puts b.invoked :hi
# => 0


b.hi
puts b.invoked :hi
# => 1

puts "!!!!!!!!!!!!!"
puts a.counter
puts b.counter

