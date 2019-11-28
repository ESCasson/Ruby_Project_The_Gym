require('pry')
require_relative('../models/member.rb')

member1 = Member.new({
  'first_name' => 'Ellie',
  'last_name' => 'Casson',
  'premier_member' => 'true'
})

member1.save()

binding.pry

nil
