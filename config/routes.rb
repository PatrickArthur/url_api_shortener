Rails.application.routes.draw do
	default_url_options :host => "localhost:3000"
	get '/short_url/:slug', to: 'links#show', as: :short
	namespace :api, defaults: {format: :json} do
		namespace :v1 do
			resources :links, :only => [:create, :destroy]
		end
	end
end


