class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  after_update :send_mail

  validates_presence_of :text

  scope :approved, -> { where(is_approved: true) }

  private
  def send_mail
    if is_approved_changed? && is_approved
      UserMailer.new_reply_email(self).deliver_later
    end
  end
end
