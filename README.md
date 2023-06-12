# LyghtLiving

## Installation

1) Backup your wordpress wp-content folder and remove the following folders:
- themes
- uploads
- plugins
- mu-plugins

2) Run these commands inside your root wordpress folder:
```
git init
git remote add origin https://<your-github-token>@github.com/ground-creative/lyghtliving.git
git pull
git checkout main -f
git branch --set-upstream-to origin/main
```

## Installation (Docker)

1) Run these commands inside your docker installation folder:
```
git init
git remote add origin https://<your-github-token>@github.com/ground-creative/lyghtliving.git
git pull
git checkout main -f
git branch --set-upstream-to origin/main
```

