class VotesController < ApplicationController

  def create
    render text: params
  end
end