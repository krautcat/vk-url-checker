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

    BASE_VK_URL = "https://vk.com"
    LIST_URL = BASE_VK_URL + "/" + cli_parser.addr

    HEADERS_HASH = {"User-Agent" => "Mozilla/5.0 (compatible; vkShare; +vk.com/dev/Share)"}
    user_agent = "Mozilla/5.0 (compatible; vkShare; +vk.com/dev/Share)";

    begin
        page = open(LIST_URL, 'User-Agnet' => user_agent)
    rescue OpenURI::HTTPError
        $stderr.print "Short address is avaliable!\n"
        exit 0
    end
    parsed_page = Nokogiri::HTML::Document.parse(page)
    puts "Page title: #{parsed_page.title}"
end
