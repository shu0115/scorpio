class ArticlePart < ActiveRecord::Base

  #-----------------#
  # get_next_number #
  #-----------------#
  def get_next_number
    article_part = ArticlePart.find_by_args_select_order( { :article_id => self.article_id }, "number", "number DESC" )

    if !article_part.blank? and !article_part.number.blank?
      return article_part.number + 1
    else
      return 1
    end
  end

  private
  #--------------------------------#
  # self.find_by_args_select_order #
  #--------------------------------#
  # 動的ファインダ代替用メソッド
  def self.find_by_args_select_order( args, select, order )
    self.first( :conditions => args, :select => select, :order => order  )
  end

end
