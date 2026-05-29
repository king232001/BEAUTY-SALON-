# Images qui ne s'affichent pas sur GitHub — solution simple

## Cause la plus fréquente

Le dossier **`assets`** (avec les photos) n'a pas été envoyé sur GitHub, ou seulement en partie.

## Vérifier sur GitHub

1. Ouvre ton dépôt sur github.com
2. Tu dois voir cette structure :

```
beauty-salon/
├── index.html
├── styles.css
├── script.js
├── .nojekyll
└── assets/
    ├── logo.png
    └── images/
        ├── hero.jpg
        ├── about-team.jpg
        ├── service-women-hair.jpg
        └── ... (autres .jpg)
```

3. Clique sur **`assets`** → **`images`** : il doit y avoir **plusieurs fichiers .jpg**

Si le dossier `images` est vide ou absent → c'est normal que le site n'affiche pas les photos.

## Corriger (sans commande)

1. Sur GitHub, ouvre ton dépôt
2. Clique **Add file** → **Upload files**
3. Sur ton PC, ouvre : `C:\Users\israe\Projets\salon-de-coiffure\assets`
4. **Glisse tout le dossier `assets`** (ou au minimum le dossier `images` + `logo.png`)
5. Si GitHub demande de remplacer → accepte
6. **Commit changes**
7. Attends 2 minutes et rafraîchis ton site (Ctrl + F5)

## Mettre à jour index.html (correction des chemins)

Si tu as modifié `index.html` sur ton PC après la mise en ligne :

1. GitHub → ton fichier **index.html** → icône **crayon** (Edit)
2. Remplace tout le contenu par la version de ton PC
3. **Commit changes**

Ou supprime l'ancien `index.html` et re-upload le nouveau.

## Tester

Ouvre dans le navigateur (remplace par ton pseudo et nom de dépôt) :

`https://TON-PSEUDO.github.io/beauty-salon/assets/logo.png`

- Si le **logo s'affiche** → les images sont bien en ligne
- Si **404** → le dossier `assets` n'est pas au bon endroit sur GitHub
