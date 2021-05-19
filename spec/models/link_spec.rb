# spec/models/auction_spec.rb

require 'rails_helper'

RSpec.describe Link, :type => :model do
	before :each do
		@slug = "test_slug"
		@url = "http://test.com"
		Link.destroy_all
	end

	it "is valid with valid attributes" do
		expect(Link.new(slug: @slug, url: @url)).to be_valid
	end

	it "is validates presence of url" do
		expect(Link.new(slug: @slug, url: "")).to_not be_valid
	end

	it "is validates format of url is http or https2" do
		url = "ht://test.com"
		expect(Link.new(slug: @slug, url: url)).to_not be_valid
	end

	it "is validates unigness of slug" do
		url = "http://test2.com"
		Link.create(slug: @slug, url: @url)
		expect(Link.new(slug: @slug, url: url)).to_not be_valid
	end

	it "it validates length of url, can't be longer then 255 charcters" do
		url = "http://test2.com/business/article/Changed-by-pandemic-many-workers-won-t-return-to-16185201.php?IPID=Times-Union-HP-CP-Spotlight/business/article/Changed-by-pandemic-many-workers-won-t-return-to-16185201.php?IPID=Times-Union-HP-CP-Spotlight/business/article/Changed-by-pandemic-many-workers-won-t-return-to-16185201.php?IPID=Times-Union-HP-CP-Spotlight/business/article/Changed-by-pandemic-many-workers-won-t-return-to-16185201.php?IPID=Times-Union-HP-CP-Spotlight/business/article/Changed-by-pandemic-many-workers-won-t-return-to-16185201.php?IPID=Times-Union-HP-CP-Spotlight"
		expect(Link.new(slug: @slug, url: url)).to_not be_valid
	end

	it "it validates length of slug, can't be less then 3 charcters" do
		slug = "h"
		expect(Link.new(slug: slug, url: @url)).to_not be_valid
	end

	it "it validates length of slug, can't be longer then 255 charcters" do
		slug = "hedeexwxwxwexwexewxewxewxewxwexewxewxewxewxewxewxwexwexewxewxewxewxewxewxewxewxewxewxewxewxewxewxewxeewxewxewxewxewxewxwxewxewxewxewxewxewxewxewxewxewxewxewxewxewxwewxewxwexewxwxewxewxwewxewxwewxewxewxewxewxwxewxewxwewxewxewxewxewxewxewxwxwxwwxwxwxewxewxewxwexewxewxewxwxwxewxewxewxwww"
		expect(Link.new(slug: slug, url: @url)).to_not be_valid
	end

	it "should provid a shorted url when the short methd is called" do
		link = Link.create(slug: @slug, url: @url)
		expect(link.short.present?).to eq(true)
	end
end