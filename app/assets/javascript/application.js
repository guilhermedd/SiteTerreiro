document.addEventListener('turbo:load', function () {
    const container = document.getElementById('pessoas-container');

    if (!container) return;

    container.addEventListener('click', function (event) {
        if (event.target && event.target.id === 'meuBotao') {
            const novaDiv = document.createElement('div');
            novaDiv.classList.add('d-flex', 'align-items-center', 'mt-2');

            const inputFile = document.createElement('input');
            inputFile.type = 'file';
            inputFile.name = 'galery[images][]';
            inputFile.classList.add('form-control', 'me-2');

            const deleteButton = document.createElement('button');
            deleteButton.type = 'button';
            deleteButton.classList.add('btn', 'btn-danger');
            deleteButton.textContent = 'Excluir';

            deleteButton.addEventListener('click', function () {
                novaDiv.remove();
            });

            novaDiv.appendChild(inputFile);
            novaDiv.appendChild(deleteButton);

            const newPhotoContainer = document.getElementById('new_photos');
            if (newPhotoContainer) {
                newPhotoContainer.appendChild(novaDiv);
            } else {
                console.error('Elemento com ID "new_photos" não encontrado.');
            }
        }
    });
});


function openGalleryModal(galeryId, ...imageUrls) {
    let modal = document.getElementById("galleryModal");
    let modalBody = modal.querySelector(".modal-body");

    // Limpa qualquer conteúdo antigo
    modalBody.innerHTML = "";

    // Cria a estrutura do carrossel dinamicamente
    let carouselId = `carousel_${galeryId}`;
    let carousel = document.createElement("div");
    carousel.className = "carousel slide";
    carousel.id = carouselId;
    carousel.setAttribute("data-bs-ride", "carousel");

    // Indicadores do carrossel
    let indicators = document.createElement("div");
    indicators.className = "carousel-indicators";

    // Slides do carrossel
    let inner = document.createElement("div");
    inner.className = "carousel-inner";

    // Loop pelas imagens para criar os elementos do carrossel
    imageUrls.forEach((src, index) => {
        let button = document.createElement("button");
        button.type = "button";
        button.setAttribute("data-bs-target", `#${carouselId}`);
        button.setAttribute("data-bs-slide-to", index);
        if (index === 0) button.classList.add("active");
        indicators.appendChild(button);

        let item = document.createElement("div");
        item.className = "carousel-item";
        if (index === 0) item.classList.add("active");

        let img = document.createElement("img");
        img.src = src;
        img.className = "d-block w-100";
        img.style.maxWidth = "100%";   // Garante que a imagem não ultrapasse o modal
        img.style.maxHeight = "80vh";  // Mantém a altura limitada para caber na tela
        img.style.width = "auto";      // Mantém a proporção correta
        img.style.height = "auto";
        img.style.objectFit = "contain";  // Garante que a imagem seja ajustada sem cortar


        item.appendChild(img);
        inner.appendChild(item);
    });

    // Botões de navegação
    let prevButton = `
<button class="carousel-control-prev" type="button" data-bs-target="#${carouselId}" data-bs-slide="prev">
  <span class="carousel-control-prev-icon" aria-hidden="true">&lt;</span>
  <span class="visually-hidden">Anterior</span>
</button>`;

    let nextButton = `
<button class="carousel-control-next" type="button" data-bs-target="#${carouselId}" data-bs-slide="next">
  <span class="carousel-control-next-icon" aria-hidden="true">&gt;</span>
  <span class="visually-hidden">Próximo</span>
</button>`;

    // Monta o carrossel e adiciona ao modal
    carousel.appendChild(indicators);
    carousel.appendChild(inner);
    carousel.insertAdjacentHTML("beforeend", prevButton + nextButton);
    modalBody.appendChild(carousel);

    // Exibe o modal
    let modalInstance = new bootstrap.Modal(modal);
    modalInstance.show();
}

document.getElementById('file-upload').addEventListener('change', function (event) {
    const files = event.target.files;
    const previewContainer = document.getElementById('image-previews');

    previewContainer.innerHTML = ''; // Limpar miniaturas anteriores

    Array.from(files).forEach(file => {
        const reader = new FileReader();

        reader.onload = function (e) {
            const imgElement = document.createElement('img');
            imgElement.src = e.target.result;
            imgElement.style.width = '100px';  // Defina o tamanho da miniatura
            imgElement.style.marginRight = '10px';
            previewContainer.appendChild(imgElement);
        };

        reader.readAsDataURL(file);
    });
});
