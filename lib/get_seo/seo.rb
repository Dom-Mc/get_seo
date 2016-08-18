class GetSeo::Seo

  attr_accessor :heading1, :heading2, :heading3, :keywords, :title, :description, :img_alt_attribute

  def self.setup(url)
    html = Nokogiri::HTML(open(url))
    seo = self.new

    seo.heading1 = html.search("h1").map do |h1|
      h1.text.strip.gsub(/\s+/, " ")
    end.reject(&:empty?)

    seo.heading2 = html.search("h2").map do |h2|
      h2.text.strip.gsub(/\s+/, " ")
    end.reject(&:empty?)

    seo.heading3 = html.search("h3").map do |h3|
      h3.text.strip.gsub(/\s+/, " ")
    end.reject(&:empty?)

    seo.title = []
    if title = html.at("title")&.text
      seo.title << title.strip unless title.empty?
    end

    seo.keywords = []
    if keywords = (html.at("meta[name='keywords']") &&
                   html.at("meta[name='keywords']")['content'])

      keywords.split(',').each do |keyword|
         stripped_word = keyword.strip
         seo.keywords << stripped_word unless stripped_word.empty?
      end
    end

    seo.description = []
    if description = (html.at("meta[name='description']") &&
                      html.at("meta[name='description']")['content'])

      seo.description << description unless description.empty?
    end

    seo.img_alt_attribute = html.search('img').map do |img|
        img['alt']&.strip
    end.compact.reject!(&:empty?)

    seo
  end

end
