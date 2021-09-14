#Conversión de String a Symbol. Dos formas

str1 = 'Soy un String'
puts str1.to_sym.class

str2 = 'Hola mundo'
puts str2.intern.class