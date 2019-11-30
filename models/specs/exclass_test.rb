require('minitest/autorun')
require('minitest/reporters')



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../exclass.rb')


class TestExclass < MiniTest::Test

def test_exclass()

  exclass1 = Exclass.new({
    #YYYY-MM-DD hh:mm:ss
    'date_time' => '2019-12-01 20:00:00',
    'type' => 'Body Balance',
    'instructor' => 'Steve',
    'length_min' => '60'
  })
  assert_equal('2019-12-01 20:00:00', exclass1.datetime)
  assert_equal('Body Balance', exclass1.type)
  assert_equal('Steve', exclass1.instructor)
  assert_equal(60, exclass1.length_min.to_i())
end




end
