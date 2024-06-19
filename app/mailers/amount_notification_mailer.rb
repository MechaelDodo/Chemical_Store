class AmountNotificationMailer < ApplicationMailer
  def create_notification
    @user = params[:user]
    # @product_stocks = params[:product_stocks]
    min_amount = 50
    sql_condition = "(created_at != updated_at) and amount < #{min_amount}"
    @product_stocks = ProductStock.where(sql_condition)
    mail to: @user.email, subject: "This message for admin #{@user.email}"
  end
end
