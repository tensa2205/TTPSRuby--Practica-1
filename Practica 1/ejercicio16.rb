def decodificar_char(char,n)
    case char
      when 'a'..'m', 'A'..'M'
        char.ord + n
      when 'n'..'z', 'N'..'Z'
        char.ord - n
      else
        char
    end.chr
end

def rot(word,rotacion)
    new_word = word.chars.map do |char|
      decodificar_char(char,rotacion)
    end.join
end

resul = rot("¡Bienvenidos a la cursada de TTPS Opción Ruby!",13)
puts resul
