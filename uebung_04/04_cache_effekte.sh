#!/bin/bash
echo -n "Kompiliere Programm ... "
g++ -O0 04_cache_effekte.cpp -o 04_cache_effekte
echo "fertig"
echo -n "Starte Programm ... "
./04_cache_effekte > 04_cache_effekte.csv
echo "fertig"
rm 04_cache_effekte