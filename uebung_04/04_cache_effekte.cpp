// Einbinden von Bibliotheken aehnlich zu "using" oder "import" in Julia 
#include <iostream>   
#include <sys/time.h> 
#include <math.h>     

// das Hauptprogramm
int main() {
    
    // Anzahl der Datenpunkte
    int steps = 18;

    for (int i = 0; i < steps; ++i) {
	// Groesse des Arrays
	int kbytes = int(pow(2., double(i)));
	int array_size = kbytes * 1024;
	
	// Array initialisieren, aequivalent zu zeros(array_size)
	unsigned int * array = new unsigned int[array_size];
	for (int j  = 0; j < array_size; ++j) array[j] = 0;

	// Messung starten 
	clock_t start = clock();	

	// Eigentlich eine Schleife, muss aus praktischen Gruenden 
	// aufgeteilt werden
	for (int k = 0; k < (1024 * 4 - 1); ++k)
	    for(int j = 0; j < 1024 * 1024; ++j) 
		++array[(j * 16) % array_size];
	clock_t elapsed = clock() - start;	    
	    
	// Array loeschen, geschieht in Julia automatisch
	delete [] array;

	// Daten ausgeben
	std::cout << kbytes << " " << elapsed << std::endl;
    }
}
