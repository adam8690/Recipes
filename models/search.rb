class Search

def self.recipes_with(term)
  sql="SELECT i.name as ingredient, r.recipe_name as recipe FROM ingredients i inner join recipe_ingredients ri on ri.ingredient_id = i.id inner join recipes r on ri.recipe_id = r.id where i.name like '%#{term}%';"
  return SqlRunner.run(sql)
end














end