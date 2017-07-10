require "pry"
require "rspec"
require "rspec/expectations"
require 'httparty'
require 'yaml'

CEP = YAML.load_file("features/config/cep.yml")