#El siguiente código me genera sensaciones encontradas
def obtener_hora_siguiente(fechaHora)
    oneHourLater = 0
    if fechaHora.hour != 23
        oneHourLater = fechaHora.hour.to_i + 1
    end
    oneHourLater
end
def obtener_cobertura_minutos(minutos)
    cover = ''
    case minutos
    when 0..10
        cover = ' en punto'
    when 11..20
        cover = ' y cuarto'
    when 21..34
        cover = ' y media'
    when 35..44
        cover = ' menos veinticinco'
    when 45..55
        cover = ' menos cuarto'
    when 55..59
        cover = 'Casi %s'
    end
end

#El siguiente código me genera sensaciones encontradas
def tiempo_en_palabras(fechaYHora)
    oneHourLater = obtener_hora_siguiente(fechaYHora)
    case fechaYHora.hour
    when 1
        expHora = 'Es la 1'
        booleano = true
        expHoraSiguienteUna = 'Son las 2'
    else
        expHora = "Son las %d"
    end

    coverMin = obtener_cobertura_minutos(fechaYHora.min)

    resul = ''
    case fechaYHora.min
    when 0..34
        resul = expHora % [fechaYHora.hour] + coverMin
    when 35..55
        resul = (booleano ? expHoraSiguienteUna  : expHora % [oneHourLater]) + coverMin
    when 56..59
        resul = booleano ? coverMin % [expHoraSiguienteUna] : coverMin % [expHora] % [oneHourLater]
    end

    puts resul.capitalize()
end

tiempo_en_palabras(Time.new(2021, 10, 21, 10, 1))
tiempo_en_palabras(Time.new(2021, 10, 21, 9, 35))
tiempo_en_palabras(Time.new(2021, 10, 21, 8, 45))
tiempo_en_palabras(Time.new(2021, 10, 21, 6, 58))
tiempo_en_palabras(Time.new(2021, 10, 21, 0, 58))
