require_relative('../db/sql_runner.rb')
require_relative('attendee.rb')

class Exclass

  attr_reader :id
  attr_accessor :date, :time, :type, :instructor, :length_min, :capacity, :peak

def initialize(details)
  @id = details['id'].to_i() if details['id']
  @date = details['date']
  @time = details['time']
  @type = details['type']
  @instructor = details['instructor']
  @length_min = details['length_min'].to_i()
  @capacity = details['capacity'].to_i()
  @peak = details['peak']
end


def save()
  sql = "INSERT INTO exclasses
  ( date, time, type, instructor, length_min, capacity, peak)
  VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id"
  values = [@date, @time, @type, @instructor, @length_min, @capacity, @peak]
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


def self.all_current()
  sql = "SELECT * FROM exclasses WHERE date > current_date - interval '1 day'
  ORDER BY date DESC, time DESC"
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

def self.find_by_date(date)
  sql = "SELECT * FROM exclasses WHERE date = $1"
  values = [date]
  exclasses = SqlRunner.run(sql, values)
  return result = exclasses.map{|exclass| Exclass.new(exclass)}
end

def update()
  sql = "UPDATE exclasses SET (date, time, type, instructor, length_min, capacity, peak)
  = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
  values = [@date, @time, @type, @instructor, @length_min, @capacity, @peak, @id]
  SqlRunner.run(sql, values)
end

def spaces()
  return @capacity - Attendee.find_by_exclass_id(@id).count()
end

def no_spaces_disabled()
  if spaces < 1
    return "disabled"
  end
end

def no_spaces_message_index()
  if spaces < 1
    return "Delete Attendees"
  end
  "Add Attendees"
end

def no_spaces_message_show()
  if spaces < 1
    return "No Spaces"
  end
  "Add Attendees"
end

def pretty_date()
  return @date[-2,2] + "/"+ @date[5,2] + "/" + @date[0,4]
end

end
