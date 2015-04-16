# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name              = "knife-bootstrap-resolver"
  s.version           = "0.1.1"
  s.platform          = Gem::Platform::RUBY
  s.has_rdoc          = false
  s.extra_rdoc_files  = ["LICENSE" ]
  s.authors           = ["Stephen Hoekstra"]
  s.email             = ["shoekstra@schubergphilis.com"]
  s.homepage          = "https://github.com/shoekstra/knife-bootstrap-resolver"
  s.summary           = %q{Chef knife plugin to configure the DNS resolver(s) on a node during bootstrap}
  s.description       = s.summary
  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.license           = 'Apache 2.0'
  s.add_dependency 'chef', '>= 11.0'
end
