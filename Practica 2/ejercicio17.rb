def metodo_excepciones(*args, &block)
    begin
        args.each{ |element|
            block.call(element)
        }
    rescue RuntimeError
        puts "Hay algo mal que no anda bien"
        return :rt
    rescue NoMethodError => e
        puts "Y este método? " + e.message()
        return :nm
    rescue 
        puts "Y ahora?"
        raise #relanza excepción
    end
end

metodo_excepciones(1,2,3) {|x| puts x}
metodo_excepciones(1,2,3) {raise RuntimeError}
metodo_excepciones(1,2,3) {raise NoMethodError}
#El sgte rompe el programa ya que raise lanza la excepción fuera del método.
metodo_excepciones(1,2,3) {raise StandardError}