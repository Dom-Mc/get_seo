#CLI Controller
class GetSeo::CLI

  attr_accessor :protocal, :start_of_program

  def initialize
    self.start_of_program = true
  end

  def run
    welcome_message if start_of_program
    check_requested_protocal
    seo_options
    goodbye_message
  end

  def check_requested_protocal
    loop do
      puts "\nWhat does the webpage you would like to inspect use 'http' or 'https'?",
      "-To select 'http' (Enter 1)",
      "-To select 'https' (Enter 2)"

      requested_protocal = gets.strip.downcase

      if requested_protocal == '1' || requested_protocal == 'http'
        self.protocal = 'http://'
        break
      elsif requested_protocal == '2' || requested_protocal == 'https'
        self.protocal = 'https://'
        break
      else
        puts "\t*Sorry but '#{requested_protocal}' is not a valid option.*"
      end
    end

    protocal
  end

  def seo_options
    puts "\nTo inspect a page's SEO information, please enter that page's domain (i.e. example.com):"

    print protocal # 'http://' or 'https://'
    requested_url = gets.strip.downcase

    #ensure website can be accessed
    begin

      #prvent program from running welcome_message
      self.start_of_program = false

      seo_data = GetSeo::Seo.setup(protocal + requested_url)
    rescue
      puts "\n\t*There seems to be an issue with the domain you entered.*",
      "\t*Please check the website addresss and try again.*"

      self.run
    else
      loop do
        puts "\n\nPlease choose from the following options:",
        "-Display the 'Title' (Enter 1)",
        "-Display the 'Description' (Enter 2)",
        "-List the 'Keywords' (Enter 3)",
        "-List the 'h1 Headings' (Enter 4)",
        "-List the 'h2 Headings' (Enter 5)",
        "-List the 'h3 Headings' (Enter 6)",
        "-List the 'Alt Attributes' (Enter 7)",
        "-Inspect a new page (Enter 8)",
        "-Exit the program (Enter 'exit')"

        user_selection = gets.strip.downcase

        case user_selection
        when '1'
          puts seo_data.title
        when '2'
          puts seo_data.description
        when '3'
          puts seo_data.keywords
        when '4'
          puts seo_data.heading1
        when '5'
          puts seo_data.heading2
        when '6'
          puts seo_data.heading3
        when '7'
          puts seo_data.alt_attribute
        when '8'
          self.run
        when 'exit'
          # NOTE: not sure about
          # goodbye_message
          break
        else
          puts "Sorry but #{user_selection} is invalid, please select another option.\n"
        end
      end

    end
  end

  def welcome_message
    puts "Welcome to SEO. Ok enough chitchat, let's get to work!"
  end

  def goodbye_message
    puts "Great SEO work! Job well done."
  end

end
