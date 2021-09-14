def longitud(stringArray)
    stringArray.map do |string| string.size
    end
end
puts longitud(['TTPS', 'Opción', 'Ruby', 'Cursada 2019'])
puts longitud(['TTPS', 'Opción', 'Ruby', 'Cursada 2019']).class
