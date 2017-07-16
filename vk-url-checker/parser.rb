require 'optparse'
require 'pp'

class CliParser

    @allowed_opt = {
        :addr => ["-a", "--address"],
        :expect => ["-e", "--expect"]
    }

    Options = Struct.new(*@allowed_opt.keys)

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
        pp options
        begin
            option_parser.parse!(args)
        rescue OptionParser::MissingArgument => mis_arg_e
            missing_arg_exception(mis_arg_e)
        rescue OptionParser::InvalidOption => inv_opt_e
            inv_opt_exception(inv_opt_e)
        end
        @options
    end

    def self.option_parser
        @parser ||= OptionParser.new do |parser|
            parser.banner = "Usage: url-checker.rb [options]"
            parser.separator "\t"
            parser.separator "Specific options:"
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
        # add additional options
        address_option
        expectation_title_option

        @parser
    end

    def self.address_option
        parser.on(:REQUIRED, @allowed_opt[:addr][0],
            @allowed_opt[:addr][1] + " ADDR", String, "Address vk") do |addr|
            options.addr = addr
        end
    end

    def self.expectation_title_option
        parser.on(:OPTIONAL, @allowed_opt[:expect][0],@allowed_opt[:addr][1] +
            " TITLE", String, "Expected title") do |addr|
            options.addr = addr
        end
    end

    def self.missing_arg_exception(expt)
        case arg = /\w: (?<arg>.*)/.match(expt.message)[:arg]
        when *@allowed_opt[:addr]
            $stderr.print "Missing argument: #{arg} <url>\n"
            exit 1
        end
    end

    def self.inv_opt_exception(expt)
        $stderr.print expt.message + "\n"
        exit 1
    end

end
