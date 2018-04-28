FactoryBot.define do
  
  sequence(:random_ranking) do |n|
    @random_rankings ||= (1..10).to_a.shuffle
    @random_rankings[n]
  end

  factory :link do
    sequence(:full_url) { |n| "#{Faker::Internet.url}/#{n}" }
    sequence(:id) { FactoryBot.generate(:random_ranking) }
    sequence(:clicks) { FactoryBot.generate(:random_ranking) }
  end

  # factory :link_click do
  #   sequence(:full_url) { |n| "#{Faker::Internet.url}/#{n}" }

  # end

  # factory :link_accessed, parent: :url do
  #   sequence(:clicks) {|n| n }
  # end

end
