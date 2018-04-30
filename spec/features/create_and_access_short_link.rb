require "rails_helper"

feature "Shorten link" do
	scenario "create link" do
		visit '/'

		fill_in "link_full_url", with: "https://thisisanfield.com"
      	click_button "Shorten Me"
      	expect(page).to have_content("Link was successfully created")
      	expect(find_link('https://thisisanfield.com').visible?).to be true
      	

      	# REVISIT: 
      	# Need to trace capybara. 

      	# print find_link('https://thisisanfield.com').path
      	# short_url = find(:xpath, '/html/body/div/dl/dd[2]/a')[:href]

      	# visit short_url
      	# save_and_open_page

	end
end
