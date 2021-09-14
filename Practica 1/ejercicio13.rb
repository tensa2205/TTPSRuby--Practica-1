=begin(clave,valor)? -> si no pusiera los parentésis me tomaria la clave como un array
con la clave y el valor.
Ref: https://apidock.com/ruby/Enumerable/inject#530-Parameters-for-Hash-inject
=end
def listar(hash)
    indice = 0
    hash.inject("") {|acumulador, (clave, valor) | 
        indice += 1;
        puts clave
        acumulador += "%s. %s: %s\n" % [indice, clave, valor]
    }
end
resul = listar({ perros: 2, gatos: 2, peces: 0, aves: 0 })
puts resul.class
puts resul
