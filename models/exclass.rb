require_relative('../db/sql_runner.rb')
class Exclass

  attr_reader :id
  attr_accessor :datetime, :type, :instructor, :length

def initialize(details)
  @id = details['id'].to_i if details['id']
  @datetime = details['datetime']
  @type = details['type']
  @instructor = details['instructor']
  @length_min = details['length_min']
end

end
