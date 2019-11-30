require_relative('../db/sql_runner.rb')
class Exclass

  attr_reader :id
  attr_accessor :date, :time, :type, :instructor, :length_min

def initialize(details)
  @id = details['id'].to_i if details['id']
  @date = details['date']
  @time = details['time']
  @type = details['type']
  @instructor = details['instructor']
  @length_min = details['length_min']
end


def save()
  sql = "INSERT INTO exclasses ( date, time, type, instructor, length_min)
  VALUES ($1, $2, $3, $4, $5) RETURNING id"
  values = [@date, @time, @type, @instructor, @length_min]
  result = SqlRunner.run(sql, values)
  @id =result[0]['id'].to_i()
end

def self.delete_all()
  sql = "DELETE FROM exclasses"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM exclasses"
  result = SqlRunner.run(sql)
  return result.map{|exclass| Exclass.new(exclass)}
end



end
