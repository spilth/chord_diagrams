require 'chord_diagrams/version'
require 'chord_diagrams/fingerings'
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

      if fingerings.nil?
        fingerings = ChordDiagrams::FINGERINGS[name.to_sym]
      end

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

      lowest_fret = fingerings.reject{ |fret| fret.to_i < 1 }.min

      if lowest_fret.to_i > 2
        svg.text lowest_fret, id: 'fretNumber', x: 35, y: 96, text_anchor: :end, style: { font_size: 20 }

        fingerings = shift_fingerings(fingerings, lowest_fret)
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
      svg.text name, id: 'chordName', x: 100, y: 40, text_anchor: :middle, style: {
        font_size: 36,
        font_weight: :bold
      }
    end

    def draw_nut(svg)
      svg.line id: 'nut', x1: 49, y1: 77, x2: 151, y2: 77, style: {
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

    private

    def shift_fingerings(fingerings, lowest_fret)
      fingerings.map do |fingering|
        if fingering != 'x' && fingering != '0'
          fingering.to_i - lowest_fret.to_i + 1
        else
          fingering
        end
      end
    end
  end
end
