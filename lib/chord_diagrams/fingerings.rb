module ChordDiagrams
  FINGERINGS = {
      # Major Chords
      'A': '002220',
      'B': 'x24442',
      'Bb': 'x13331',
      'C': 'x32010',
      'C#': 'x46664',
      'D': 'x00232',
      'D#': 'x68886',
      'E': '022100',
      'Eb': 'x68886',
      'F': '133211',
      'F#': '244322',
      'G': '320003',
      'G#': '466544',

      # Root/Five Chords
      'C5': 'x355xx',
      'D5': 'x577xx',
      'D#5': 'x688xx',

      # Six Chords
      'D6': 'xx0202',
      'E6': '022120',
      'G6': '320000',

      # Seventh Chords
      'A7': '002020',
      'B7': 'x21202',
      'C7': 'x32310',
      'C#7': 'x46464',
      'D7': 'x00212',
      'E7': '020100',
      'F7': '131211',
      'F#7': '242322',
      'G7': '320001',
      'G#7': '464544',

      # Major Seventh Chords
      'AM7': 'x02120',
      'CM7': 'x32000',
      'DM7': 'xx0222',
      'EM7': 'xx2444',
      'FM7': '132211',

      # Major Suspended 2nd Chords
      'Dsus2': 'xx0230',
      'Asus2': 'x02200',

      # Major Suspended 4th Chords
      'Asus4': 'x02230',
      'Dsus4': 'xx0233',
      'Esus4': '022200',

      # Seventh Suspended 4th Chords
      'A7sus4': '002030',
      'G7sus4': '353533',

      # Minor Chords
      'Am': '002210',
      'Bm': 'x24432',
      'Cm': 'x35543',
      'C#m': 'x46654',
      'Dm': 'x00231',
      'Em': '022000',
      'Fm': '133111',
      'F#m': '244222',
      'Gm': '355333',
      'G#m': '466444',

      # Minor Seventh Chords
      'Am7': '002010',
      'A#m7': 'x13121',
      'Bm7': 'x24232',
      'Cm7': 'x35343',
      'C#m7': 'x46454',
      'Dm7': 'x00211',
      'Em7': '020030',
      'Fm7': '131111',
      'F#m7': '242222',
      'Gm7': '353333',

      # Minor Eleventh Chords
      'Bm11': 'x20220',
      'F#m11': '202200',

      # Major 9th Chords
      'Cadd9': 'x32033',

      # Major Chords with Bass Notes
      'A/C#': '002220',
      'A/E': '04222x',
      'A/F#': '202220',
      'Bb/A': 'x00331',
      'C/B': 'x22010',
      'C/E': '032010',
      'D/A': 'x04232',
      'D/F#': '200232',
      'F/A': 'x03211',
      'G/B': 'x20003',

      # Seventh Chords with Bass Notes
      'C7/G': '3323xx',
      'D7/F#': '200212',
      'G7/F': '123003',

      # Minor Chords with Bass Notes
      'Am/D': 'xx0210',
      'Am/G': '302210',
      'A#m/D#': 'xx1321',
      'Dm/F': '10323x',
      'Gm/Bb': 'x10333',

      # Diminished Chords
      'G#dim': '4564xx',

      # Diminished Seventh Chords
      'D#dim7': 'xx1212',
      'G#dim7': '456464'
  }.freeze
end