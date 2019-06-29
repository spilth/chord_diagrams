require 'csv'

module ChordDiagrams
  guitar_fingerings = {}
  ukulele_fingerings = {}

  CSV.foreach('lib/chord_diagrams/fingerings.csv', headers: true) do |row|
    guitar_fingerings[row[0]] = row[1] unless row[1].nil?
    ukulele_fingerings[row[0]] = row[2] unless row[2].nil?
  end

  GUITAR_FINGERINGS = guitar_fingerings.freeze
  UKULELE_FINGERINGS = ukulele_fingerings.freeze
end
