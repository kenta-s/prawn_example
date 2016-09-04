require "prawn"
require "prawn/table"

class PdfExample < Prawn::Document

  BLUE  = '5555FF'
  WHITE = 'FFFFFF'

  def generate!(file_name)
    header
    footer
    render_file(file_name)
  end

  private

  def header
    bounding_box [bounds.left, bounds.top], :width  => bounds.width do
      stroke do
        fill_color BLUE
        fill_rectangle [bounds.left, bounds.top], bounds.right, 30
      end
      move_down 6
      text "Here's a header", :align => :center, :size => 25, :color => WHITE
    end
  end

  def footer
    bounding_box [bounds.left, bounds.bottom + 30], :width  => bounds.width do
      stroke do
        fill_color BLUE
        fill_rectangle [bounds.left, bounds.top], bounds.right, 30
      end
      move_down 6
      text "Here's a footer", :align => :center, :size => 25, :color => WHITE
    end
  end
end

pdf = PdfExample.new(
  page_size: "A4",
  page_layout: :portrait,
  top_margin: 0,
  bottom_margin: 0,
  left_margin: 0,
  right_margin: 0
)
pdf.generate!("example.pdf")
