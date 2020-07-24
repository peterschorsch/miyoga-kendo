class ResourcesController < ApplicationController
	before_action :set_page

	def index
		@all_resources_content = @page.contents
		@resources = @all_resources_content.only_logos
		@resource_count = @resources.count+1

		@articles = @all_resources_content.only_articles
		@article_count = @articles.count+1
	end

	private
	def set_page
		@page = Page.named("Resources")
	end
end