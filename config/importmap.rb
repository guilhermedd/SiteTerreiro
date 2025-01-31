# Pin npm packages by running ./bin/importmap

pin "application"
pin "custom", to: "custom.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
# config/importmap.rb
# config/importmap.rb
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
pin "bootstrap-icons", to: "https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
pin "application", to: "application.js"


