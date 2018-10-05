class UrlController < ApplicationController
  # def create
  #   @proposal = Proposal.new(proposal_params)

  #   if @proposal.save
  #     render json: @proposal, status: :created, location: @proposal
  #   else
  #     render json: @proposal.errors, status: :unprocessable_entity
  #   end
  # end
  def create
    @url = Url.new(url_params)
    if @url.save
      render json: @url, status: :ok
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  def show
    @url = Url.find(params[:id])
    redirect_to @url.original_url
  end

  private
    def url_params
      params.require(:url).permit(:url_orginal)
    end
end
