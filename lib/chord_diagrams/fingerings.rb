module ChordDiagrams
  guitar_fingerings = {}
  ukulele_fingerings = {}

  fingerings_file = File.join(__dir__, "fingerings.csv")

  File.readlines(fingerings_file).each do |line|
    chord, guitar, ukulele = line.chomp.split(",")
    guitar_fingerings[chord] = guitar unless guitar.nil?
    ukulele_fingerings[chord] = ukulele unless ukulele.nil?
  end

  GUITAR_FINGERINGS = guitar_fingerings.freeze
  UKULELE_FINGERINGS = ukulele_fingerings.freeze
end
