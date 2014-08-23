FactoryGirl.define do
  factory :user do
    name "Khoi"
    email "khoitran_2014@depauw.edu"
    password "123!@#ab"
  end

  factory :ride do
    start "DePauw"
    destination "Indy Airport"
    time Time.now
  end
end
