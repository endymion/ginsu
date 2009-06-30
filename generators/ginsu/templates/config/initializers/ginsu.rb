require 'ginsu'
Ginsu::Knife.configure do |ginsu|

	# The default location of the static web site is the 'static' folder in your Rails app,
	# but maybe your static site includes 150 MB worth of Photoshop .psd files and you don't
	# want those in your Capistrano deployments.  Change the source path here if you want.
  # ginsu.source = '/home/webproject/site'

  # ginsu.partials << { :static => 'index.html', :partial => 'header', :search => '#header' }
  # ginsu.partials << { :static => 'index.html', :partial => 'footer', :search => '#footer' }

  # ginsu.templates << { :static => 'Templates/master.dwt', :template => 'master' }

  # ginsu.links << { :static => 'galleries' }
  # ginsu.links << { :static => 'news' }

end