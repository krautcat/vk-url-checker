Gem::Specification.new do |spec|
    spec.name           = 'vk-url-checker'
    spec.version        = '0.0.0.alpha'
    spec.licenses       = ['MIT']

    spec.date           = '2017-07-18'
    spec.summary        = "Checker of short URLs for VK"
    spec.description    = <<-EOF
        vk-url-checker is a gem checking avaliability of short URL
        from VK social network. Nowdays it can be used as standalone app
        but further it will can be used as gem for other apps. vk-url-checker
        is a part of a large set of tools and gems called vk-tools.
    EOF

    spec.authors        = ["Georgiy Odisharia"]
    spec.email          = "math.kraut.cat@gmail.com"
    spec.homepage       = 'http://rubygems.org/gems/vk-url-checker'

    spec.files          = Dir['lib/   *.rb'] + Dir['bin/*']
    spec.bindir         = 'bin'

    spec.add_runtime_dependency 'nokogiri', '~> 1.8', '>=1.8.0'
end
