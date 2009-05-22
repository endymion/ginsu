module Ginsu; end

require('rubygems')

require('nokogiri')

def require_local(suffix)
  require(File.expand_path(File.join(File.dirname(__FILE__), suffix)))
end

require_local('ginsu/knife')
require_local('ginsu/config')
