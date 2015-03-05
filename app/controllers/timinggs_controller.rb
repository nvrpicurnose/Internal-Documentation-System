class TiminggsController < ApplicationController

  def by_timing
  if params[:search]
    search_param = CGI::escapeHTML(params[:search])
    redirect_to("/articles?search=#{search_param}&commit=Search")
    return
  end
  end

  def daily
  if params[:search]
    search_param = CGI::escapeHTML(params[:search])
    redirect_to("/articles?search=#{search_param}&commit=Search")
    return
  end
  @articles = Article.all
  end

  def weekly
  if params[:search]
    search_param = CGI::escapeHTML(params[:search])
    redirect_to("/articles?search=#{search_param}&commit=Search")
    return
  end
  @articles = Article.all
  end

  def biweekly
  if params[:search]
    search_param = CGI::escapeHTML(params[:search])
    redirect_to("/articles?search=#{search_param}&commit=Search")
    return
  end
  @articles = Article.all
  end

  def monthly
  if params[:search]
    search_param = CGI::escapeHTML(params[:search])
    redirect_to("/articles?search=#{search_param}&commit=Search")
    return
  end
  @articles = Article.all
  end

  def quarterly
  if params[:search]
    search_param = CGI::escapeHTML(params[:search])
    redirect_to("/articles?search=#{search_param}&commit=Search")
    return
  end
  @articles = Article.all
  end

  def annually
  if params[:search]
    search_param = CGI::escapeHTML(params[:search])
    redirect_to("/articles?search=#{search_param}&commit=Search")
    return
  end
  @articles = Article.all
  end

  def onrequest
  if params[:search]
    search_param = CGI::escapeHTML(params[:search])
    redirect_to("/articles?search=#{search_param}&commit=Search")
    return
  end
  @articles = Article.all
  end

  def adhoc
  if params[:search]
    search_param = CGI::escapeHTML(params[:search])
    redirect_to("/articles?search=#{search_param}&commit=Search")
    return
  end
  @articles = Article.all
  end

end
