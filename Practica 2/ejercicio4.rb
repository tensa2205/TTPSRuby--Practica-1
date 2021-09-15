def longitud(*parametros)
    parametros.inject("") {|acumulador, actual|
        acumulador += "%s --> %s\n" % [actual.to_s, actual.to_s.length]
    }
end
puts longitud(9, Time.now, 'Hola', {un: 'hash'}, :ruby)