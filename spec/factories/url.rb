FactoryBot.define do
  
  sequence(:random_id) do |n|
    @random_rankings ||= (1..10).to_a.shuffle
    @random_rankings[n]
  end

  factory :link do
    sequence(:full_url) { |n| "#{Faker::Internet.url}/#{n}" }
    sequence(:id) { FactoryBot.generate(:random_id) }
    sequence(:clicks) { FactoryBot.generate(:random_id) }
  end

  factory :url do
    sequence(:full_url) { |n| "#{Faker::Internet.url}/#{n}" }
    sequence(:id) { FactoryBot.generate(:random_id) }

  end
end
