=begin 
1.Seguí el flujo de ejecución registrando la traza de impresiones que deja el programa, ana‑
lizando por qué partes del código va pasando y justificando esos pasos.

PASOS:
    Entrando a fun1
    Entrando a fun2
    Entrando a fun3
    Tratando excepción provocada en TE -> debido a que se hace Raise de runtimeError
    Ejecutando ensure de fun3 -> debido a que el ensure es el bloque que siempre se ejecuta
    Manejador de excepciones de fun1 -> debido a que fun2 lanzó una excepción y fun1 la tomó
    Ejecutando ensure de fun1 -> debido a que el ensure es el bloque que siempre se ejecuta
    Manejador de excepciones de Main -> debido al raise en fun1.
    Correcion de x
----------------------------- Retry
    Entrando a fun1
    Entrando a fun2
    Entrando a fun3
    Tratando excepción provocada en TE -> debido a que se hace Raise de runtimeError
    Terminando fun2
    Ejecutando unsure de fun1 -> debido a que el ensure es el bloque que siempre se ejecuta
    Salida

2.¿Qué pasaría si se permuta, dentro de fun3, el manejador de excepciones para
RuntimeError y el manejador de excepciones genérico (el que tiene el rescue vacío)?

Dado que el chequeo de rescues se hace en el orden que se escriben, entraría al manejador de excepciones genérico.

3. ¿El uso de retry afectaría el funcionamiento del programa si se mueve la línea x = 0
dentro del segundo begin (inmediatamente antes de llamar a fun1 con x)?

Generaria un loop infinito. Ya que X en 0 es lo que triggerea que se vuelta a ejecutar todo el flujo del programa.
=end
def fun3
    puts "Entrando a fun3"
    raise RuntimeError, "Excepción intencional"
    puts "Terminando fun3"
rescue NoMethodError => e
    puts "Tratando excepción por falta de método"
rescue RuntimeError => e
    puts "Tratando excepción provocada en tiempo de ejecución"
rescue
    puts "Tratando una excepción cualquiera"
ensure
    puts "Ejecutando ensure de fun3"
end

def fun2(x)
    puts "Entrando a fun2"
    fun3
    a = 5 / x
    puts "Terminando fun2"
end

def fun1(x)
    puts "Entrando a fun1"
    fun2 x
rescue
    puts "Manejador de excepciones de fun1"
    raise
ensure
    puts "Ejecutando ensure de fun1"
end

begin
    x = 0
    begin
        fun1 x
    rescue Exception => e
        puts "Manejador de excepciones de Main"
        if x == 0
            puts "Corrección de x"
            x = 1
            retry
        end
    end
    puts "Salida"
end