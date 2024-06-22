#!/bin/bash

# Función para obtener el género de un nombre usando genderize.io
genero_nombre() {
    nombre="$1"
    url="https://api.genderize.io/?name=$nombre"

    # Realizar la solicitud GET a la API y manejar la respuesta
    response=$(curl -s "$url")

    # Extraer el género probable del nombre
    gender=$(echo "$response" | jq -r '.gender')
    probability=$(echo "$response" | jq -r '.probability')

    if [ "$gender" == "null" ]; then
        echo "No se pudo determinar el género para el nombre '$nombre'."
    else
        echo "El género probable del nombre '$nombre' es '$gender' con una probabilidad de $probability%."
    fi
}

# Ejemplo de uso
echo "Ingrese un nombre para determinar su género:"
read nombre
genero_nombre "$nombre"
