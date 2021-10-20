=begin 
    Ejercicio explicativo, Enumeradores vs Enumeradores Lazy

    Supongamos que deseemos obtener 10 perfiles de twitter que tengan
    la palabra @rails en su biografía de pérfil.

    Y tenemos 1000 usuarios a procesar.

    Lo siguiente, usando enumeradores comunes, soluciona el problema:

        # Array of twitter user id's
        twitter_user_ids = [...]

        twitter_user_ids.map { |user_id| TwitterClient.user(user_id) }
        .select { |data| data[:description].includes?("@rails") }
        .first(10)
    
    Ok, iteramos sobre 1000 usuarios. Pero que hubiera pasado si los primeros
    10 usuarios tenían la palabra @rails en su bio? Habriamos iterado
    sobre 990 usuarios al pedo.

    La siguiente solución, usa enumerador lazy:

        Array of twitter user id's
        twitter_user_ids = [...]

        twitter_user_ids.lazy
        .map { |user_id| TwitterClient.user(user_id) }
        .select { |data| data[:description].includes?("@rails") }
        .first(10)
    
    Vemos que se incluye el mensaje .lazy

    Acá buscamos usuario por usuario PERO sin iterar sobre los 1000 usuarios.
    El loop terminaría cuando se encuentren 10 usuarios con la condición
    requerida.

    Ahorramos 990 pasadas. Lindo, no?
=end