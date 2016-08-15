class GetSeo::Seo

  attr_reader :heading1, :heading2, :heading3, :keyword, :title, :description, :alt_attribute
  # NOTE: possibly add a 'url' attr_accessor later


  def self.setup
    # NOTE: setup Nokogiri object for scrape
    url = "https://flatironschool.com" # TODO: Remove later
    html = Nokogiri::HTML(open(url))

    # NOTE: instatiate a new object
    @seo = self.new

    @heading1 = html.search('h1').map do |h1|
      h1.text.strip
    end

    @heading2 = html.search('h1').map do |h2|
      h2.text.strip
    end

    @heading3 = html.search('h1').map do |h3|
      h3.text.strip
    end

    @description = html.at('meta[name="description"]')['content'] unless html.at('meta[name="description"]').nil?

    @keywords = html.at('meta[name="keywords"]')['content'] unless html.at('meta[name="keywords"]').nil?

    # binding.pry
  end

end
