class InvestmentsController < ApplicationController

  def index
    @investments = Investment.all
  end

  def create
    @investment = Investment.new(investment_params)

    if @investment.save
      render json: @investment
    else
      render json: @investment.errors, status: :unprocessable_entity
    end
  end

  private
  def investment_params
    params.require(:investment).permit(:date, :purpose, :amount, :incomeOutcome, :assetLiability)
  end
end
