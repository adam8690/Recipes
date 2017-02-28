require_relative('./list_item.rb')

class Recipe

attr_accessor :recipe_name, :method
attr_reader :id

def initialize( options )
  @id = nil || options['id'].to_i
  @recipe_name = options['recipe_name']
  @method = options['method']
end

def save
  sql = "INSERT INTO recipes (recipe_name, method) VALUES ('#{@recipe_name}', '#{@method}') RETURNING * ;"
  result = SqlRunner.run(sql)
  @id = result.first['id'].to_i
end

def update
  sql = "UPDATE recipes SET
    recipe_name = '#{@recipe_name}',
    method = '#{@method}'
    WHERE id =#{@id};"
    SqlRunner.run(sql)
end

def self.find_names
  sql = "SELECT recipe_name FROM recipes"
  return SqlRunner.run(sql)
end

def self.find_all
  sql = "SELECT * FROM recipes"
  return SqlRunner.run(sql).map{ |recipe| Recipe.new(recipe) }
end

def self.delete_all
  sql = "DELETE FROM recipes"
  SqlRunner.run(sql)
end

def self.delete(id)
  sql = "DELETE FROM recipes WHERE id = #{id}"
  SqlRunner.run(sql)
end 

def self.show(id)
  sql = "SELECT * FROM recipes WHERE id=#{id}"
  result = SqlRunner.run(sql).first
  return Recipe.new(result)
end

def ingredients
    sql = "SELECT i.* FROM ingredients i INNER JOIN recipe_ingredients ri ON ri.ingredient_id = i.id WHERE recipe_id = #{@id}"
    results = SqlRunner.run(sql)
    
  return results.map {|ingredient| Ingredient.new( ingredient )}
end

def add_to_shopping_list
    sql = "SELECT recipe_id, name FROM ingredients i INNER JOIN recipe_ingredients ri ON ri.ingredient_id = i.id WHERE recipe_id = #{@id}"
    results = SqlRunner.run(sql)
    
    for ingredient in results
      listitem = ListItem.new( ingredient )
      listitem.save
    end

end

def save_ingredient_string_if_new(string)
  ingredients_array = string.split(",")

  #delete all instances of recipe id (e.g 1 chocolate cake)
  RecipeIngredient.delete(@id)

  for ingredient in ingredients_array
    new_ingredient = Ingredient.new({
      'name' => ingredient.strip
      })
    
    found_ingredient = Ingredient.show(new_ingredient.name).first

    if found_ingredient == nil
      new_ingredient.save
    else
      new_ingredient.id = found_ingredient.id
    end
    
    recipe_ingredient = RecipeIngredient.new({
      'ingredient_id' => new_ingredient.id,
      'recipe_id' => @id
      })
    recipe_ingredient.save
      
  end

end 

end