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

def self.all_current()
  sql = "SELECT * FROM exclasses WHERE date > current_date - interval '1 day'"
  result = SqlRunner.run(sql)
  return result.map{|exclass| Exclass.new(exclass)}
end

def delete()
  sql = "DELETE FROM exclasses WHERE id = $1"
  values =[@id]
  SqlRunner.run(sql, values)
end

def self.find_by_id(id)
  sql = "SELECT * FROM exclasses WHERE id = $1"
  values = [id]
  exclass = SqlRunner.run(sql, values)
  result = Exclass.new(exclass[0])
  return result
end

def update()
  sql = "UPDATE exclasses SET (date, time, type, instructor, length_min)
  = ($1, $2, $3, $4, $5) WHERE id = $6"
  values = [@date, @time, @type, @instructor, @length_min, @id]
  SqlRunner.run(sql, values)
end



end
