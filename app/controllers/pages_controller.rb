class PagesController < ApplicationController
  def index
    @pages = Page.all # sql SELECT * FROM Page
    # redirect to views method name
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    # Page.create   # in database
    @page = Page.new # in memory
  end
end
