FactoryGirl.define do
  factory :user do
    name     "Allan Mercado"
    email    "allan@suite101.com"
    password "foobar"
    password_confirmation "foobar"
  end
end