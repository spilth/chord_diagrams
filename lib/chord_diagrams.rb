require "chord_diagrams/version"
require "chord_diagrams/fingerings"
require "victor"

module ChordDiagrams
  LINE_STYLE = {
    stroke: :black,
    stroke_width: 2,
    stroke_linecap: :square
  }.freeze

  class << self
    def ukulele_svg(name, fingering = nil)
      svg = Victor::SVG.new template: :minimal, width: 80, height: 100, viewBox: "0 0 160 200"

      ChordDiagrams.draw_ukulele_name(name, svg)
      ChordDiagrams.draw_ukulele_frets(svg)
      ChordDiagrams.draw_ukulele_strings(svg)

      fingering = ChordDiagrams::UKULELE_FINGERINGS[name] if fingering.nil?

      if !fingering.nil?
        ChordDiagrams.draw_chord_diagram(fingering, svg)
      else
        ChordDiagrams.draw_ukulele_missing_chord_diagram(name, svg)
      end

      svg.render
    end

    def guitar_svg(name, fingering = nil)
      svg = Victor::SVG.new template: :minimal, width: 100, height: 100, viewBox: "0 0 200 200"

      ChordDiagrams.draw_guitar_name(name, svg)
      ChordDiagrams.draw_guitar_frets(svg)
      ChordDiagrams.draw_guitar_strings(svg)

      fingering = ChordDiagrams::GUITAR_FINGERINGS[name] if fingering.nil?

      if !fingering.nil?
        ChordDiagrams.draw_chord_diagram(fingering, svg)
      else
        ChordDiagrams.draw_guitar_missing_chord_diagram(name, svg)
      end

      svg.render
    end

    def draw_ukulele_name(name, svg)
      svg.text name, id: "chordName", x: 80, y: 40, text_anchor: :middle, style: {
        font_size: 36,
        font_weight: :bold
      }
    end

    def draw_guitar_name(name, svg)
      svg.text name, id: "chordName", x: 100, y: 40, text_anchor: :middle, style: {
        font_size: 36,
        font_weight: :bold
      }
    end

    def draw_guitar_frets(svg)
      [80, 100, 120, 140, 160].each do |y|
        svg.line x1: 50, y1: y, x2: 150, y2: y, style: LINE_STYLE
      end
    end

    def draw_ukulele_frets(svg)
      [80, 100, 120, 140, 160].each do |y|
        svg.line x1: 50, y1: y, x2: 110, y2: y, style: LINE_STYLE
      end
    end

    def draw_guitar_strings(svg)
      [50, 70, 90, 110, 130, 150].each do |x|
        svg.line x1: x, y1: 80, x2: x, y2: 160, style: LINE_STYLE
      end
    end

    def draw_ukulele_strings(svg)
      [50, 70, 90, 110].each do |x|
        svg.line x1: x, y1: 80, x2: x, y2: 160, style: LINE_STYLE
      end
    end

    def draw_guitar_missing_chord_diagram(name, svg)
      puts "Could't find fingerings for the Guitar chord '#{name}'"

      svg.text "?", x: 102, y: 155, text_anchor: :middle, style: {
        font_size: 96,
        font_weight: :bold,
        fill: :gray
      }
    end

    def draw_ukulele_missing_chord_diagram(name, svg)
      puts "Couldn't find fingerings for the Ukulele chord '#{name}'"

      svg.text "?", x: 81, y: 155, text_anchor: :middle, style: {
        font_size: 96,
        font_weight: :bold,
        fill: :gray
      }
    end

    def draw_chord_diagram(fingerings, svg)
      fingerings = fingerings.chars

      lowest_fret = fingerings.reject { |fret| fret.to_i < 1 }.min
      highest_fret = fingerings.reject { |fret| fret.to_i < 1 }.max

      if lowest_fret.to_i > 3 || highest_fret.to_i > 4
        draw_fret_number(lowest_fret, svg)

        fingerings = shift_guitar_fingerings(fingerings, lowest_fret)
      elsif fingerings.size == 6
        draw_guitar_nut(svg)
      else
        draw_ukulele_nut(svg)
      end

      fingerings.each_with_index do |fingering, index|
        offset = 50 + (20 * index)

        if fingering == "x"
          draw_muted_string(offset, svg)
        elsif fingering == "0"
          draw_open_string(offset, svg)
        else
          draw_fingered_string(fingering, offset, svg)
        end
      end
    end

    def draw_guitar_nut(svg)
      svg.line id: "nut", x1: 49, y1: 77, x2: 151, y2: 77, style: {
        stroke: :black,
        stroke_width: 8
      }
    end

    def draw_ukulele_nut(svg)
      svg.line id: "nut", x1: 49, y1: 77, x2: 111, y2: 77, style: {
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

    private

    def draw_fret_number(number, svg)
      svg.text number, id: "fretNumber", x: 37, y: 98, text_anchor: :end, style: {font_size: 24}
    end

    def shift_guitar_fingerings(fingerings, lowest_fret)
      fingerings.map do |fingering|
        if fingering != "x" && fingering != "0"
          fingering.to_i - lowest_fret.to_i + 1
        else
          fingering
        end
      end
    end
  end
end
