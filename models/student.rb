require_relative('../db/sql_runner.rb')

class Student

    attr_accessor :first_name, :last_name, :house, :age
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @house = options['house']
        @age = options['age']
    end

    def save()
        sql = "INSERT INTO students
        ( first_name, last_name, house, age )
        VALUES
        ( $1, $2, $3, $4 )
        RETURNING id"
        values = [@first_name, @last_name, @house, @age]
        id = SqlRunner.run(sql, values)[0]['id']
        @id = id.to_i
    end

    def full_name()
        return "#{@first_name} #{@last_name}"
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