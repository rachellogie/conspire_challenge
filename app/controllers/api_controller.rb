class ApiController < ApplicationController

  def query

    sort = params[:sort]

    file_reader = FileReader.new
    lines_array = file_reader.to_hash(sort)

    render json: lines_array.to_json

  end
end