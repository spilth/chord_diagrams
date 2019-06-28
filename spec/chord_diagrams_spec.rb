require 'nokogiri'

RSpec.describe ChordDiagrams do
  RSpec::Matchers.define :start_on_the_nut do
    match do |actual|
      xml = Nokogiri::XML(actual)
      xml.xpath("svg/line[@id='nut']").length == 1
    end
  end

  RSpec::Matchers.define :start_on_fret do |expected|
    match do |actual|
      xml = Nokogiri::XML(actual)
      fret_number(xml) == expected.to_s
    end

    failure_message do |actual|
      xml = Nokogiri::XML(actual)
      fret_number = fret_number(xml)

      "expected starting fret to be #{expected}, but was #{fret_number}"
    end

    def fret_number(xml)
      xml.xpath("svg/text[@id='fretNumber']").text.delete!("\n")
    end
  end

  RSpec::Matchers.define :have_chord_name do |expected|
    match do |actual|
      xml = Nokogiri::XML(actual)
      xml.xpath("svg/text[@id='chordName']").text.delete!("\n") == expected
    end
  end

  context 'when the lowest fingering is below the 3rd fret' do
    it 'draws the nut but no starting fret number' do
      diagram = ChordDiagrams.chord_svg('A', 'x02220')

      expect(diagram).to have_chord_name('A')
      expect(diagram).to start_on_the_nut
    end
  end

  context 'when the lowest fingering is the 3rd fret or higher' do
    it 'draws the starting fret number' do
      diagram = ChordDiagrams.chord_svg('C#m', 'x35543')

      expect(diagram).to have_chord_name('C#m')
      expect(diagram).to start_on_fret(3)
    end
  end
end
