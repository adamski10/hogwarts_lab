require_relative('../db/sql_runner.rb')

class House

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO houses
    
      (name)
      
      VALUES
      
      ($1)
      
      RETURNING id"
      values = [@name]
      house = SqlRunner.run(sql, values)
      @id = house.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    result = houses.map { |house| House.new(house)}
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [id]
    house = SqlRunner.run( sql, values )
    result = House.new(house.first)
    return result
  end
end