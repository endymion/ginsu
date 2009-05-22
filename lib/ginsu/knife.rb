require 'nokogiri'

module Ginsu
  class Knife

    def self.slice
      @@config.slices.each do |slice|
        
        puts "Each slice requires a :static parameter to specify the source file." if
          slice[:static].blank?
        puts "Each slice requires either a :search, :css or :xpath parameter with a search string." if
          slice[:css].blank? and slice[:xpath].blank? and slice[:search].blank?
        puts "Each slice requires a :partial parameter with the name of the destination template." if
          slice[:partial].blank?

        # Open the static source HTML file.
        static_source_string = ''
        static_source_path = File.join(@@config.source, slice[:static])
        File.open(static_source_path, "r") { |f|
            static_source_string = f.read
        }
        static_source = Nokogiri::HTML(static_source_string)

        # Use Nokogiri to slice out the desired element's content.
        found = ''
        if slice[:css]
          found = static_source.css(slice[:css]).first
        elsif slice[:xpath]
          found = static_source.css(slice[:xpath]).first
        else
          found = static_source.search(slice[:search]).first
        end
        
        # Drop that found string into the appropriate partial.
        partial_filename = slice[:partial]
        partial_filename = '_' + partial_filename unless partial_filename =~ /^[^\_]/
        partial_filename += '.html.erb' unless partial_filename =~ /\./
        partial_filename = File.join('app/views/', partial_filename)
        puts "Sliced partial '#{partial_filename}' from static '#{static_source_path}'."
        File.open(partial_filename, 'w') {|f| f.write(found) }
        
      end
    end
  
    def self.link
      @@config.links.each do |link|
        
        puts "Each link requires a :static parameter with the name of the static resource" +
             "    to link to the public/ directory in your Rails application." if
             link[:static].blank?
        
        source = File.join(FileUtils.pwd, @@config.source, link[:static])
        destination = File.join('public', link[:static])
        
        puts "Linking '#{source}' to '#{destination}'."
        FileUtils.ln_s source, destination, :force => true
        
      end
    end
  
  end
end