class ProtectController < ApplicationController

  skip_filter :authorize, :only => [ :item_list, :show_key ]

  #-------#
  # index #
  #-------#
  def index
    @articles = Article.paginate( :conditions => { :user_id => session[:user_id], :mode => "protect" }, :page => params[:page], :per_page => $per_page, :order => "created_at DESC" )
  end

  #------#
  # part #
  #------#
  def part
    article = Article.first( :conditions => { :id => params[:article_id], :mode => "protect" } )

    redirect_to :action => "index" and return if article.blank?

    # 閲覧キーチェック
    if !article.show_key.blank? and session["show_key_#{article.id}"] != "OK"
    #if true
      redirect_to :action => "show_key", :id => article.id and return        
    end
    
    @article_id = params[:article_id]
    @article_parts = ArticlePart.paginate( :conditions => { :article_id => @article_id, :user_id => session[:user_id] }, :page => params[:page], :per_page => 1, :order => "number ASC" )
  end
  
  #----------#
  # show_key #
  #----------#
  def show_key
    # 記事情報取得
    @article = Article.find_by_args( :id => params[:id], :mode => "protect" )

    # 閲覧キー照合
    if @article.show_key == params[:show_key]
      session["show_key_#{@article.id}"] = "OK"
      redirect_to :action => "part", :article_id => @article.id and return
    else
      unless params[:show_key].blank?
       flash[:show_key_notice] = "閲覧キーが正しくありません。<br /><br />"
      end
    end
  end

end
