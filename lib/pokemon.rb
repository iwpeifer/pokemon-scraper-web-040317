class Pokemon

	attr_reader :id, :name, :type, :db, :hp

	@@all = []

	def initialize(id:, name:, type:, db:, hp: nil)
		@id = id
		@name = name
		@type = type
		@db = db
		@hp = hp
		@@all << self
	end

	def self.all 
		@@all
	end

	def self.save (name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
	end

	def self.find(id, db)
		new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
		Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db, hp: new_pokemon[3])
	end

	def alter_hp(new_hp, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
	end


end
