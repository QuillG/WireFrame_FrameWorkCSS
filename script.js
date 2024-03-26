
//json centre d'interet dqns le dossier src/data/centresInteret.json

// Récupération des centres d'intérêt
//creation de card boostrap avec un grid de 3 colonnes


fetch('/centreInteret.json')
    .then(response => response.json())
    .then(data => {
        var container = document.getElementById('interests');
        data.forEach(function (interest) {
            var card = document.createElement('div');
            card.classList.add('card', 'mb-3');
            var img = document.createElement('img');
            img.src = interest.image;
            img.classList.add('card-img-top');
            var cardBody = document.createElement('div');
            cardBody.classList.add('card-body');
            var title = document.createElement('h5');
            title.classList.add('card-title');
            title.textContent = interest.title;
            var text = document.createElement('p');
            text.classList.add('card-text');
            text.textContent = interest.description;
            var btn = document.createElement('button');
            btn.classList.add('btn', 'btn-primary');
            btn.textContent = 'Choisir';
            btn.addEventListener('click', function () {
                var selected = document.getElementById('selected');
                var selectedInterests = selected.value.split(',');
                if (selectedInterests.indexOf(interest.title) === -1) {
                    selectedInterests.push(interest.title);
                    selected.value = selectedInterests.join(',');
                }
            });
            cardBody.appendChild(title);
            cardBody.appendChild(text);
            cardBody.appendChild(btn);
            card.appendChild(img);
            card.appendChild(cardBody);
            container.appendChild(card);
        });
    });


// Récupération des centres d'intérêt et creation de cases 


// Récupération du bouton d'ajout de photo
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

// Récupération du bouton Suivant
if (document.getElementById('btnNext') !== null)
document.getElementById('btnNext').addEventListener('click', function (event) {
    event.preventDefault();
    window.location.href = 'createProfilePage2.html';
});

// Récupération des centres d'intérêt

if (document.getElementById('interests') !== null)
console.log("coucou");


