require('minitest/autorun')
require('minitest/reporters')



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../exclass.rb')


class TestExclass < MiniTest::Test

def test_exclass()

  exclass1 = Exclass.new({
    #YYYY-MM-DD hh:mm:ss
    'date' => '2019-12-01',
    'time' => '20:00:00',
    'type' => 'Body Balance',
    'instructor' => 'Steve',
    'length_min' => '60',
    'capacity' => '30',
    'peak' => 'true'
  })
  assert_equal('2019-12-01', exclass1.date)
  assert_equal('20:00:00', exclass1.time)
  assert_equal('Body Balance', exclass1.type)
  assert_equal('Steve', exclass1.instructor)
  assert_equal(60, exclass1.length_min.to_i())
  assert_equal(30, exclass1.capacity.to_i())
  assert_equal('true', exclass1.peak)
end




end
