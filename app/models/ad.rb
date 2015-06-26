class Ad < ActiveRecord::Base
  belongs_to :user
  has_many   :messages


  def sent_messages current_user_id # you can skip sending user_id if you have a access to current user in models
    messages.where(user_id: current_user_id)
  end
end
