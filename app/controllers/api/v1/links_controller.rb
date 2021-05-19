module Api
	module V1
		class LinksController < Api::V1::BaseController
			#wasnt sure if you wanted to authenticate, I have done this in the past using JWT Authentication
			skip_before_action :verify_authenticity_token 

			def create
				link = Link.new(url: params[:url], slug: params[:slug])
				if link.save
					render json: "your shortened url is: #{link.short}", status: 200
				else
					render json: "your url was not processed, please try again", status: 500
				end
			end

			def destroy
				link = Link.find_by_slug(params[:id])
				if link.present?
					link_slug = link.slug
					if link.present?
						link.destroy
						render json: "#{link_slug} was destroyed", status: 200
					else
						render json: "#{link_slug} was not destroyed, there was an error", status: 500
					end
				else
					render json: "#{params[:id]} was not found", status: 500
				end
			end
		  
		end
	end
end