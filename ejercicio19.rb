def notacion_entera(rgbArray)
    return rgbArray[0] + rgbArray[1] * 256 + rgbArray[2] * 256 * 256 if rgbArray.length == 3
    abort("Se esperaba array de 3 elementos, no uno de %s" % [rgbArray.length])
end

def notacion_hexadecimal(rgbArray)
    rgbArray.map { |decimal| decimal.to_s(16)}.join("").upcase
end

puts notacion_hexadecimal([0, 128, 255])
puts notacion_entera([0, 128,255])