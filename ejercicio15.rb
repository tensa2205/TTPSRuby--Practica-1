=begin
.tr('A-Za-z', 'N-ZA-Mn-za-m')
Sets:
A-Z -> de la A hasta la Z. a-z lo mismo pero minúsculas -> ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
N-Z A-M n-z a-m -> N a Z, A a M (mayus) n a z, a a z (minus) -> NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm

TR lee cada caracter del string, si aparece en el primer set (A-Za-z)
lo reemplaza con el caracter en la misma posición del segundo set (N-ZA-Mn-za-m)
=end
def rot13(string)
    string.tr('A-Za-z', 'N-ZA-Mn-za-m')
end

resul = rot13("¡Bienvenidos a la cursada de TTPS Opción Ruby!")
puts resul