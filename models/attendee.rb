

class Attendee
  attr_reader :id
  attr_accessor :member_id, :exclass_id


def initialize(details)
  @id = details['id'].to_i if details['id']
  @member_id = details['member_id'].to_i()
  @exclass_id = details['exclass_id']
end

def save()
  sql = "INSERT INTO attendees (member_id, exclass_id)
  VALUES ($1, $2) RETURNING id"
  values = [@member_id, @exclass_id]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i()

end

def self.delete_all
  sql = "DELETE FROM attendees"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM attendees WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.find_by_id(id)
  sql = "SELECT * FROM attendees WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values)
  return Attendee.new(result[0])
end

def self.find_by_exclass_id(exclass_id)
  sql = "SELECT * FROM attendees WHERE exclass_id = $1"
  values = [exclass_id]
  result = SqlRunner.run(sql, values)
  return result.map{|attendee| Attendee.new(attendee)}
end

def member_full_name()
  sql = "SELECT members.* FROM members
  INNER JOIN attendees ON attendees.member_id = members.id
  WHERE attendees.id = $1"
  values = [@id]
  result = SqlRunner.run(sql, values)
  member = Member.new(result[0])
  return member.first_name + " " + member.last_name
end


end
