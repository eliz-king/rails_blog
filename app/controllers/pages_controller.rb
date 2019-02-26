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

  def create
    @page = Page.new(pages_params)

    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(pages_params)
      redirect_to pages_path
    else
      render :edit
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  private
    def pages_params
      params.require(:page).permit(:title, :author, :body)
    end
end
