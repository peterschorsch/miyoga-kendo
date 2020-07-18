class EventsController < ApplicationController
  before_action :set_page

  def index
    @events = Event.order_by_recent.includes(:address).first(3)
  end

  def set_page
    @current_page = Page.named("Events")
  end
end