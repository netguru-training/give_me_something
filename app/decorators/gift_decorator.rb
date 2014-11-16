class GiftDecorator < Draper::Decorator
  delegate_all

  def css_available_class
    if buyer_id.present?
      return "success"
    else
      return "warning"
    end
  end

  def allegro_url
    "http://allegro.pl/listing/listing.php?string=#{ name_escaped }"
  end

  def ebay_url
    "http://www.ebay.com/sch/i.html?&_nkw=#{ name_escaped }"
  end

  def amazon_url
    "http://www.amazon.com/s/ref=nb_sb_noss?&field-keywords=#{ name_escaped }"
  end

  def google_url
    "https://www.google.pl/#q=#{ name_escaped }+shop"
  end

  def name_escaped
    CGI.escape name.downcase
  end

  def short_description
    if description.size < 50
      description
    else
      "#{description.truncate(49)}"
    end
  end
  
end
