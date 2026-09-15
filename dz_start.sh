#!/bin/bash

_f_clear() {
	echo -e "\e[43;30m[ sh ] $(date "+%Y-%m-%d %H:%M:%S") excluindo target...\e[0m"
	./mvnw clean

	if [ $? -eq 0 ]; then
		echo -e "\e[43;30m[ sh ] $(date "+%Y-%m-%d %H:%M:%S") : exclusãp: ok.\e[0m"
	else
		echo -e "\e[43;30m[ sh ] $(date "+%Y-%m-%d %H:%M:%S") : exclusãp: falhou.\e[0m"
	fi
}

_f_compile() {
	echo -e "\e[43;30m[ sh ] $(date "+%Y-%m-%d %H:%M:%S") : compilando projeto...\e[0m"
	./mvnw package

	if [ $? -eq 0 ]; then
		echo -e "\e[43;30m[ sh ] $(date "+%Y-%m-%d %H:%M:%S") : compilacao: ok.\e[0m"
	else
		echo -e "\e[43;30m[ sh ] $(date "+%Y-%m-%d %H:%M:%S") : compilacao: falhou.\e[0m"
	fi
}

_f_run() {
	echo -e "\e[43;30m[ sh ] $(date "+%Y-%m-%d %H:%M:%S") : iniciando serviço...\e[0m"
	java -jar target/learning-0.0.1-SNAPSHOT.jar
}

_clear=0
_compile=0
_run=0

for arg in "$@"; do
    if [ "$arg" = "-clear" ]; then
        _clear=1
    elif [ "$arg" = "-compile" ]; then
        _compile=1
    elif [ "$arg" = "-run" ]; then
        _run=1
    else
        # Argumento inválido encontrado: zera tudo e para de ler
        _clear=0
        _compile=0
        _run=0
        break
    fi
done

if [ "$_clear" -eq 1 ]; then
    _f_clear
fi

if [ "$_compile" -eq 1 ]; then
    _f_compile
fi

if [ "$_run" -eq 1 ]; then
    _f_run
fi

if [ "$_clear" -eq 0 ] && [ "$_compile" -eq 0 ] && [ "$_run" -eq 0 ]; then
    echo "Uso correto: $0 {-clear|-compile|-run}"
fi
