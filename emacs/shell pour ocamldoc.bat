@echo off
set HOME=%~dp0

path %HOME%ocaml\bin\;%HOME%ocaml\lib\stublibs;%PATH%

set OCAMLIB=%HOME%ocaml\lib
mkdir %HOME%doc 2>NUL

echo Pour generer votre ocamldoc, 
echo copier votre fichier source .ml dans le sous dossier "doc" 
echo (cree automatiquement par ce script - F5 pour rafraichir votre dossier)
echo puis
echo taper la commande suivante: 
echo ocamldoc -html -d ./doc votrefichier.ml

cmd /k