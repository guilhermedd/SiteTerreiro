Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https
  policy.script_src :self, :https, 'https://cdn.jsdelivr.net', 'unsafe-inline'
  policy.script_src_elem :self, :https # Permite carregar scripts como módulos
  policy.style_src :self, :https, 'https://cdn.jsdelivr.net', 'unsafe-inline'
  policy.font_src :self, :https, 'https://cdn.jsdelivr.net'
  policy.img_src :self, :https
  policy.connect_src :self, :https
end
