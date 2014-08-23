FactoryGirl.define do
  factory :user do
    name "Khoi"
    email "khoitran_2014@depauw.edu"
    password "123!@#ab"
  end

  factory :ride do
    start "DePauw"
    destination "Indy Airport"
    seats_left 3
    time Time.now
  end
end
