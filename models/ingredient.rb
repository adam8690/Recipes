require_relative('../db/sqlrunner.rb')

class Ingredient

attr_accessor :name, :id

def initialize( options )
  @id = nil || options['id'].to_i
  @name = options['name']
end

def save
  sql = "INSERT INTO ingredients (name) VALUES ('#{@name}') RETURNING * ;"
  result = SqlRunner.run(sql)
  @id = result.first()['id'].to_i
end

def self.show(name)
  sql = "SELECT * FROM ingredients WHERE name = '#{name}'"
  return result = SqlRunner.run(sql).map { |ingredient| Ingredient.new( ingredient )}
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