#!/usr/bin/env ruby

if ARGV.length != 1
    abort("Cantidad incorrecta de parámetros recibidos")
end

puts "¡Hola, %s!" % [ARGV[0]]