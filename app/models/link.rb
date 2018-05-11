class Link < ApplicationRecord
	visitable
	after_create :generate_slug
	before_validation :default_clicks

	validates :full_url, presence: true, format: URI::regexp(%w(http https)), uniqueness: true
  	validates :clicks, presence: true
  	validates :slug, uniqueness: true

	def generate_slug(encoding="base32")
		# self.slug = self.id.to_s(36)
    self.slug = BaseEncoder.encode(self.id, encoding)
		self.save
	end

	def display_slug
		ENV['BASE_URL'] + self.slug
	end

	def clicked
		self.clicks += 1
		self.save
	end

	def default_clicks
		if self.clicks.nil?
			self.clicks = 0	
		end
	end
end
