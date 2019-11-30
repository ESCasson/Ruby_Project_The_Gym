require('minitest/autorun')
require('minitest/reporters')



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../member.rb')


class TestMember < MiniTest::Test

def test_member()
  member1 = Member.new({
    'first_name' => 'Ellie',
    'last_name' => 'Casson',
    'premier_member' => 'true'
  })
  assert_equal('Ellie', member1.first_name)
  assert_equal('Casson', member1.last_name)
  assert_equal('true', member1.premier_member)
end

def test_full_name()
  member1 = Member.new({
    'first_name' => 'Ellie',
    'last_name' => 'Casson',
    'premier_member' => 'true'
  })
  assert_equal('Ellie Casson', member1.full_name())
end




end
