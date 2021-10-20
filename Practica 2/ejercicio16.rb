def procesar_hash(hash, proc)
    hash.inject({}){|acumulador, (key,value)| 
        acumulador[value] = proc.call(key)
        acumulador 
    }
end

hash = { 'clave' => 1, :otra_clave => 'valor' }
puts procesar_hash(hash, ->(x) { x.to_s.upcase })
# => { 1 => 'CLAVE', 'valor' => 'OTRA_CLAVE' }