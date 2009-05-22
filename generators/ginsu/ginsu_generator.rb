class GinsuGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.template 'config/initializers/ginsu.rb'
    end
  end
end
