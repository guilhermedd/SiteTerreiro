require 'mailersend'

class PresencaMailer < ApplicationMailer
  def send_welcome_email(presenca, evento)
    api_key = ENV['MAILERSEND_API_KEY']
    raise "API token is not provided" if api_key.nil? || api_key.empty?

    # Set up Mailersend client
    client = Mailersend::Client.new(api_key)
    email = Mailersend::Email.new(client)

    # Add recipient and sender information
    email.add_recipients({ "email" => presenca.email })
    email.add_from({ "email" => ENV["BASE_EMAIL"], "name" => "Tenda de Umbanda Ogum Yara" })
    email.add_subject("Confirmação de Presença")

    # Render HTML content for email body
    html_content = render_to_string(
      'mailer/notificacao_presenca',
      locals: { evento: evento, presenca: presenca }
    )
    email.add_html(html_content)

    # Send the email
    response = email.send

    # Handle response and log success or failure
    if response && response['status'] == 'success'
      Rails.logger.info "E-mail enviado com sucesso!"
    else
      error_message = response ? response['message'] : 'Resposta vazia'
      Rails.logger.error "Erro ao enviar o e-mail: #{error_message}"
    end
  end

  def contact_us(name, email, subject, text)
    Rails.logger.info "Enviando e-mail para o contato..."

    api_key = ENV['MAILERSEND_API_KEY']
    raise "API token is not provided" if api_key.nil? || api_key.empty?

    # Set up Mailersend client
    client = Mailersend::Client.new(api_key)
    @email = Mailersend::Email.new(client)

    # Add recipient and sender information
    @email.add_recipients("email" => ENV["CONTACT_EMAIL"])
    @email.add_from("email" => ENV["BASE_EMAIL"], "name" => "Tenda de Umbanda Ogum Yara")
    @email.add_subject("Nos Contate")

    # Render HTML content for email body
    html_content = render_to_string(
      'mailer/nos_contate',
      locals: { name: name, email: email, subject: subject, text: text }
    )
    @email.add_html(html_content)

    # Send the email
    response = @email.send

    # Log response for debugging purposes
    Rails.logger.info "Resposta do envio: #{response}"

    if response['status'] == 'success'
      Rails.logger.info "E-mail enviado com sucesso!"
    else
      Rails.logger.error "Erro ao enviar o e-mail: #{response['message']}"
    end
  end
end
