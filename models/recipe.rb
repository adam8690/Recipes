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


end