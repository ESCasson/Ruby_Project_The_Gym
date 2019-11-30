require('pry')
require_relative('../models/member.rb')
require_relative('../models/exclass.rb')
require_relative('../models/attendee.rb')

Attendee.delete_all
Exclass.delete_all()
Member.delete_all()

member1 = Member.new({
  'first_name' => 'Ellie',
  'last_name' => 'Casson',
  'premier_member' => 'true'
})
member2 = Member.new({
  'first_name' => 'Betty',
  'last_name' => 'Boop',
  'premier_member' => 'false'
})
member3 = Member.new({
  'first_name' => 'Daniel',
  'last_name' => 'Craig',
  'premier_member' => 'true'
})


member1.save()
member2.save()
member3.save()


exclass1 = Exclass.new({
  'date' => '2019-12-01',
  'time' => '20:00',
  'type' => 'Body Balance',
  'instructor' => 'Steve',
  'length_min' => '60'
})

exclass2 = Exclass.new({
  'date' => '2019-12-01',
  'time' => '20:00',
  'type' => 'Body Balance',
  'instructor' => 'Debbie',
  'length_min' => '60'
})

exclass3 = Exclass.new({
  'date' => '2019-12-01',
  'time' => '20:00',
  'type' => 'Body Balance',
  'instructor' => 'Steve',
  'length_min' => '60'
})

exclass1.save()
exclass2.save()
exclass3.save()


attendee1 = Attendee.new({
  'member_id' => member1.id,
  'exclass_id' => exclass1.id
  })
attendee2 = Attendee.new({
  'member_id' => member2.id,
  'exclass_id' => exclass1.id
  })

attendee3 = Attendee.new({
  'member_id' => member3.id,
  'exclass_id' => exclass3.id
  })

attendee1.save()
attendee2.save()
attendee3.save()



binding.pry

nil
