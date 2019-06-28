require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :sheet do
  require 'chord_diagrams'

  html = ""

  ChordDiagrams::FINGERINGS.each do |name, fingering|
    diagram = ChordDiagrams.chord_svg(name, fingering)
    html << diagram
  end

  File.open('sheet.html', 'w') { |file| file.write(html) }
end