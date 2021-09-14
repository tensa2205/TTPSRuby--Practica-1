def multiplos_de_3_y_5(tope)
    (1..tope).select{|n| n%3 == 0 && n%5 == 0}.sum
end

resul = multiplos_de_3_y_5(100)
puts resul