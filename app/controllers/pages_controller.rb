class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(title: params[:page][:title],
                    author: params[:page][:author],
                    content: params[:page][:content],
                    public: params[:page][:public])
      redirect_to page_path(@page)
    else
      render :edit
    end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(title: params[:page][:title],
                     author: params[:page][:author],
                     content: params[:page][:content],
                     public: params[:page][:public])
    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end
end
