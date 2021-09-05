def chequear_divisores(divisores,valor)
    divisores.each do | divisor | return false if not valor % divisor == 0  end
    return true
end

def multiplos_de(divisores, tope)
    (1..tope).select{|n| chequear_divisores(divisores, n) }.sum
end

resul =  multiplos_de([3, 5, 17, 28, 65], 100_000)
puts resul