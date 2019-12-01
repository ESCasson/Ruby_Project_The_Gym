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

  def self.all()
    sql = "SELECT * FROM members"
    result = SqlRunner.run(sql)
    return result.map{|member| Member.new(member)}
  end


  def self.membership_display(membership_details)
    if membership_details == 't'
      return 'Premier Member'
    end
    return 'Standard Member'
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    member = SqlRunner.run(sql,values)
    result = Member.new(member[0])
    return result
  end

  def update()
    sql = "UPDATE members SET (first_name, last_name, premier_member) =
    ($1, $2, $3) WHERE id = $4"
    values = [@first_name, @last_name, @premier_member, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql, values)
  end

def full_name()
  return @first_name + " " + @last_name
end

end
