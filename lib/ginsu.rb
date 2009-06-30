module Ginsu; end

require('rubygems')

require('hpricot')

def require_local(suffix)
  require(File.expand_path(File.join(File.dirname(__FILE__), suffix)))
end

require_local('this_method')
require_local('ginsu/knife')
require_local('ginsu/config')
