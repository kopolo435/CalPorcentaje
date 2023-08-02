let addMateBtn = document.getElementById("addMateria"); //Materia sera abreviado como Mate
let mateContainer = document.getElementById("listaMaterias");
let eliminarMateBtnLista = document.getElementsByClassName("eliminarBtn");
addMateBtn.addEventListener("click", ()=> {
    let materia = document.createElement("div");
    let nombreMate = document.createElement("h2");
    let estadoNota = document.createElement("p");
    let porcentaje = document.createElement("p");
    materia.classList.add("materia");
    nombreMate.classList.add("nombreMateria");
    estadoNota.classList.add("estadoNota");
    porcentaje.classList.add("porcentaje");
    nombreMate.textContent = "Matematicas"
    estadoNota.textContent = "Fracasada";
    porcentaje.textContent = "50%";
    materia.appendChild(nombreMate);
    materia.appendChild(estadoNota);
    materia.appendChild(porcentaje);
    mateContainer.insertBefore(materia,mateContainer.lastElementChild);

})

function eliminarNotaEvent(button){
    button.addEventListener("click", () =>{
        const eliminarParent = button.parentNode.parentNode;
        if(eliminarParent.nodeName !="FORM"){
            eliminarParent.removeChild(button.parentNode);
        }
        else{
            eliminarParent.parentNode.removeChild(eliminarParent);
        }
    })
}

Array.from(eliminarMateBtnLista).forEach(eliminarBtn =>{
    eliminarNotaEvent(eliminarBtn);
})