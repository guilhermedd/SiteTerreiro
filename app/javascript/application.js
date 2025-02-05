import "app/javascript/controllers"
import "@hotwired/turbo-rails";


document.addEventListener('DOMContentLoaded', function() {
    // Seleciona o contêiner onde os botões serão adicionados
    const container = document.getElementById('pessoas-container');

    // Adiciona um ouvinte de evento de clique ao contêiner
    container.addEventListener('click', function(event) {
        // Verifica se o elemento clicado é o botão desejado
        if (event.target && event.target.id === 'meuBotao') {
            console.log('Olá');
        }
    });
});
