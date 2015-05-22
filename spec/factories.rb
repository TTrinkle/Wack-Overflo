FactoryGirl.define do
  factory :answer do
    body { Faker::Lorem.sentence }
    author_id 1
    question_id 2
    score 5

  end
end


 