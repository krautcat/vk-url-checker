require 'nokogiri'
require 'open-uri'

module VKTools
    module UrlChecker
        STATUS = {
            :Avaliable      => 0,
            :Busy           => 1,
            :Coincidence    => 2
        }

        class Checker
            def initialize(base_title: "E:\\music\\", base_url: "https://vk.com")
                @base_url = base_url
                @base_title = base_title
            end

            def check(url, expect: nil)
                expected_title = expect.nil? ? @base_title : @base_title +
                    expect.downcase

                user_agent = "Mozilla/5.0 (compatible; vkShare; +vk.com/dev/Share)"

                begin
                    page = open(make_url(url), "User-Agnet" => user_agent)
                rescue OpenURI::HTTPError
                    return {
                        :status => STATUS[:Avaliable]
                    }
                end
                parsed_page = Nokogiri::HTML::Document.parse(page)

                if (parsed_page.title == expected_title) then
                    return {
                        :status => STATUS[:Coincidence]
                    }
                else
                    return {
                        :status => STATUS[:Busy],
                        :title => parsed_page.title
                    }
                end
            end

            def make_url(url_path)
                return @base_url + "/" + url_path
            end
        end
    end
end
