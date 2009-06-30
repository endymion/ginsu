module Ginsu
  class Knife

    def self.slice
      self.partials
      self.pages
      self.templates
      self.links
    end

    def self.pages parameters=nil
      files = (parameters and parameters[:partials]) ? @@config.partials : @@config.pages
      files.each do |file|

        # These should probably raise errors.
        puts "Error: Each file requires a :static parameter to specify the source file." if
          file[:static].blank?
        puts "Error: Each file requires a :search parameter with a search string." if
          file[:search].blank?
        puts "Error: Each file requires a :partial parameter with the name of the destination template." if
          file[:partial].blank?

        # Open the static source HTML file.
        static_source_string = ''
        static_source_path = File.join(@@config.source, file[:static])
        File.open(static_source_path, "r") { |f|
          static_source_string = ''
          # Run a proc on each line?
          if file[:do]
            f.each {|line| static_source_string << file[:do].call(line)}
          else
            static_source_string = f.read
          end
        }
        static_source = Hpricot(static_source_string)

        if parameters and parameters[:partial]
          # Use Hpricot to partial out the desired element's content.
          found = static_source.search(file[:search]).first
        else
          found = static_source
        end

        # Drop that found string into the appropriate partial.
        target_filename = file[:partial]
        puts "Slicing '#{target_filename}' from '#{static_source_path}'..."
        target_filename.gsub!(/\/([^\_][^\/]+$)/) {|string| '/_' + $1 } if
          parameters and parameters[:partials]
        target_filename += '.html.erb' unless target_filename =~ /\./
        target_filename = File.join('app/views/', target_filename)
        File.open(target_filename, 'w') do |f|
          f.write(found)
        end
        
      end
    end

    def self.partials
      self.pages :partials => true
    end
     
    def self.templates
      @@config.templates.each do |template|
        
        puts "Slicing partial '#{partial_filename}' from static '#{static_source_path}'..."
      
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
        File.open(partial_filename, 'w') {|f| f.write(found) }
        
      end
    end
  
    def self.links
      @@config.links.each do |link|

        source = File.join(FileUtils.pwd, @@config.source, link[:static])
        destination = File.join('public', link[:static])

        puts "Linking '#{source}' to '#{destination}'..."

        puts "Each link requires a :static parameter with the name of the static resource" +
             "    to link to the public/ directory in your Rails application." if
             link[:static].blank?

        FileUtils.ln_s source, destination, :force => true unless File.exists? destination
        
      end
    end

  end
end