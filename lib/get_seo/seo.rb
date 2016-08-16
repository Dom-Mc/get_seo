class GetSeo::Seo

  attr_accessor :heading1, :heading2, :heading3, :keywords, :title, :description, :alt_attribute
  # NOTE: possibly add a 'url' attr_accessor later
  # NOTE: create a method for iterating and printing attributes

  def self.setup#(url)
    # NOTE: setup Nokogiri object for scrape
    url = "https://flatironschool.com" # TODO: Remove later
    html = Nokogiri::HTML(open(url))

    # NOTE: instatiate a new seo object
    seo = self.new

    # NOTE: #returns array of values || []
    seo.heading1 = html.search("h1").map do |h1|
      h1.text.strip unless h1.text.strip.empty?
    end.compact

    # NOTE: #returns array of values || []
    seo.heading2 = html.search("h2").map do |h2|
      h2.text.strip unless h2.text.strip.empty?
    end.compact

    # NOTE: #returns array of values || []
    seo.heading3 = html.search("h3").map do |h3|
      h3.text.strip unless h3.text.strip.empty?
    end.compact

    # NOTE: #returns array of values || []
    if html.at("meta[name='description']").nil? || html.at("meta[name='description']")['content'].nil?
      seo.description = []
    else
      seo.description = html.at("meta[name='description']")&['content'].strip
    end

    # NOTE: #returns array of values || []
    if html.at("meta[name='keywords']").nil? || html.at("meta[name='keywords']")['content'].nil?
      seo.keywords = []
    else
      seo.keywords = html.at("meta[name='keywords']")&['content'].strip
    end

    binding.pry

    #return our seo object
    seo
  end

end
