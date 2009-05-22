require 'ginsu'
Ginsu::Knife.configure do |configure|

	# The default location of the static web site is 'site', but maybe your static
	# site includes 150 MB worth of Photoshop .psd files and you don't want those
	# in your Capistrano deployments.  Change the source path here if you want.
  # config.source = '/home/webproject/site'

  # config.slices << { :search => '#header', :static => 'index.html', :partial => 'header' }
  # config.slices << { :search => '#footer', :static => 'index.html', :partial => 'footer' }

  # config.links << { :static => 'galleries' }
  # config.links << { :static => 'news' }

end