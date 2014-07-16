class ApiController < ApplicationController

  def query
    sort = params[:sort]

    lines_array = FileReader.new.to_hash(sort)

    render json: lines_array.to_json
  end
end