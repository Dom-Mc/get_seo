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


    puts "Please choose from the following options:",
     "-Display the 'Title' (Enter 1)",
     "-Display the 'Description' (Enter 2)",
     "-List the 'Keywords' (Enter 3)",
     "-List the 'h1 Headings' (Enter 4)",
     "-List the 'h2 Headings' (Enter 5)",
     "-List the 'h3 Headings' (Enter 6)",
     "-List the 'Alt Attributes' (Enter 7)",
     "-List all SEO information from the page (Enter 8)",
     "-Inspect a new page (Enter 9)",
     "-Exit the program (Enter 'exit')"

  end

  def welcome_message
    puts "Welcome to SEO. Ok enough chitchat, let's get to work!"
  end

  def goodbye_message
    puts "Great SEO work! Job well done."
  end

end
