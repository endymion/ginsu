module Ginsu
  class Knife

    def self.slice
      @@config.partials.each do |partial|
        
        puts "Each partial requires a :static parameter to specify the source file." if
          partial[:static].blank?
        puts "Each partial requires a :search parameter with a search string." if
          partial[:search].blank?
        puts "Each partial requires a :partial parameter with the name of the destination template." if
          partial[:partial].blank?

        # Open the static source HTML file.
        static_source_string = ''
        static_source_path = File.join(@@config.source, partial[:static])
        File.open(static_source_path, "r") { |f|
            static_source_string = f.read
        }
        static_source = Hpricot(static_source_string)

        # Use Hpricot to partial out the desired element's content.
        found = static_source.search(partial[:search]).first
        
        # Drop that found string into the appropriate partial.
        partial_filename = partial[:partial]
        partial_filename.gsub!(/\/([^\_][^\/]+$)/) {|string| '/_' + $1 }
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
        FileUtils.ln_s source, destination, :force => true unless File.exists? destination
        
      end
    end

  end
end