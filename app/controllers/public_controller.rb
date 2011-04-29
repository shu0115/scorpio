class PublicController < ApplicationController
  
  skip_filter :authorize

  #-------#
  # index #
  #-------#
  def index
    @articles = Article.paginate( :conditions => { :mode => "public" }, :page => params[:page], :per_page => $per_page, :order => "created_at DESC" )
  end

  #------#
  # part #
  #------#
  def part
    @article_id = params[:article_id]
    @article_parts = ArticlePart.paginate( :conditions => { :article_id => @article_id, :user_id => session[:user_id] }, :page => params[:page], :per_page => 1, :order => "number ASC" )
  end

end
