class Recipe

attr_accessor :recipe_name, :method
attr_reader :id

def initialize( options )
@id = options['id'].to_i
@recipe_name = options['recipe_name']
@method = options['method']
end




end