# create model that can save student's details

require_relative('../db/sql_runner')
require_relative('./house')

class Student

  attr_reader :first_name, :surname, :house_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @surname = options['surname']
    @house_id = options['house_id'].to_i
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      surname,
      house_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@first_name, @surname, @house_id]
    student_record = SqlRunner.run(sql, values)
    @id = student_record.first()['id'].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@surname}"
  end

  def self.all()
    sql = "SELECT * FROM students"
    values = []
    students = SqlRunner.run( sql, values )
    result = students.map { |student| Student.new( student )}
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run( sql, values ).first
    result = Student.new( student )
    return result
  end

  def house
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [@house_id]
    house = SqlRunner.run( sql, values )
    result = House.new( house.first )
    return result
  end


end
