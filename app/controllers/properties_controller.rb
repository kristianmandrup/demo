class PropertiesController < ApplicationController
	def new
		session[:user] = User.landlord!
		@name = params[:id]
		@mode = params[:mode] || 'edit_location'
		
		render layout: 'single_item'		
	end

	def show
		@name = params[:id]
		@mode = params[:mode] || 'gallery'
		@page = Page.new name: :property
		
		render layout: 'single_item'
	end

	def edit
		@name = params[:id]
		@mode = params[:mode] || 'edit_location'
		
		render layout: 'single_item'
	end

	def index
		@properties = Property.all
		@page = Page.list! :property_search

		render layout: 'list'
	end

	# fancybox ajax
	def edit_details
		@name = params[:id]
		
		render layout: 'fancybox'
	end
end