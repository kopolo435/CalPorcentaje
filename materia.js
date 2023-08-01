let mostrarNotaList = document.getElementsByClassName("showNotas");
const addPorcentajeBtn = document.getElementById("addPorcentaje");

function createLabelNombrePor(){
    const label =document.createElement("label");
    const pNombre = document.createElement("p");
    const inputNombre = document.createElement("input");

    
    pNombre.textContent = "Nombre Porcentaje"; 

    inputNombre.setAttribute("name", "nomrePor"); //Coloca los atributos necesarios del input
    inputNombre.setAttribute("type", "text");   
    inputNombre.setAttribute("id", "nomrePor");
    inputNombre.setAttribute("placeholder","Portafolio");

    label.setAttribute("id","labelNombrePor");//Coloca los atributos necesarios del label
    label.setAttribute("class","inputNew");
    label.setAttribute("for","nombrePor");

    label.appendChild(pNombre);
    label.appendChild(inputNombre);

    return label
}

function createLabelValPor(){
    const label = document.createElement("label");
    const pVal = document.createElement("p");
    const inputVal = document.createElement("input");
    const container = document.createElement("div");
    const pPorncetaje = document.createElement("p");

    pVal.textContent = "Valor Porcentaje"; 
    pPorncetaje.textContent = "%";

    inputVal.setAttribute("name", "valPor"); //Coloca los atributos necesarios del input
    inputVal.setAttribute("type", "number");   
    inputVal.setAttribute("id", "valPor");
    inputVal.setAttribute("placeholder","0");

    label.setAttribute("id","labelValPor");//Coloca los atributos necesarios del label
    label.setAttribute("class","inputNew");
    label.setAttribute("for","valPor");

    label.appendChild(pVal);
    container.appendChild(inputVal);
    container.appendChild("p");
    label.appendChild(container);
    return label
}

function createNewElementForm(){
    const form = document.createElement("form");

    form.setAttribute("id","newPorcentaje");
    form.setAttribute("action"," ");
    return form
}

Array.from(mostrarNotaList).forEach(button => {

    button.addEventListener("click", ()=>{
    // Find the parent porcentajeContainer element
    const parentPorcentajeContainer = button.closest(".porcentajeContainer");

    // Find the child notasContainer element within the parent porcentajeContainer
    const notasContainer = parentPorcentajeContainer.querySelector(".notasContainer");
    // Toggle the display property for the notasContainer
    notasContainer.style.display = notasContainer.style.display === "none" ? "grid" : "none";
    })
});

addPorcentajeBtn.addEventListener("click", button=>{
    const materiasContainer = button.closest(".materiasContainer");
    const form = createNewElementForm();
    const nombreLabel = createLabelNombrePor();
    const valLabel = createLabelValPor();
    const eliminarBtn = document.createElement("button");
    const porcentajeContainer = document.createElement("div");
    const infoPorContainer = document.createElement("div");

    eliminarBtn.textContent = "Eliminar";
    eliminarBtn.setAttribute("class","eliminarBtn");
    porcentajeContainer.setAttribute("class","porcentajeContainer");
    infoPorContainer.setAttribute("class", "infoPorcentaje");
    
    infoPorContainer.appendChild(eliminarBtn);
    infoPorContainer.appendChild(nombreLabel);
    infoPorContainer.appendChild(valLabel);
    form.append(infoPorContainer);
    porcentajeContainer.append(form);

})