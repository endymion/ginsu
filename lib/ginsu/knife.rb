class Ginsu::Knife

  def initialize(params = {})
    params.each do |key,val|
      self.send("#{key}=", val) if self.respond_to? key
    end
    self.send(:init) if self.respond_to? :init
  end
  
  def current_status
    @@config.status
  end
  
end
