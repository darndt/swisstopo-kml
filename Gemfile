source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.7.8'

gem "sinatra", ">= 2.2.3"

gem 'rake', '13.0.6'
# this and the empty Rakefile needed somehow for Hatchbox deployment...

gem "rackup", "~> 2.1"
