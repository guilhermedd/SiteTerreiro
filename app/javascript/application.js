import "@hotwired/turbo-rails";
import "controllers";
import "bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";

import Rails from "@rails/ujs";
Rails.start();

document.addEventListener("DOMContentLoaded", function () {
    // Lógica para mostrar/ocultar os divs com base na seleção
    const selectElement = document.getElementById("type_of_gira_select");
    const outroDiv = document.getElementById("outro-div");
    const defaultDiv = document.getElementById("default-div");

    if (selectElement) {
        function checkType() {
            if (selectElement.value === "outro") {
                outroDiv.style.display = "block";
                defaultDiv.style.display = "none";
            } else {
                outroDiv.style.display = "none";
                defaultDiv.style.display = "block";
            }
        }

        checkType();
        selectElement.addEventListener("change", checkType);
    }

    // Adiciona a confirmação no botão "Cancelar"
    const cancelLink = document.querySelector(".btn-danger");
    if (cancelLink) {
        cancelLink.addEventListener("click", function (event) {
            const confirmacao = confirm("Tem certeza que deseja cancelar?");
            if (!confirmacao) {
                event.preventDefault(); // Cancela a ação se o usuário não confirmar
            }
        });
    }
});
