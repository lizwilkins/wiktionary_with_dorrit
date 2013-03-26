FactoryGirl.define do
  factory :list do
    word 'business stuff'
  end

  factory :entry do
    word 'Cook the books'
    association :list, :factory => :list
  end
end