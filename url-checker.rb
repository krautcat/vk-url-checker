#! /usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'


if __FILE__==$0
    require_relative 'vk-url-checker/parser'
    # this will only run if the script was the main, not load'd or require'd
    cli_parser = CliParser.parse(ARGV)

    # DATA_DIR = ENV["HOME"] + ".config/"
    # Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)

    BASE_VK_URL = "http://vk.com"
    LIST_URL = BASE_VK_URL + "/" + cli_parser.options.addr

    HEADERS_HASH = {"User-Agent" => "Ruby/#{RUBY_VERSION}"}

    page = Nokogiri::HTML(open(LIST_URL))

    puts page
end
