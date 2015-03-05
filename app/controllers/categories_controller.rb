class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :delete]

  def index
    if params[:search]
      search_param = CGI::escapeHTML(params[:search])
      redirect_to("/articles?search=#{search_param}&commit=Search")
      return
    end
    @categories = Category.all
    #@subcats = Category.all.collect{|x| x.category_id.present? }
  end

  def show
    if params[:search]
      search_param = CGI::escapeHTML(params[:search])
      redirect_to("/articles?search=#{search_param}&commit=Search")
      return
    end
    @category = Category.find(params[:id])
    @categories = Category.all
    @articles = Article.all
    @comments = Comment.all
    @comment = Comment.new
  end

  def new
    @category = Category.new
    if params[:search]
      search_param = CGI::escapeHTML(params[:search])
      redirect_to("/articles?search=#{search_param}&commit=Search")
      return
    end
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "New Category Successfully Created!"
      redirect_to(categories_path)
    else
      render('new')
    end
  end

  def edit
    @category = Category.find(params[:id])
    if params[:search]
      search_param = CGI::escapeHTML(params[:search])
      redirect_to("/articles?search=#{search_param}&commit=Search")
      return
    end
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Category was successfully updated!"
      redirect_to(:action=>'show', :id=>@category.id)
    else
      render('edit')
    end
  end

  def delete
  if params[:search]
    search_param = CGI::escapeHTML(params[:search])
    redirect_to("/articles?search=#{search_param}&commit=Search")
    return
  end
    @category = Category.find(params[:id])
  end

  def destroy
    category = Category.find(params[:id]).destroy
    flash[:notice] = "The category has been destroyed"
    redirect_to(:action=>'index')
  end

  private

  def category_params
    params.require(:category).permit(:title, :description, :parent_id)
  end

end
