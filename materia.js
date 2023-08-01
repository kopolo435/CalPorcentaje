const addPorcentajeBtn = document.getElementById("addPorcentaje");
const materiasCon = document.getElementById("materiasCon");
const addNotaList = document.getElementsByClassName("addNota");
let  eliminarPorBtnLista = document.getElementsByClassName("eliminarPorBtn");
let eliminarNotaBtnLista = document.getElementsByClassName("eliminarBtn");
let mostrarNotaList = document.getElementsByClassName("showNotas");

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
    container.appendChild(pPorncetaje);
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

function changeDisabledNota(boolean){
    const addNotaBtnLista = document.getElementsByClassName("addNota");
    Array.from(addNotaBtnLista).forEach(button =>{
        button.disabled = boolean;
    })
}

addPorcentajeBtn.addEventListener("click", ()=>{
    const form = createNewElementForm();
    const nombreLabel = createLabelNombrePor();
    const valLabel = createLabelValPor();
    const eliminarBtn = document.createElement("button");
    const porcentajeContainer = document.createElement("div");
    const infoPorContainer = document.createElement("div");

    eliminarBtn.textContent = "Eliminar";
    eliminarBtn.setAttribute("class","eliminarPorBtn");
    EliminarPorEvent(eliminarBtn);
    porcentajeContainer.setAttribute("class","porcentajeContainer");
    infoPorContainer.setAttribute("class", "infoPorcentaje");
    
    infoPorContainer.appendChild(eliminarBtn);
    infoPorContainer.appendChild(nombreLabel);
    infoPorContainer.appendChild(valLabel);
    form.append(infoPorContainer);
    porcentajeContainer.append(form);
    materiasCon.insertBefore(porcentajeContainer,materiasCon.lastElementChild);
    addPorcentajeBtn.setAttribute("disabled","true");
    changeDisabledNota(true);
})

function EliminarPorEvent(button){
    button.addEventListener("click", ()=>{
        const eliminarParent = button.parentNode.parentNode;
        if (eliminarParent.nodeName != "FORM"){
            eliminarParent.parentNode.removeChild(eliminarParent);
        }
        else{
            eliminarParent.parentNode.parentNode.removeChild(eliminarParent.parentNode);
            addPorcentajeBtn.disabled = false;
            changeDisabledNota(false);
        }
    })
}

function eliminarNotaEvent(button){
    button.addEventListener("click", () =>{
        const eliminarParent = button.parentNode;
        if(eliminarParent.nodeName !="FORM"){
            eliminarParent.parentNode.removeChild(eliminarParent);
        }
        else{
            eliminarParent.parentNode.parentNode.removeChild(eliminarParent.parentNode);
            changeDisabledNota(false);
            addPorcentajeBtn.disabled = false;
        }
    })
}

Array.from(eliminarNotaBtnLista).forEach(eliminarBtn =>{
    eliminarNotaEvent(eliminarBtn);
})

Array.from(eliminarPorBtnLista).forEach(eliminarBtn =>{

    EliminarPorEvent(eliminarBtn);
});

function createLabelNotaObt(){
    const label = document.createElement("label");
    const notaObt = document.createElement("p");
    const inputNotaObt = document.createElement("input");

    notaObt.textContent = "Nota obtenida";

    label.setAttribute("id","labelNotaObt");
    label.setAttribute("class","notaObt inputNew");
    label.setAttribute("for","notaObt");
    inputNotaObt.setAttribute("type","number");
    inputNotaObt.setAttribute("id","notaObt");
    inputNotaObt.setAttribute("name","notaObt");
    inputNotaObt.setAttribute("placeholder","0");

    label.appendChild(notaObt);
    label.appendChild(inputNotaObt);
    
    return label

}

function createLabelNotaPos(){
    const label = document.createElement("label");
    const notaPos = document.createElement("p");
    const inputNotaPos = document.createElement("input");

    notaPos.textContent = "Nota Posible";

    label.setAttribute("id","labelNotaPos");
    label.setAttribute("class","notaPos inputNew");
    label.setAttribute("for","notaPos");
    inputNotaPos.setAttribute("type","number");
    inputNotaPos.setAttribute("id","notaPos");
    inputNotaPos.setAttribute("name","notaPos");
    inputNotaPos.setAttribute("placeholder","0");

    label.appendChild(notaPos);
    label.appendChild(inputNotaPos);
    
    return label

}

function createLabelNombreNota(){
    const label = document.createElement("label");
    const nombreNota = document.createElement("input");
    const pNombre = document.createElement("p");

    pNombre.textContent = "Nombre nota"

    label.setAttribute("class","inputNew nombreNota");
    label.setAttribute("for","nombreNota");
    nombreNota.setAttribute("type","text");
    nombreNota.setAttribute("placeholder","Portafolio");
    nombreNota.setAttribute("name","nombreNota");
    nombreNota.setAttribute("id","nombreNota");

    label.appendChild(pNombre);
    label.appendChild(nombreNota);

    return label
}

function createNota(){
    const nota = document.createElement("div");
    const form = document.createElement("form");
    const eliminarBtn = document.createElement("button");
    const notaObt = createLabelNotaObt();
    const notaPos = createLabelNotaPos();
    const nombreLabel = createLabelNombreNota();

    eliminarBtn.textContent = "Eliminar"
    eliminarNotaEvent(eliminarBtn);
    
    nota.setAttribute("class","nota");
    form.setAttribute("class","nota");
    eliminarBtn.setAttribute("class","eliminarBtn");

    form.appendChild(eliminarBtn);
    form.appendChild(nombreLabel);
    form.appendChild(notaObt);
    form.appendChild(notaPos);
    nota.appendChild(form);

    return nota
}

Array.from(addNotaList).forEach(addBtn =>{
    addBtn.addEventListener("click",()=>{
        const nota = createNota();
        const notasContainer = addBtn.closest(".notasContainer");

        notasContainer.insertBefore(nota,notasContainer.lastElementChild);

        addPorcentajeBtn.disabled = true;
        changeDisabledNota(true);

    })
})
