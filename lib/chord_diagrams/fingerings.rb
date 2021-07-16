require "csv"

module ChordDiagrams
  guitar_fingerings = {}
  ukulele_fingerings = {}

  fingerings_file = File.join(__dir__, "fingerings.csv")

  CSV.foreach(fingerings_file, headers: true) do |row|
    guitar_fingerings[row[0]] = row[1] unless row[1].nil?
    ukulele_fingerings[row[0]] = row[2] unless row[2].nil?
  end

  GUITAR_FINGERINGS = guitar_fingerings.freeze
  UKULELE_FINGERINGS = ukulele_fingerings.freeze
end
