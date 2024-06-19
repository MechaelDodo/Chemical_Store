class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # min_amount = 50
    # sql_condition = "(created_at != updated_at) and amount < #{min_amount}"
    # @product_stocks = ProductStock.where(sql_condition)
    User.where(admin: true).each do |user_admin|
      AmountNotificationMailer.with(user:user_admin).create_notification.deliver_later
    end
  end
end
