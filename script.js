
if (document.getElementById('btn-picture') !== null)
document.getElementById('btn-picture').addEventListener('click', function (event) {
    event.preventDefault();
    var input = document.createElement('input');
    input.type = 'file';
    input.accept = 'image/*';
    input.click();
    input.addEventListener('change', function (event) {
        var file = event.target.files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            var img = document.createElement('img');
            img.width = 200;
            img.src = e.target.result;
            img.classList.add('rounded', 'mx-auto', 'd-block'); // Ajoute les classes
            document.getElementById('btn-container').appendChild(img);
        };
        if (file) {
            reader.readAsDataURL(file);
            document.getElementById('btn-picture').style.display = 'none';
        }
    });
});

if (document.getElementById('btnNext') !== null)
document.getElementById('btnNext').addEventListener('click', function (event) {
    event.preventDefault();
    window.location.href = 'createProfilePage2.html';
});


centreInteret = {
    "Sport": [
        "Football",
        "Basketball",
        "Baseball",
        "Soccer",
        "Hockey",
        "Tennis",
        "Golf",
        "Swimming",
        "Track",
        "Volleyball"
    ],
    "Music": [
        "Rock",
        "Country",
        "Rap",
        "Classical",
        "Jazz",
        "Blues",
        "Reggae",
        "Pop",
        "Techno",
        "Metal"
    ],
    "Food": [
        "Pizza",
        "Hamburger",
        "Hot Dog",
        "Pasta",
        "Salad",
        "Steak",
        "Chicken",
        "Fish",
        "Tacos",
        "Sushi"
    ]
}


for (let key in centreInteret) {
    let div = document.createElement('div');
    div.classList.add('grid', 'mb-4', 'col-12');
  
    let h4 = document.createElement('h4');
    h4.textContent = key;
    div.appendChild(h4);
  
    for (let value of centreInteret[key]) {
      let button = document.createElement('button');
      button.classList.add('btn', 'btn-outline-primary', 'btn-block', 'mx-3', 'my-2', 'col-12','col-md-3', 'col-lg-2', 'col-xl-1');
      button.textContent = value;
      div.appendChild(button);
    }
    document.getElementById('interests').appendChild(div);
  }
  

// Rend les bouton creer un profil actif si un centre d'interet est selectionné

var buttons = document.getElementsByClassName('btn');

for (var i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener('click', function (event) {
        if (this.classList.contains('btn-outline-primary')) {
            this.classList.replace('btn-outline-primary', 'btn-primary');
        } else {
            this.classList.replace('btn-primary', 'btn-outline-primary');
        }
    });
}


if (document.getElementById('btnFinished') !== null)
document.getElementById('btnFinished').addEventListener('click', function (event) {
    event.preventDefault();
    window.location.href = 'ProfilePage.html';
});


