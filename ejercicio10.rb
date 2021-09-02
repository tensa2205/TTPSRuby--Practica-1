#Valor de retorno?
=begin
TTPS RUBY
ttps ruby
Ttps ruby
ttps rUBY
=end

def funcion
    [:upcase, :downcase, :capitalize, :swapcase].map do |meth|
        "TTPS Ruby".send(meth)
    end
end

puts funcion

