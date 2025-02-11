namespace :admin do
  desc "Cria um usuário administrador"
  task create: :environment do
    admin = User.create_or_find_by!(email: ENV["ADMIN_EMAIL"]) do |adm|
      adm.password = ENV["ADMIN_PASSWORD"]
      adm.name = "admin"
  end

  puts "Admin criado com sucesso! #{admin.email}"
  end
end