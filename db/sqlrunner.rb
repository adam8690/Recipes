require( 'pg' )

class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect({ dbname: 'recipe_tracker', host: 'localhost', user: 'postgres', password: '****', port: '5432' })
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end

end
