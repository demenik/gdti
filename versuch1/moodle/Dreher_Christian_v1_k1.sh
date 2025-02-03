#!/bin/bash
# stellen wir uns vor wir haben /tiprak/gdti/versuch1 kopiert
cd ~/gdti/versuch1

# Aufgabe 1
echo
echo "Aufgabe 1"
echo
echo "1 >> meine_erste_Datei.txt"
echo 1 >> meine_erste_Datei.txt
echo 2 >> meine_erste_Datei.txt
echo 3 >> meine_erste_Datei.txt
echo "rm meine_erste_Datei.txt"
rm meine_erste_Datei.txt

# Aufgabe 2
echo
echo "Aufgabe 2"
echo
echo "cat sortiere_mich.txt"
cat sortiere_mich.txt
echo "(oder gedit sortiere_mich.txt)"
# gedit sortiere_mich.txt
echo "(oder nano sortiere_mich.txt)"
# nano sortiere_mich.txt

# Aufgabe 3
echo
echo "Aufgabe 3"
echo
echo "wc --bytes sortiere_mich.txt"
wc --bytes sortiere_mich.txt
echo "wc --words sortiere_mich.txt"
wc --words sortiere_mich.txt
echo "wc --lines sortiere_mich.txt"
wc --lines sortiere_mich.txt
echo 'cat sortiere_mich.txt | grep -i "absicht"'
cat sortiere_mich.txt | grep -i "absicht"

# Aufgabe 4
echo
echo "Aufgabe 4"
echo
echo "cat sortiert.txt | head -n 5"
cat sortiert.txt | head -n 5
echo "cat sortiert.txt | tail -n 5"
cat sortiert.txt | tail -n 5
echo "cat sortiert.txt | tail -n +6"
cat sortiert.txt | tail -n +6
echo "cat sortiert.txt | head -n -5"
cat sortiert.txt | head -n -5
