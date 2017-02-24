require_relative('../db/sqlrunner.rb')

class Ingredient

def initialize( options )
@id = nil || options['id'].to_i
@name = options['name']
@unit = options['unit']
end

def save
sql = ("INSERT INTO ingredients (name, unit) VALUES ('#{@name}', '#{@unit}') RETURNING * ;")
result = SqlRunner.run(sql)
@id = result.first()['id'].to_i
end






end