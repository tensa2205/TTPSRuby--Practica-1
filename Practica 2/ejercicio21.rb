def es_primo?(numero)
    aux = 0
    1.step numero do |n|
        if numero % n == 0
            aux += 1
            if aux > 2
                return false
            end
        end
    end
    return true
end
primos = Enumerator.new do |caller|
    num = 1
    loop do
        if es_primo?(num)
            caller.yield num
        end
        num += 1
    end
end
6.times { puts primos.next }
