require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "chord_diagrams"
require "standard/rake"

RSpec::Core::RakeTask.new(:spec)

task default: [:spec, :standard]

desc "Generate all diagrams"
task sheets: %i[guitar ukulele]

desc "Generate guitar diagrams"
task :guitar do
  html = ""

  ChordDiagrams::GUITAR_FINGERINGS.keys.each do |name|
    html << ChordDiagrams.guitar_svg(name)
  end

  File.write("guitar.html", html)
end

desc "Generate ukulele diagrams"
task :ukulele do
  html = ""

  ChordDiagrams::UKULELE_FINGERINGS.keys.each do |name|
    html << ChordDiagrams.ukulele_svg(name)
  end

  File.write("ukulele.html", html)
end
