#!/bin/bash

# Función para sumar dos números
sumar() {
    resultado=$((num1 + num2))
    echo "El resultado de la suma es: $resultado"
}

# Función para restar dos números
restar() {
    resultado=$((num1 - num2))
    echo "El resultado de la resta es: $resultado"
}

# Función para multiplicar dos números
multiplicar() {
    resultado=$((num1 * num2))
    echo "El resultado de la multiplicación es: $resultado"
}

# Función para dividir dos números
dividir() {
    if [ $num2 -eq 0 ]; then
        echo "Error: No se puede dividir por cero."
    else
        resultado=$(echo "scale=2; $num1 / $num2" | bc)
        echo "El resultado de la división es: $resultado"
    fi
}

# Función principal del programa
main() {
    echo "Calculadora sencilla"
    echo "---------------------"
    read -p "Ingrese el primer número: " num1
    read -p "Ingrese el segundo número: " num2

    echo "Elija la operación que desea realizar:"
    echo "1. Sumar"
    echo "2. Restar"
    echo "3. Multiplicar"
    echo "4. Dividir"
    read -p "Seleccione una opción (1-4): " opcion

    case $opcion in
        1)
            sumar
            ;;
        2)
            restar
            ;;
        3)
            multiplicar
            ;;
        4)
            dividir
            ;;
        *)
            echo "Opción inválida. Por favor seleccione una opción válida del 1 al 4."
            ;;
    esac
}

# Llamar a la función principal del programa
main
