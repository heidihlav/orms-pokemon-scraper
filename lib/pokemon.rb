require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db
    
    def initialize(id:, name:, type:, db:)
      @id = id
      @name = name
      @type = type
      @db = db
    end

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
      found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
      self.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db)

    end

end
