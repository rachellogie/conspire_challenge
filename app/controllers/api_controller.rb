class ApiController < ApplicationController

  def query
    sort_order = params[:sort]

    lines_array = FileReader.new.to_hash(sort_order)

    render json: lines_array.to_json
  end
end