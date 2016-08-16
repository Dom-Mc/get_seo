class GetSeo::Seo

  attr_accessor :heading1, :heading2, :heading3, :keywords, :title, :description, :alt_attribute
  # NOTE: possibly add a 'url' attr_accessor later
  # NOTE: create a method for iterating and printing attributes

  def self.setup(url)
    # NOTE: setup Nokogiri object for scrape
    #url = "https://flatironschool.com" # TODO: Remove later
    html = Nokogiri::HTML(open(url))

    # NOTE: instatiate a new seo object
    seo = self.new

    # NOTE: returns array of values || []
    seo.heading1 = html.search("h1").map do |h1|
      h1.text.strip.gsub(/\s+/, " ")
    end.reject(&:empty?)

    # NOTE: returns array of values || []
    seo.heading2 = html.search("h2").map do |h2|
      h2.text.strip.gsub(/\s+/, " ")
    end.reject(&:empty?)

    # NOTE: returns array of values || []
    seo.heading3 = html.search("h3").map do |h3|
      h3.text.strip.gsub(/\s+/, " ")
    end.reject(&:empty?)

    # NOTE: returns array of values || []
    if html.at("meta[name='description']") && html.at("meta[name='description']")['content']
      seo.description = html.at("meta[name='description']")['content'].strip.gsub(/\s+/, " ")
    else
      seo.description = []
    end

    # NOTE: returns array of values || []
    # NOTE: possibly call join(', ') on keywords
    if html.at("meta[name='keywords']") && html.at("meta[name='keywords']")['content']
      seo.keywords = html.at("meta[name='keywords']")['content'].strip.gsub(/\s+/, " ")
    else
      seo.keywords = []
    end

# binding.pry
    #return our seo object
    seo
  end

end
