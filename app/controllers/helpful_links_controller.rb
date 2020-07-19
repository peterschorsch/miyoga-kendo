class HelpfulLinksController < ApplicationController
	before_action :set_page

  def index
	@all_resources_content = Content.of_page(@current_page)
    @resources = @all_resources_content.only_logos
    @articles = @all_resources_content.only_articles
  end

  def set_page
    @current_page = Page.named("Resources")
  end
end