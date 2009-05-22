class GinsuGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.template 'config/initializers/ginsu.rb', 'config/initializers/ginsu.rb'
    end
  end
end
