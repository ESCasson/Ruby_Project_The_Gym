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

end
