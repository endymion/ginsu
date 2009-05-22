namespace :ginsu do
  desc "Update Rails application from static web site source."
  task :slice => :environment do
    Ginsu::Knife.link
    Ginsu::Knife.slice
  end
end
