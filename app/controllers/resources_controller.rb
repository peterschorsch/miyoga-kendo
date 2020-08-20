class ResourcesController < ApplicationController
	before_action :set_page

	def index
		@all_resources_content = @current_page.contents.includes(:links)
		@resources = @all_resources_content.display_non_articles

		@articles = @all_resources_content.display_articles

		@new_resource = Content.new
		@new_resource.links.build
	end

	private
	def set_page
		@current_page = Page.named("Resources")
	end
end