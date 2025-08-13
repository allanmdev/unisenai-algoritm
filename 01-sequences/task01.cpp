#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    float lag, land, value, area, price;

    
    cout << "Digite a largura do terreno: ";
    cin >> lag;
    cout << "Digite o comprimento do terreno: ";
    cin >> land;
    cout << "Digite o valor do metro quadrado: ";
    cin >> value;

    area = lag * land;
    price = area * value;
    
    cout << fixed << setprecision(2);
    cout << "A área do terreno é: " << area << " metros quadrados." << endl;
    cout << "O preço do terreno é: " << price << " reais." << endl;

    return 0;
}