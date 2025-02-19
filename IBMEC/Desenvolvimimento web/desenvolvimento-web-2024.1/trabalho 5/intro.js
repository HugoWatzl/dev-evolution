// var
var x = 10;
console.log("Before Block: ", x); 
{
    var x = 20;
    console.log("Inside Block: ", x); 
}
console.log("After Block: ", x); 

// let
let y = 10;
console.log("Before Block: ", y); 
{
    let y = 20;
    console.log("Inside Block: ", y); 
}
console.log("After Block: ", y);


//const
const z = 10;
console.log("Before Block: ", z); 
{
    const z = 20;
    console.log("Inside Block: ", z); 
}
console.log("After Block: ", z); 

// Criando um array
let array = [1, 2, 3, 4, 5];

// Tamanho 
console.log("Tamanho do array:", array.length);

// Recuperando um elemento
console.log("Elemento na posição 2:", array[2]);

// Inclusão de elemento
array[5] = 6;
console.log("Array após inclusão:", array);

// Push 
array.push(7);
console.log("Array após push:", array);

// Pop 
let removedElement = array.pop();
console.log("Elemento removido:", removedElement);
console.log("Array após pop:", array);

// Shift 
let shiftedElement = array.shift();
console.log("Elemento shiftado:", shiftedElement);
console.log("Array após shift:", array);

// Unshift 
array.unshift(0);
console.log("Array após unshift:", array);
