FactoryGirl.define do
  factory :player do
    first_name "Test"
    last_name "Player"
    id 1
  end

  factory :player_one, class: Player do
    first_name "John"
    last_name "Doe"
  end

  factory :player_two, class: Player do
    first_name "Jane"
    last_name "Doll"   
  end
end
