require 'date'
require 'time'
now = DateTime.now
DEFECTO = Time.parse( (DateTime.new(now.year, now.month, now.day, 0, 0, 0, now.zone) + 1).to_s )

def cuanto_falta?(momento = DEFECTO)
    actual = Time.now
    ((momento - actual) / 60).round
end

puts cuanto_falta? Time.new(2021, 9, 14, 22, 05, 00)
