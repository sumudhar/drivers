FactoryGirl.define do

  factory :driver, class: Driver  do |a|
    first_name 'Murali'
    last_name 'Dhar'
    phone  '9642234646'
    created_at Time.now
    updated_at Time.now
  end

  # factory :driver_no_phone, class: Driver  do |a|
  #   first_name 'Murali'
  #   last_name 'Dhar'
  #   created_at Time.now
  #   updated_at Time.now
  # end
  #
  # factory :driver_no_last_name, class: Driver  do |a|
  #   first_name 'Murali'
  #   phone  '9642234646'
  #   created_at Time.now
  #   updated_at Time.now
  # end
  #
  # factory :driver_no_first_name, class: Driver  do |a|
  #   last_name 'Dhar'
  #   phone  '9642234646'
  #   created_at Time.now
  #   updated_at Time.now
  # end



end