import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fieldsContainer"]  // Esta linha referencia o campo de onde os campos serão inseridos

  addField(event) {
    event.preventDefault();

    // Cria um novo input de arquivo
    const newField = document.createElement("input");
    newField.type = "file";
    newField.name = "galery[images][]";  // Nome para o array de imagens
    newField.classList.add("form-control", "mt-2"); // Adiciona classes, como 'form-control'

    // Adiciona o novo campo ao container
    this.fieldsContainerTarget.appendChild(newField);
  }
}
