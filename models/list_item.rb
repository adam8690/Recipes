class ListItem

attr_accessor 
attr_reader :id, :recipe_id, :ingredient

def initialize( options )
  @id = options['id']
  @recipe_id = options['recipe_id']
  @ingredient = options['name']
end

def save
  sql = "INSERT INTO shopping_list (recipe_id, ingredient) VALUES (#{@recipe_id}, '#{@ingredient}') RETURNING * ;"
  result = SqlRunner.run(sql)
  @id = result.first['id'].to_i
end

def self.delete_all
  sql = "DELETE FROM shopping_list"
  SqlRunner.run(sql)
end

end

