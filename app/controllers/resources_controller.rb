class ResourcesController < ApplicationController
	before_action :set_page

	def index
		@all_resources_content = @page.contents.includes(:links)
		@resources = @all_resources_content.display_non_articles

		@articles = @all_resources_content.display_articles
	end

	private
	def set_page
		@page = Page.named("Resources")
	end
end