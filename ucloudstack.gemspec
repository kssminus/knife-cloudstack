Gem::Specification.new do |s|
  s.name = %q{ucloudstack}
  s.version = "0.0.3"
  s.date = %q{2012-09-21}
  s.authors = ['Ryan Holmes', 'KC Braunschweig', 'John E. Vincent', 'SeongSik. Kim']
  s.email = ['rholmes@edmunds.com', 'kcbraunschweig@gmail.com', 'lusis.org+github.com@gmail.com', 'kssminus@gmail.com']
  s.summary = %q{A knife plugin for the ucloud API}
  s.homepage = %q{http://cloudstack.org/}
  s.description = %q{A Knife plugin to create, list and manage ucloud servers}

  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc", "CHANGES.rdoc", "LICENSE" ]

  s.add_dependency "chef", ">= 0.10.0"
  s.require_path = 'lib'
  s.files = ["CHANGES.rdoc","README.rdoc", "LICENSE"] + Dir.glob("lib/**/*")
end
