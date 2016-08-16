#CLI Controller
class GetSeo::CLI

  def run
    welcome_message
    seo_options
    goodbye_message
  end

  def seo_options
    puts "\nTo inspect a page's SEO information, please enter that page's domain (i.e. example.com):"

    user_input = gets.strip.downcase

    # TODO: replace later
    requested_url = "http://#{user_input}"
    puts "You selected the following website #{requested_url}"

    seo_data = GetSeo::Seo.setup(requested_url)
    binding.pry
  end

  def welcome_message
    puts "Welcome to SEO. Ok enough chitchat, let's get to work!"
  end

  def goodbye_message
    puts "Great SEO work! Job well done."
  end

end
