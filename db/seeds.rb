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
  'date' => '2019-12-15',
  'time' => '20:00',
  'type' => 'Boxfit',
  'instructor' => 'Steve',
  'length_min' => '60',
  'capacity' => '15',
  'peak' => 'true'
})

exclass2 = Exclass.new({
  'date' => '2019-12-16',
  'time' => '20:00',
  'type' => 'Body Balance',
  'instructor' => 'Debbie',
  'length_min' => '60',
  'capacity' => '30',
  'peak' => 'false'
})

exclass3 = Exclass.new({
  'date' => '2019-12-15',
  'time' => '19:00',
  'type' => 'Body Balance',
  'instructor' => 'Steve',
  'length_min' => '60',
  'capacity' => '30',
  'peak' => 'true'
})

exclass4 = Exclass.new({
  'date' => '2019-12-15',
  'time' => '17:00',
  'type' => 'Yoga',
  'instructor' => 'Shazza',
  'length_min' => '60',
  'capacity' => '15',
  'peak' => 'true'
})

exclass5 = Exclass.new({
  'date' => '2019-11-23',
  'time' => '19:00',
  'type' => 'Body Jam',
  'instructor' => 'Steve',
  'length_min' => '60',
  'capacity' => '15',
  'peak' => 'true'
})


exclass6 = Exclass.new({
  'date' => '2019-11-22',
  'time' => '20:00',
  'type' => 'Boxfit',
  'instructor' => 'Sarah',
  'length_min' => '45',
  'capacity' => '15',
  'peak' => 'true'
})
exclass7 = Exclass.new({
  'date' => '2019-11-29',
  'time' => '20:00',
  'type' => 'Boxfit',
  'instructor' => 'Sarah',
  'length_min' => '45',
  'capacity' => '15',
  'peak' => 'true'

})
exclass8 = Exclass.new({
  'date' => '2019-12-03',
  'time' => '20:00',
  'type' => 'Boxfit',
  'instructor' => 'Sarah',
  'length_min' => '45',
  'capacity' => '15',
  'peak' => 'true'
})

exclass1.save()
exclass2.save()
exclass3.save()
exclass4.save()
exclass5.save()
exclass6.save()
exclass7.save()
exclass8.save()


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
