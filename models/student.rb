require_relative('../db/sql_runner.rb')

class Student

    attr_accessor :first_name, :last_name, :house_id, :age
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @house_id = options['house_id'].to_i
        @age = options['age']
    end

    def save()
        sql = "INSERT INTO students
        ( first_name, last_name, house_id, age )
        VALUES
        ( $1, $2, $3, $4 )
        RETURNING id"
        values = [@first_name, @last_name, @house_id, @age]
        id = SqlRunner.run(sql, values)[0]['id']
        @id = id.to_i
    end

    def full_name()
        return "#{@first_name} #{@last_name}"
    end

    def house()
        sql = "SELECT houses.* FROM houses
        INNER JOIN students
        ON students.house_id = houses.id
        WHERE students.id = $1"
        values = [@id]
        house_data = SqlRunner.run(sql, values).first
        return House.new(house_data)
    end

    def self.all()
      sql = "SELECT * FROM students"
      students = SqlRunner.run(sql)
      result = students.map { |student| Student.new(student)}
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM students
      WHERE id = $1"
      values = [id]
      student = SqlRunner.run(sql, values)
      result = Student.new(student.first)
      return result
    end

end