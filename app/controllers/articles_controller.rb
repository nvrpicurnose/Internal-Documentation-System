class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :delete]

  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
    @search = Article.search do 
      fulltext params[:search]
    end
    @articles = @search.results
    end
  end

  def indexall
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]) do
      paginate(:page=>params[:page]||1, :per_page=>12)
    end
    else
    @search = Article.search do 
      fulltext params[:search]
      paginate(:page=>params[:page]||1, :per_page=>12)
    end
    @articles = @search.results
    end
  end

  def show
    if params[:search]
      search_param = CGI::escapeHTML(params[:search])
      redirect_to("/articles?search=#{search_param}&commit=Search")
      return
    end
    @article = Article.find(params[:id])
    @categories = Category.all
    @source = @article.category_id
    @category = @article.category
    @comments = Comment.all
    @comment = Comment.new
  end

  def listindex
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
    @search = Article.search do 
      fulltext params[:search]
    end
    @articles = @search.results
    end
  end

  def new
    @article = Article.new
    if params[:search]
      search_param = CGI::escapeHTML(params[:search])
      redirect_to("/articles?search=#{search_param}&commit=Search")
      return
    end
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Documentation has been succesfully created!"
      redirect_to(:action=>'show', :id=>@article.id)
    else
      render('new')
    end
  end

  def edit
    @article = Article.find(params[:id])
    if params[:search]
      search_param = CGI::escapeHTML(params[:search])
      redirect_to("/articles?search=#{search_param}&commit=Search")
      return
    end
    @categories = Category.all
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:notice] = "Documentation was successfully updated!"
      redirect_to(:action=>'show', :id=>@article.id)
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
    @article = Article.find(params[:id])
  end

  def destroy
    article = Article.find(params[:id]).destroy
    flash[:notice] = "This documentation [#{article.title}] has been destroyed"
    redirect_to(:action=>'index')
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :category_id, :timing, :document, :template, :misc, :shortcut, :image, :team, :overview, :reference, :tag_list)
  end

end
