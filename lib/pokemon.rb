require 'pry'

class Pokemon
	attr_accessor	:name, :type, :db, :id

	def initialize(id:,name:,type:,db:)
		@name = name
		@type = type
		@id = id
		@db = db
	end

	def self.save(name,type,db)
			db.execute("INSERT INTO pokemon (name, type) 
						VALUES (?, ?)",
						name,
						type
					)
	end

	def self.find(id, db)
		var = db.execute("SELECT * FROM pokemon WHERE pokemon.id=?",id).flatten
		#var.join(",")
		binding.pry	
		Pokemon.new(id: var[0], name: var[1], type: var[2], db: db)	
	end
end
