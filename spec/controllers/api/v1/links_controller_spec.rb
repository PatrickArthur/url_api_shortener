#spec/controllers/links_controller_spec.rb
require "spec_helper"
require "rails_helper"

describe Api::V1::LinksController , :type => :api do
	include RSpec::Rails::ControllerExampleGroup
	
	context "reads url and returns shorted url" do
		it 'generates a shortened url with a success' do
			slug = "test_slug"
			post :create, params: { url: 'http://test.com' , slug: slug}
			expect(response.status).to eq 200
			expect(response.body).to eq "your shortened url is: http://localhost:3000/short_url/#{slug}"
		end

		it 'generates a and error when not valid, missing url' do 
			post :create, params: { url: '' , slug: "test_slug"}
			expect(response.status).to eq 500
			expect(response.body).to eq "your url was not processed, please try again"
		end

		it 'generates a and error when not valid, url wrong format' do 
			post :create, params: { url: 'ders://' , slug: "test_slug"}
			expect(response.status).to eq 500
			expect(response.body).to eq "your url was not processed, please try again"
		end
	end

	context 'can delete url' do
		it "user reads slug from previous url and deletes" do
			Link.create(url: "http://www.test.com", slug: "test_slug")
			expect(Link.count).to eq 1
			delete :destroy, params: { id: "test_slug" }
			expect(Link.count).to eq 0
		end
	end
  
end