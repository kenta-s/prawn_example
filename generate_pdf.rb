require "prawn"
require "prawn/table"

class PdfExample < Prawn::Document

  BLUE  = '5555FF'
  WHITE = 'FFFFFF'

  CONTENTS_WIDTH = 500

  def generate!(file_name)
    repeat(:all, dynamic: true) do
      header
      footer
    end
    body
    render_file(file_name)
  end

  private

  def header
    bounding_box [bounds.left, bounds.top], width: bounds.width do
      stroke do
        fill_color BLUE
        fill_rectangle [bounds.left, bounds.top], bounds.right, 30
      end
      move_down 6
      text "Here's a header", align: :center, size: 25, color: WHITE
    end
  end

  def footer
    bounding_box [bounds.left, bounds.bottom + 30], width: bounds.width do
      stroke do
        fill_color BLUE
        fill_rectangle [bounds.left, bounds.top], bounds.right, 30
      end
      move_down 6
      text "Here's a footer", align: :center, size: 25, color: WHITE
    end
  end

  def body
    bounding_box [bounds.left + 50, bounds.top - 35], width: CONTENTS_WIDTH, height: 750 do
      move_down 35
      sample_content1
      move_down 35
      sample_content2
      move_down 35
      sample_table
    end
  end

  def sample_content1
    text "Example Content 1 here", align: :left, size: 35, color: BLUE
    text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", align: :left, size: 10
  end

  def sample_content2
    text "Example Content 2 here", align: :left, size: 35, color: BLUE
    text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", align: :left, size: 10
  end

  def sample_table
    text "Table Content here", align: :left, size: 35, color: BLUE
    data = [["This is a table header."]]
    data += [["bla bla bla..."]] * 50
    table(data, width: bounds.width)
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
