require('minitest/autorun')
require('minitest/reporters')



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../attendee.rb')


class TestAttendee < MiniTest::Test

  def test_attendee_attr()
    attendee1 = Attendee.new({
      'member_id' => 3,
      'exclass_id' => 4
      })

      assert_equal(3, attendee1.member_id)
      assert_equal(4, attendee1.exclass_id)

  end

end
