# config.rb contains classes, methods and extends existing Ginsu classes 
# to provide easy configuration facilities.

module Ginsu
  # Represents global configuration for Ginsu::Knife.
  # Can override the following configuration options:
  # * <tt>source</tt> - the source directory of the static web site.  Defaults to 'static'.
  class Config
    @@ATTRIBUTES = [
      :source,
      :partials,
      :pages,
      :templates,
      :links
    ]
    attr_accessor *@@ATTRIBUTES

    def initialize(params = {})
      params.each do |key,val|
        self.send("#{key}=", val) if self.respond_to? key
      end
      self.send(:init) if self.respond_to? :init
    end
    
  end

  class Knife
    @@defaults = { 
      :source => 'static',
      :partials => [],
      :pages => [],
      :templates => [],
      :links => []
    }
    @@config = Ginsu::Config.new(@@defaults)

    class << self
      # Yields to given <tt>block</tt> to configure the Ginsu.
      def configure(&block)
        raise ArgumentError, "Block must be provided to configure" unless block_given?
        yield @@config
      end
    end
  end
end