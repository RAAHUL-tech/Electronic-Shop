/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let suggestions = [
    "Apple",
    "Apple laptop",
    "Apple mobile",
    "Apple ear buds",
    "Apple Mac book",
    "Apple iphone",
    "Apple smart watch",
    "Apple phone",
    "Refrifgerator",
    "Mobile",
    "Smart watch",
    "Earbuds",
    "Bluetooth headset",
    "Bluetooth speaker",
    "Bluetooth",
    "Watch",
    "Samsung",
    "Samsung Mobile",
    "Samsung M series",
    "Samasung A series",
    "Samsung watch",
    "Galaxy watch",
    "Galaxy mobile",
    "Sony ear pods",
    "Song bluetooth",
    "Poco",
    "Poco phone",
    "Redmi phone",
    "Realme watch",
    "Realme phone",
    "Oppo phone",
    "Oppo mobile",
    "Vivo mobile",
    "Pendrive",
    "Samsung pendrive",
    "Song pendrive",
    "Memory card",
    "64 gb memory card",
    "128 gb memory card",
    "512 gb memory card",
    "64 gb pendrive",
    "128 gb pendrive",
    "512 gb penderive",
    "32 gb pendrive",
    "16 gb pendrive",
    "8 gb pendrive"
];
const searchWrapper = document.querySelector(".search-input");
const inputBox = searchWrapper.querySelector("input");
const suggBox = searchWrapper.querySelector(".autocom-box");
const icon = searchWrapper.querySelector(".icon");
let linkTag = searchWrapper.querySelector("a");
let webLink;
// if user press any key and release
inputBox.onkeyup = (e)=>{
    let userData = e.target.value; //user enetered data
    let emptyArray = [];
    if(userData){
        icon.onclick = ()=>{
            webLink = `https://www.google.com/search?q=${userData}`;
            linkTag.setAttribute("href", webLink);
            linkTag.click();
        };
        emptyArray = suggestions.filter((data)=>{
            //filtering array value and user characters to lowercase and return only those words which are start with user enetered chars
            return data.toLocaleLowerCase().startsWith(userData.toLocaleLowerCase());
        });
        emptyArray = emptyArray.map((data)=>{
            // passing return data inside li tag
            return data = `<li>${data}</li>`;
        });
        searchWrapper.classList.add("active"); //show autocomplete box
        showSuggestions(emptyArray);
        let allList = suggBox.querySelectorAll("li");
        for (let i = 0; i < allList.length; i++) {
            //adding onclick attribute in all li tag
            allList[i].setAttribute("onclick", "select(this)");
        }
    }else{
        searchWrapper.classList.remove("active"); //hide autocomplete box
    }
};
function select(element){
    let selectData = element.textContent;
    inputBox.value = selectData;
    icon.onclick = ()=>{
        webLink = `https://www.google.com/search?q=${selectData}`;
        linkTag.setAttribute("href", webLink);
        linkTag.click();
    };
    searchWrapper.classList.remove("active");
}
function showSuggestions(list){
    let listData;
    if(!list.length){
        userValue = inputBox.value;
        listData = `<li>${userValue}</li>`;
    }else{
      listData = list.join('');
    }
    suggBox.innerHTML = listData;
}
 