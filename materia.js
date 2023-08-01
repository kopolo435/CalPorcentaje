let mostrarNotaList = document.getElementsByClassName("showNotas");

mostrarNotaList.forEach(button => {
    button.addEventListener("click", ()=>{
    // Find the parent porcentajeContainer element
    const parentPorcentajeContainer = button.closest(".porcentajeContainer");

    // Find the child notasContainer element within the parent porcentajeContainer
    const notasContainer = parentPorcentajeContainer.querySelector(".notasContainer");
    // Toggle the display property for the notasContainer
    notasContainer.style.display = notasContainer.style.display === "none" ? "block" : "none";
    })
});