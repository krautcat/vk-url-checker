require 'optparse'

class CliParser

    Options = Struct.new(:addr)

    # class Options
    #     attr_accessor :addr
    #     def initialize
    #         self.addr = "e_music"
    #     end
    # end

    class << self
        attr_reader :parser, :options
    end

    def self.parse(args)
        @options = Options.new
        option_parser.parse!(args)
        @options
    end

    def self.option_parser
        @parser ||= OptionParser.new do |parser|
            parser.banner = "Usage: url-checker.rb [options]"
            parser.separator "\t"
            parser.separator "Specific options:"

            # add additional options
            address_option

            parser.separator "\t"
            parser.separator "Common options:"

            # No argument, shows at tail.  This will print an options summary.
            # Try it and see!
            parser.on_tail("-h", "--help", "Show this message") do
                puts parser
                exit
            end

            # Another typical switch to print the version.
            parser.on_tail("--version", "Show version") do
                puts "0.0.1"
                exit
            end

        end
    end

    def self.address_option
        @parser.on("-aADDR", "--address ADDR", String, "Address vk") do |addr|
            @options.address = addr
        end
    end

end
