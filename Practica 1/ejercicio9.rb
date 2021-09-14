def string_reverso(string)
    string.reverse
end
def string_sin_espacio(string)
    string.gsub(/\s+/, "")
end
def string_a_arreglo_ascii(string)
    string.codepoints
end
def string_reemplaza_vocal(string)
    hash = {'a'=>'4','A'=>'4', 'e'=>'3','E'=>'3', 'i'=>'1','I'=>'1', 'o'=>'0','O'=>'0', 'u'=>'6','U'=>'4'}
    string.gsub(/[aeiouAEIOU]/, hash)
end