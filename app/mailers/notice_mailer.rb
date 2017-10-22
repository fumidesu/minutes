class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_minute.subject
  #
  def sendmail_minute(minute)
    @minute = minute


    attachments["#{@minute.title}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string pdf: "#{@minute.title}.pdf",
        template: 'minutes/store.pdf.erb',
        no_background: false
    )

    mail to: "fumilein23@yahoo.co.jp",
       subject: @minute.title
  end
end
