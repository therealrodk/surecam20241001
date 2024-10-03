class FilesController < ApplicationController
  def show_permutations
    if params[:file].present?
      uploaded_file = params[:file]

      if uploaded_file.content_type == "text/plain"
        file_content = uploaded_file.read
        @content = generate_output(file_content)
      else
        redirect_to root_path, alert: "Only text files are allowed."
      end
    else
      redirect_to root_path, alert: "No file uploaded."
    end
  end

  private

  def generate_output(file)
    strings = file.split("\n")
    output = ''

    strings.each do |string|
      permutations = string.chars.permutation.map(&:join)

      sorted_permutations = permutations.sort.join(',')
      output += sorted_permutations
      output += "\n"
    end

    output
  end
end
