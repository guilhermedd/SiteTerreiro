Rails.application.config.content_security_policy do |policy|
  # Permite o carregamento de estilos, scripts e fontes do CDN do Bootstrap
  policy.style_src :self, 'https://cdn.jsdelivr.net'
  policy.script_src :self, 'https://cdn.jsdelivr.net'
  policy.font_src :self, 'https://cdn.jsdelivr.net'
  policy.img_src :self, 'https://cdn.jsdelivr.net'

end
