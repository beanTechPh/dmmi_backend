class InviteMailer < ApplicationMailer

  def admin_invite
    @email = params[:email]

    mail(to: @email, subject: "DMMI System Invitation")
  end
  
end
