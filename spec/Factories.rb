FactoryGirl.define do

  factory :driver, class: Driver  do |a|
    first_name 'Murali'
    last_name 'Dhar'
    phone  '9642234646'
    created_at Time.now
    updated_at Time.now
  end

  factory :location, class: Location do |a|
    latitude 12.5
    longitude 13.7
    accuracy 0.6
  end


end