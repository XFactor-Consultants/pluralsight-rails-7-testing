FactoryBot.define do 
    factory :wiki_post do 
        title { Faker::Lorem.sentence }
        description { Faker::Lorem.paragraph }
        author { Faker::Name.name }
        trait :old do 
            created_at { 1.day.ago }
        end 
    end 
end 