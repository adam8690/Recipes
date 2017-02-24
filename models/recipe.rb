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

def self.find_names
  sql = "SELECT recipe_name FROM recipes"
  return SqlRunner.run(sql)
end

def self.find_all
  sql = "SELECT * FROM recipes"
  return SqlRunner.run(sql)
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
  sql = "SELECT * FROM recipes WHERE id =#{id}"
  return SqlRunner.run(sql)
end

end