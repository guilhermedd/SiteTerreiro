# Pinar o arquivo application.js
pin "application", preload: true


# Pinar Bootstrap e Popper.js
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://unpkg.com/@popperjs/core@2.11.2/dist/esm/index.js"

# Pinar todos os controladores do Stimulus
pin_all_from "app/javascript/controllers", under: "controllers", preload: true
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js", preload: true # @8.0.12
pin "@hotwired/turbo", to: "@hotwired--turbo.js", preload: true # @8.0.12
pin "@rails/actioncable/src", to: "@rails--actioncable--src.js", preload: true # @7.2.201
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js", preload: true # @3.2.2
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.bundle.min.js"
