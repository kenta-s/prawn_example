require "prawn"
require "prawn/table"

file_name = "example.pdf"

Prawn::Document.generate(file_name) {
}
