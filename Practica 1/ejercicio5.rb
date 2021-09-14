def reemplazar(string)
    string.gsub(/[{}]/, { '{'=> 'do\n', '}'=>'\nend'})
end
resul = reemplazar("3.times { |i| puts i }")
puts resul