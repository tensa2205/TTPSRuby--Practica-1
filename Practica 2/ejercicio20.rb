class Array 
    def randomly(&block)
        #Invocar bloque con cada elemento del array en orden aleatorio
        if block_given?
            self.shuffle.each { |elem| block.call(elem)}
        else
            enu = self.shuffle.each
            self.count.times { puts enu.next }
        end
    end
end

arreglo = [1,2,3,4,5,6,7,8,9]
arreglo.randomly #Sin bloque
puts "============="
arreglo.randomly {|elem| puts elem * 2} #Con bloque