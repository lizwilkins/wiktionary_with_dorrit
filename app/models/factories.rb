FactoryGirl.define do
  # factory :list do
  #   word 'business stuff'
  # end

  factory :entry do
    word 'cook'
    definition 'make food'
    # association :list, :factory => :list
  end
end