require 'chord_diagrams/version'
require 'victor'

module ChordDiagrams
  LINE_STYLE = {
    stroke: :black,
    stroke_width: 2,
    stroke_linecap: :square
  }.freeze

  class << self
    def chord_svg(name, fingerings = nil)
      svg = Victor::SVG.new template: :html, width: 100, height: 100, viewBox: '0 0 200 200'

      ChordDiagrams.draw_name(name, svg)
      ChordDiagrams.draw_frets(svg)
      ChordDiagrams.draw_strings(svg)

      fingerings = CHORD_FINGERINGS[name.to_sym] if fingerings.nil?

      if !fingerings.nil?
        ChordDiagrams.draw_chord_diagram(fingerings, svg)
      else
        ChordDiagrams.draw_missing_chord_diagram(svg)
      end

      svg.render
    end

    def draw_missing_chord_diagram(svg)
      puts "Could't find fingerings for the chord '#{name}'"

      svg.text '?', x: 102, y: 155, text_anchor: :middle, style: {
        font_size: 96,
        font_weight: :bold,
        fill: :gray
      }
    end

    def draw_chord_diagram(fingerings, svg)
      fingerings = fingerings.split('')

      lowest_fret = fingerings.min

      if lowest_fret.to_i > 2
        svg.text lowest_fret, x: 35, y: 96, text_anchor: :end, style: { font_size: 20 }

        fingerings = fingerings.map do |fingering|
          if fingering != 'x'
            fingering.to_i - lowest_fret.to_i + 1
          else
            fingering
          end
        end
      else
        draw_nut(svg)
      end

      fingerings.each_with_index do |fingering, index|
        offset = 50 + (20 * index)

        if fingering == 'x'
          draw_muted_string(offset, svg)
        elsif fingering == '0'
          draw_open_string(offset, svg)
        else
          draw_fingered_string(fingering, offset, svg)
        end
      end
    end

    def draw_name(name, svg)
      svg.text name, x: 100, y: 40, text_anchor: :middle, style: {
        font_size: 36,
        font_weight: :bold
      }
    end

    def draw_nut(svg)
      svg.line x1: 49, y1: 77, x2: 151, y2: 77, style: {
        stroke: :black,
        stroke_width: 8
      }
    end

    def draw_fingered_string(fingering, offset, svg)
      svg.circle cx: offset, cy: 70 + (fingering.to_i * 20), r: 8, style: {
        fill: :black
      }
    end

    def draw_open_string(offset, svg)
      svg.circle cx: offset, cy: 61, r: 6, style: {
        stroke: :black, fill: :white, stroke_width: 2
      }
    end

    def draw_muted_string(offset, svg)
      svg.line x1: offset - 4, y1: 61 - 4, x2: offset + 4, y2: 61 + 4, style: LINE_STYLE
      svg.line x1: offset - 4, y1: 61 + 4, x2: offset + 4, y2: 61 - 4, style: LINE_STYLE
    end

    def draw_strings(svg)
      [50, 70, 90, 110, 130, 150].each do |x|
        svg.line x1: x, y1: 80, x2: x, y2: 160, style: LINE_STYLE
      end
    end

    def draw_frets(svg)
      [80, 100, 120, 140, 160].each do |y|
        svg.line x1: 50, y1: y, x2: 150, y2: y, style: LINE_STYLE
      end
    end
  end

  CHORD_FINGERINGS = {
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
