module RatingsHelper
  def star_rating_radio_tag(f, field, value)
    output = ""
    (1..10).each do |i|
      output << f.radio_button(field, i, {checked: value.round == i, class: "star {split:2} required auto-submit-star"}) + "\n"
    end
    raw(output)
  end
end