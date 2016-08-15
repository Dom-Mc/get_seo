class GetSeo::Seo

  def self.setup(url)
    html = Nokogiri::HTML(open(url))

    header1 = html.search('h1').map do |h1|
      h1.text.strip
    end

    header2 = html.search('h1').map do |h2|
      h2.text.strip
    end

    header3 = html.search('h1').map do |h3|
      h3.text.strip
    end

    description = html.at('meta[name="description"]')['content'] unless html.at('meta[name="description"]').nil?

    keywords = html.at('meta[name="keywords"]')['content'] unless html.at('meta[name="keywords"]').nil?

    binding.pry
  end

end
