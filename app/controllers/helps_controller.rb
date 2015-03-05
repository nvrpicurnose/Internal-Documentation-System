class HelpsController < ApplicationController
 
  def info
  	if params[:search]
  		search_param = CGI::escapeHTML(params[:search])
  		redirect_to("/articles?search=#{search_param}&commit=Search")
  		return
  	end
  end
end
