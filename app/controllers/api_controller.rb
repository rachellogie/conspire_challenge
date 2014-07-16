class ApiController < ApplicationController

  def query

    lines_array = FileReader.new.to_hash

    render json: lines_array.to_json

  end
end