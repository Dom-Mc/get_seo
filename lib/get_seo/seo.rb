class GetSeo::Seo

  attr_accessor :heading1, :heading2, :heading3, :keywords, :title, :description, :img_alt_attribute
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
    #TODO change to reject!

    # NOTE: returns array of values || []
    seo.title = []
    if html.at("title").text
      seo.title << html.at("title").text.strip
      seo.title.reject!(&:empty?)
    end

    # seo.title = html.search("title").text.empty? ? [] : html.at("title").text

    # NOTE: returns array of values || []
    if html.at("meta[name='description']") && html.at("meta[name='description']")['content']
      seo.description = html.at("meta[name='description']")['content'].strip.gsub(/\s+/, " ")
    else
      seo.description = []
    end

    # NOTE: returns array of values || []
    # TODO: change variable name, add .split
    seo.keywords = html.search("meta[name='keywords']").map do |n|
      n['content'].strip
    end

    seo.description = []
    if html.at("meta[name='description']")
      seo.description << html.at("meta[name='description']")['content']
      seo.description.reject(&:empty?)
    end

    # NOTE: returns array of values || []
    if html.at('img') && html.at('img')['alt']
      seo.img_alt_attribute = html.css('img').map do |img|
          img['alt'] unless img['alt'].nil? || img['alt'].empty?#&.strip
      end.compact
    end

    #return our seo object
    seo
  end

end
