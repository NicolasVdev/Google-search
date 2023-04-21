$Gemfile_content =
"source "https://rubygems.org"
ruby '3.0.0'
gem 'rubocop', '~> 0.57.2'
gem 'rspec'
gem 'pry'
gem 'dotenv'
gem 'http'
gem 'launchy'
gem 'json'"


def check_if_user_gave_input
  abort("mkdir: Merci d'écrire un nom de dossier !") if ARGV.empty?
end


def create_folder_with_files
  Dir.chdir("/home/maddev/THP/")
  name = ARGV.join("").tr("","_")
  Dir.mkdir(name)
  Dir.chdir("/home/maddev/THP/"+name)
  Dir.mkdir(lib)
  File.open(".env", "w" )
  File.open("Gemfile", "w") { |f| f.write($Gemfile_content) ; f.close}
  File.open(".gitignore", "w") { |f| f.write(".env") ; f.close}

  system("bundle install")
  system("rspec --init")
end


check_if_user_gave_input
create_folder_with_files