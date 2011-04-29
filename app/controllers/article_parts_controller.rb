class ArticlePartsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @article_id = params[:article_id]
    @article_parts = ArticlePart.paginate( :conditions => { :article_id => @article_id, :user_id => session[:user_id] }, :page => params[:page], :per_page => 1, :order => "number ASC" )
  end

  #------#
  # show #
  #------#
  def show
    @article_part = ArticlePart.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )
  end

  #-----#
  # new #
  #-----#
  def new
    @article_id = params[:article_id]
    @article_part = ArticlePart.new
  end

  #------#
  # edit #
  #------#
  def edit
    @article_part = ArticlePart.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )
  end

  #--------#
  # create #
  #--------#
  def create
    @article_part = ArticlePart.new( params[:article_part] )
    @article_part.user_id = session[:user_id]
    @article_part.number = @article_part.get_next_number

    if @article_part.save
      redirect_to :action => "index", :article_id => @article_part.article_id and return
    else
      render :action => "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update
    @article_part = ArticlePart.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )

    if @article_part.update_attributes( params[:article_part] )
      redirect_to :action => "index", :article_id => @article_part.article_id, :page => params[:page] and return
    else
      render :action => "edit"
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @article_part = ArticlePart.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )

    redirect_to :action => "index" and return if @article_part.blank?

    unless @article_part.destroy
      flash[:notice] = "記事パートの削除に失敗しました。"
    end
    
    redirect_to :action => "index", :article_id => @article_part.article_id, :page => 1 and return
  end

end
