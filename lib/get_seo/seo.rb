class GetSeo::Seo
  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def self.setup(url)
    html = Nokogiri::HTML(open(url))
    binding.pry
  end

end
