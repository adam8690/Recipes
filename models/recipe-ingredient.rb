class RecipeIngredient

attr_accessor :ingredient_id, :recipe_id
attr_reader :id

def initialize( options )
  @id = options['id'].to_i
  @ingredient_id = options['ingredient_id'].to_i
  @recipe_id = options['recipe_id'].to_i
end

def save
  sql = "INSERT INTO recipe_ingredients (ingredient_id, recipe_id) VALUES (#{ingredient_id}, #{recipe_id}) RETURNING * "
  result = SqlRunner.run(sql)
  @id = result.first['id']
end

def self.delete_all
  sql = "DELETE FROM recipe_ingredients"
  SqlRunner.run(sql)
end


end