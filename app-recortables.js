document.addEventListener('DOMContentLoaded', () => {
    const imprimirBtn = document.getElementById('imprimirBtn');

    imprimirBtn.addEventListener('click', () => {
        // La función window.print() abre el diálogo de impresión del navegador
        window.print();
    });
});
