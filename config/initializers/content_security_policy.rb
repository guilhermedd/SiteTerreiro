Rails.application.config.content_security_policy do |policy|
  # Para scripts
  policy.script_src :self, :https, 'https://cdn.jsdelivr.net', :unsafe_inline
  # Para scripts carregados como elementos (modules, etc.)
  policy.script_src_elem :self, :https, 'https://cdn.jsdelivr.net', :unsafe_inline

  # Para styles
  policy.style_src :self, :https, 'https://cdn.jsdelivr.net', :unsafe_inline

  # Para fontes
  policy.font_src :self, :https, 'https://cdn.jsdelivr.net'

  # Para imagens
  policy.img_src :self, :https

  # Para conexões (AJAX, WebSocket, etc.)
  policy.connect_src :self, :https
end
