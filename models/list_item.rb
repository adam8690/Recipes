class ListItem

attr_accessor 
attr_reader :id, :recipe_id, :name

def initialize( options )
  @id = options['id'].to_i
  @recipe_id = options['recipe_id'].to_i
  @name = options['name']
end

def save
  sql = "INSERT INTO shopping_list (recipe_id, name) VALUES (#{@recipe_id}, '#{@name}') RETURNING * ;"
  result = SqlRunner.run(sql)
  @id = result.first['id'].to_i
end

def self.delete_all
  sql = "DELETE FROM shopping_list"
  SqlRunner.run(sql)
end

def self.show_all
  sql = "SELECT * FROM shopping_list"
  return SqlRunner.run(sql).map{ |ingredient| ListItem.new( ingredient ) }
end

end

