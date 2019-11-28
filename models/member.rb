require_relative('../db/sql_runner.rb')

class Member
attr_reader :id
attr_accessor :first_name, :last_name, :premier_member

def initialize(details)
  @id = details['id'].to_i if details['id']
  @first_name = details['first_name']
  @last_name = details['last_name']
  @premier_member = details['premier_member']
end

def save()
  sql = "INSERT INTO members (first_name, last_name, premier_member)
  VALUES ($1, $2, $3) RETURNING id"
  values = [@first_name, @last_name, @premier_member]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i()
end

def self.delete_all()
  sql = "DELETE FROM members"
  SqlRunner.run(sql)
end

end
