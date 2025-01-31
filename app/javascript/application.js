// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'


document.addEventListener("DOMContentLoaded", function () {
    const selectElement = document.getElementById("type_of_gira_select");
    const outroDiv = document.getElementById("outro-div");
    const defaultDiv = document.getElementById("default-div");

    // Função para verificar a seleção e alterar a visibilidade
    function checkType() {
        if (selectElement.value === "outro") {
            outroDiv.style.display = "block";
            defaultDiv.style.display = "none";
        } else {
            outroDiv.style.display = "none";
            defaultDiv.style.display = "block";
        }
    }

    // Verifica logo ao carregar a página caso já tenha sido selecionado "outro"
    checkType();

    // Adiciona um evento para cada mudança na seleção
    selectElement.addEventListener("change", checkType);
});

