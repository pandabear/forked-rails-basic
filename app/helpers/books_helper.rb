module BooksHelper
  
  def query_by_radio_tag(field)
    checked = params[:by].blank? ? field.to_s == 'title' : params[:by] == field.to_s
    output = ""
    output << (radio_button_tag :by, field, checked)
    output << field.to_s.titleize
    content_tag(:span, raw(output))
  end
  
  def up_vote_path(book)
    return book_ratings_path(book, rating: {rating: 1})    
  end
  
  def down_vote_path(book)
    return book_ratings_path(book, rating: {rating: -1})
  end
  
end
