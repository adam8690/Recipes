require_relative('../db/sqlrunner.rb')

class Ingredient

attr_accessor :name, :unit
attr_reader :id

def initialize( options )
  @id = nil || options['id'].to_i
  @name = options['name']
  @unit = options['unit']
end

def save
  sql = "INSERT INTO ingredients (name, unit) VALUES ('#{@name}', '#{@unit}') RETURNING * ;"
  result = SqlRunner.run(sql)
  @id = result.first()['id'].to_i
end

def self.delete_all
  sql = "DELETE FROM ingredients"
  SqlRunner.run(sql)
end

def recipes
  sql ="SELECT r.* FROM recipes r INNER JOIN recipe_ingredients ri ON ri.recipe_id = r.id WHERE ingredient_id = #{@id};"
  result = SqlRunner.run(sql)
  return  result.map{ |recipe| Recipe.new( recipe ) }
end

end