class ArticlesController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @articles = Article.paginate( :conditions => { :user_id => session[:user_id] }, :page => params[:page], :per_page => $per_page, :order => "created_at DESC" )
  end

  #------#
  # show #
  #------#
  def show
    @article = Article.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )
  end

  #-----#
  # new #
  #-----#
  def new
    @article = Article.new
  end

  #------#
  # edit #
  #------#
  def edit
    @article = Article.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )
  end

  #--------#
  # create #
  #--------#
  def create
    @article = Article.new( params[:article] )
    @article.user_id = session[:user_id]

    if @article.save
      redirect_to :action => "index" and return
    else
      render :action => "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update
    @article = Article.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )

    if @article.update_attributes( params[:article] )
      redirect_to :action => "index", :page => params[:page] and return
    else
      render :action => "edit"
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @article = Article.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )

    redirect_to :action => "index" and return if @article.blank?

    unless @article.destroy
      flash[:notice] = "記事の削除に失敗しました。"
    end
    
    redirect_to :action => "index", :page => params[:page] and return
  end

end
