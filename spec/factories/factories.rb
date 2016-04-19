FactoryGirl.define do
# MY VERSION OF THIS: PLEASE DISREGARD
#  factory :pin do
#    title "Rails Cheatsheet"
#    url "http://rails-cheat.com"
#    text "A great tool for beginning developers"
#    sequence(:slug) { |n| "slug#{n}" }
#    category Category.find_by_name("rails")
#  end
#  factory :user do 
#    sequence(:email) { |n| "coder#{n}@mcswebsolutions.com" }
#    first_name "Skillcrush"
#    last_name "Coder"
#    password "secret"
#    after(:create) { |user| create_list(:pin, 9) }
#  end

  sequence :slug do |n| 
    "slug#{n}"
  end

  factory :pin do
    title "Rails Cheatsheet"
    url "http://rails-cheat.com"
    text "A great tool for beginning developers"
    slug
    category Category.find_by_name("rails")
  end

  factory :user do 
    sequence(:email) { |n| "coder#{n}@mcswebsolutions.com" }
    first_name "Skillcrush"
    last_name "Coder"
    password "secret"
 
    after(:create) do |user|
      create_list(:pin, 3)
    end
  end
end