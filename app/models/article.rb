class Article < ActiveRecord::Base
  
  private
  #----------------#
  # self.get_title #
  #----------------#
  def self.get_title( article_id )
    article = self.find_by_args_select( { :id => article_id }, "title" )
    
    unless article.blank?
      return article.title
    else
      return ""
    end
  end

  #-------------------#
  # self.find_by_args #
  #-------------------#
  # 動的ファインダ代替用メソッド
  def self.find_by_args( args )
    self.first( :conditions => args )
  end

  #--------------------------#
  # self.find_by_args_select #
  #--------------------------#
  # 動的ファインダ代替用メソッド
  def self.find_by_args_select( args, select )
    self.first( :conditions => args, :select => select  )
  end

end
