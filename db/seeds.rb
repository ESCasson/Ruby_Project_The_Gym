require('pry')
require_relative('../models/member.rb')

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

binding.pry

nil
