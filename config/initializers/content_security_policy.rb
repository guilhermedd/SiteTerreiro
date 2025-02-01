Rails.application.config.content_security_policy do |policy|
  # Permite scripts de 'self', fontes externas como o CDN do jsdelivr, cdn.jsdelivr.net, e cdn.jsdelivr.net/npm
  policy.script_src :self, 'https://cdn.jsdelivr.net', 'https://cdnjs.cloudflare.com', :unsafe_inline

  # Permite folhas de estilo externas, como o Google Fonts e jsdelivr
  policy.style_src :self, 'https://cdn.jsdelivr.net', 'https://fonts.googleapis.com', 'https://cdnjs.cloudflare.com'

  # Permite o carregamento de fontes de Google Fonts e jsdelivr
  policy.font_src :self, 'https://fonts.gstatic.com', 'https://cdn.jsdelivr.net'

  # Permite imagens de 'self', data URIs e jsdelivr
  policy.img_src :self, :data, 'https://cdn.jsdelivr.net'

  # Permite carregamento de recursos necessários para o Rails UJS
  policy.script_src :self, 'https://cdnjs.cloudflare.com', :unsafe_inline
end
