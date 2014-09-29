FactoryGirl.define do
  sequence :name do |n|
    "name-#{n}"
  end

  sequence :email do |n|
    "people#{n}@laposte.net"
  end

  factory :essai do
    exercice
  end

  factory :exercice do
  end

  factory :user do
    password 'truc'
    password_confirmation 'truc'
    email { generate(:email) }
    name { generate(:name) }
  end

  factory :qcm do
    lesson
    authors ['someone', 'someone else']
  end

  factory :question do
    qcm
  end

  factory :choice do
    question
  end

  factory :answer do
    question
    user
  end

  factory :lesson do
    title { generate(:name) }
    online false
    authors {|t| [t.association(:user)] }
  end

  factory :chapter do
    lesson
    title { generate(:name) }
    authors {|t| [t.association(:user)] }
  end

  factory :definition do
    keyword { generate(:name)}
    description { generate(:name)}
  end
end


