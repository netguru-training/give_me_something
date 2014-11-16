class SearchSiteUrlGenerator < Struct.new(:search_engine, :text)
  def to_s
    search_engine_url + normalized_query
  end

  private

  def normalized_query
    CGI.escape text.downcase
  end

  def search_engine_url
    case search_engine
    when :allegro then "http://allegro.pl/listing/listing.php?string="
    when :ebay then  'http://www.ebay.com/sch/i.html?&_nkw='
    when :amazon then "http://www.amazon.com/s/ref=nb_sb_noss?&field-keywords="
    else "https://www.google.pl/#q="
    end
  end
end

