class InvestmentsController < ApplicationController

  def index
    @investment_data = Investment.group_by_day_of_week(:created_at, format: "%a").sum(:amount)
    @investments = Investment.all
  end

  def show
    @investment = Investment.all
  end

  def create
    @investment = Investment.new(investment_params)

    if @investment.save
      render json: @investment
    else
      render json: @investment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @investment = Investment.find(params[:id])
    @investment.destroy
    head :no_content
  end

  private
  def investment_params
    params.require(:investment).permit(:date, :purpose, :amount, :incomeOutcome, :assetLiability)
  end
end
