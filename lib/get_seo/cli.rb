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
      puts "\nCheck the webpage you would like to inspect and find out if it uses 'http' or 'https'?",
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
        section_break
        puts "\n\t*Sorry but '#{requested_protocal}' is not a valid option.*"
        section_break
      end
    end

    protocal
  end

  def seo_options
    puts "\nIn order to retrieve SEO information, please enter the domain of the webpage you would like to inspect (i.e. example.com):"

    print protocal # 'http://' or 'https://'
    requested_url = gets.strip.downcase

    # ensure website can be accessed
    begin

      # prvent program from running welcome_message
      self.start_of_program = false

      @seo_data = GetSeo::Seo.setup(protocal + requested_url)
    rescue
      section_break
      puts "\n\t*There seems to be an issue with the domain you entered.*",
      "\t*Please double check the url and try again.*"
      section_break

      self.run
    else
      list_of_options
    end

  end

  private

    def list_of_options
      loop do
        puts "\n\nPlease choose from the following options:",
        "-Display the 'Title' (Enter 1)",
        "-Display the 'Description' (Enter 2)",
        "-List the 'Keywords' (Enter 3)",
        "-List the 'h1 Headings' (Enter 4)",
        "-List the 'h2 Headings' (Enter 5)",
        "-List the 'h3 Headings' (Enter 6)",
        "-List the 'Alt Attributes' (Enter 7)", #TODO change to image alt attr
        "-Inspect a new page (Enter 8)",
        "-Exit the program (Enter 'exit')"

        user_selection = gets.strip.downcase
        value = []
        case user_selection
        when '1' #Titles
          print_seo_data(@seo_data.title, "Titles")
        when '2' #Descriptions
          print_seo_data(@seo_data.description, "Descriptions")
        when '3' #Keywords
          print_seo_data(@seo_data.keywords, "Keywords")
        when '4' #h1 Headings
          print_seo_data(@seo_data.heading1, "h1 Headings")
        when '5' #h2 Headings
          print_seo_data(@seo_data.heading2, "h2 Headings")
        when '6'
          print_seo_data(@seo_data.heading3, "h3 Headings")
        when '7'
          print_seo_data(@seo_data.alt_attribute, "Alt Attributes")
        when '8'
          self.run
        when 'exit'
          break
        else
          section_break
          puts "\n\t*Sorry but #{user_selection} is invalid, please select another option.*"
          section_break
        end
      end

    end

    def welcome_message
      puts "Welcome to SEO. Ok enough chitchat, let's get to work!"
    end

    def goodbye_message
      puts "Great SEO work! Job well done."
    end

    def print_seo_data(data_attr, name)
      if data_attr.empty?
        puts "It looks like this page doesn't have any #{name}."
      else
        data_attr.each do |value|
          puts value
        end
      end
    end

    def section_break
      print_new_line
      70.times { print '*' }
    end

    def print_new_line
      puts "\n"
    end

end
