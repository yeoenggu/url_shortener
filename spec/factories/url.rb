FactoryBot.define do
  factory :link do
    sequence(:full_url) { |n| "#{Faker::Internet.url}/#{n}" }
  end

  factory :url_already_accessed, parent: :url do
    sequence(:clicks) {|n| n }
  end

end
