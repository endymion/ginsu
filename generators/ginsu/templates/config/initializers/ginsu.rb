require 'ginsu'
Ginsu::Knife.configure do |ginsu|

	# The default location of the static web site is 'site', but maybe your static
	# site includes 150 MB worth of Photoshop .psd files and you don't want those
	# in your Capistrano deployments.  Change the source path here if you want.
  # ginsu.source = '/home/webproject/site'

  # ginsu.partials << { :search => '#header', :static => 'index.html', :partial => 'header' }
  # ginsu.partials << { :search => '#footer', :static => 'index.html', :partial => 'footer' }

  # ginsu.links << { :static => 'galleries' }
  # ginsu.links << { :static => 'news' }

end