require_relative('../db/sql_runner')
require_relative('./student')

class House

  attr_reader :house_name, :id

  def initialize( options )
    @id = options['id'].to_i
    @house_name = options['house_name']
  end

  def save()
    sql = "INSERT INTO houses
    (
      house_name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@house_name]
    house = SqlRunner.run(sql, values)
    @id = house.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    values = []
    houses = SqlRunner.run( sql, values )
    result = houses.map { |house| House.new( house )}
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run( sql, values )
    result = House.new( house.first )
    return result
  end

end
