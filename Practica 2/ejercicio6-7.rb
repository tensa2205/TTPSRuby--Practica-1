=begin
Usuarios finales, se divide en:
    Lectores -> lee documentos públicos
    Redactores -> idem que lectores y además pueden cambiar el contenido de documentos creados x ellos
    Directores -> cambiar o ver el contenido de cualquier documento sea público, privado y creado x cualquier usuario excepto documentos borrados
    Administradores -> idem directores y además pueden borrar documentos.

    JERARQUÍA DE CLASES
        |------Usuarios finales---------|
    Lectores                        Directores
        |                               |
    Redactores                      Administradores

    Métodos a implementar impuestos por clase Documento
        puede_ver?
        puede_ser_modificado_por?
        puede_ser_borrado_por?
    
    El método para borrar documento solo debería ser implementado por Admins
=end

class Documento
    attr_accessor :creador, :contenido, :publico, :borrado
    def initialize(usuario, publico = true, contenido = '')
        self.creador = usuario
        self.publico = publico
        self.contenido = contenido
        self.borrado = false
    end

    def borrar
        self.borrado = true
    end

    def puede_ser_visto_por?(usuario)
        usuario.puede_ver? self
    end

    def puede_ser_modificado_por?(usuario)
        usuario.puede_modificar? self
    end

    def puede_ser_borrado_por?(usuario)
        usuario.puede_borrar? self
    end
end

class UsuarioFinal
    attr_accessor :usuario, :clave, :email, :rol

    def initialize(nombre_usuario, clave, email)
        self.usuario = nombre_usuario
        self.clave = clave 
        self.email = email
        self.rol = ""
    end 
    
    def puede_ver?(documento)
        false
    end

    def puede_modificar?(documento)
        false
    end

    def puede_borrar?(documento)
        false
    end

    def to_s
        "#{self.email}  (#{self.rol})"
    end
end

#INICIO RAMA LECTORES - REDACTORES
class Lector < UsuarioFinal
    def initialize(nombre_usuario, clave, email)
        super(nombre_usuario, clave, email)
        self.rol =  "Lector"
    end

    def puede_ver?(documento)
        documento.publico 
    end
end

class Redactor < Lector
    def initialize(nombre_usuario, clave, email)
        super(nombre_usuario, clave, email)
        self.rol = "Redactor"
    end

    def puede_modificar?(documento)
        documento.creador == self.usuario
    end
end
#FIN RAMA LECTOR - REDACTOR

#INICIO RAMA DIRECTOR - ADMINISTRADOR
class Director < UsuarioFinal
    
    def initialize(nombre_usuario, clave, email)
        super(nombre_usuario, clave, email)
        self.rol = "Director"
    end

    def puede_ver?(documento)
        return !documento.borrado
    end
    
    def puede_modificar?(documento)
        return !documento.borrado
    end
end

class Administrador < Director
    def initialize(nombre_usuario, clave, email)
        super(nombre_usuario, clave, email)
        self.rol = "Administrador"
    end

    def puede_borrar?(documento)
        return !documento.borrado 
    end



red = Redactor.new("Juan123", "1234", "juancho@gmail.com")
lec = Lector.new("Pepe456", "456", "pepeco@gmail.com")
dir = Director.new("Agustino" ,"999", "diragustin@gmail.com")
adm = Administrador.new("El admin", "666", "superadmin@gmail.com")

docRed = Documento.new(red.usuario)
docBorrado = Documento.new(adm.usuario)
#true - adm
puts docBorrado.puede_ser_borrado_por?(adm)
#false - dir
puts docBorrado.puede_ser_borrado_por?(dir)
#borra
docBorrado.borrar

#true - lec
puts docRed.puede_ser_visto_por?(lec)
#true - red
puts docRed.puede_ser_modificado_por?(red)

puts lec
puts dir 
puts red
puts adm

end