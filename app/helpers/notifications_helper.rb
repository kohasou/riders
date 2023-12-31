module NotificationsHelper
  def unchecked_notifications
    @notifications=current_user.passive_notifications.where(checked: false)
  end

  def notification_form(notification)
    @comment=nil
    visitor=link_to notification.visitor.nickname, notification.visitor, style:"font-weight: bold;"
    case notification.action
      when "follow" then
        "#{visitor}があなたをフォローしました"
      when "nice" then
        "#{visitor}があなたの投稿にいいね！しました"
      when "comment" then
        @comment=Comment.find_by(id:notification.comment_id)&.reply
        "#{visitor}があなたの投稿にコメントしました"
    end
  end
end
