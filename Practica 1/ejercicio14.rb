def listar_mejorada(hash, pegamento=": ")
    indice = 0
    hash.inject("") {|acumulador, (clave, valor) | 
        indice += 1;
        puts clave
        acumulador += "%s. %s%s %s\n" % [indice, clave, pegamento, valor]
    }
end
resul = listar_mejorada({ perros: 2, gatos: 2, peces: 0, aves: 0 }, " -> ") 
puts resul.class
puts resul