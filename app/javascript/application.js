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
            // Alternando as classes CSS visíveis e ocultas
            if (selectElement.value === "outro") {
                outroDiv.classList.remove("hidden");
                outroDiv.classList.add("visible");

                defaultDiv.classList.remove("visible");
                defaultDiv.classList.add("hidden");
            } else {
                outroDiv.classList.remove("visible");
                outroDiv.classList.add("hidden");

                defaultDiv.classList.remove("hidden");
                defaultDiv.classList.add("visible");
            }
        }

        checkType();
        selectElement.addEventListener("change", checkType);
    }
});
