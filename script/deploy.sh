#!/usr/bin/env bash
# Linux deploy avenmes linux server
#*************************************************************
param=$1
len=$(xset q | grep -Po 'LED mask:\s*\K\d+')

# Check installed software
# POSTGRESQL
if [ "which psql" ]; then
    if [[ "$param" == "-config" ]] &&  [[ "$2" != "0" ]]; then
    echo "PostgreSQL exist..."
    fi
else
    sudo apt-get install postgresql-10 postgresql-server-dev-10 postgresql-client-10 postgresql-contrib libpq-dev
fi
# POSTGRESQL END

# JAVA
if [ "which java" ]; then
    if [[ "$param" == "-config" ]] &&  [[ "$2" != "0" ]]; then
    echo "Java exist..."
    fi
else
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java8-installer

    export PATH="$PATH:$JAVA_HOME/bin:$JRE_HOME/bin"
    export JAVA_HOME=/usr/lib/jvm/java-8-oracle
    export JDK_HOME=/usr/lib/jvm/java-8-oracle
    export JRE_HOME=/usr/lib/jvm/java-8-oracle/jre
fi
# JAVA END

# package project
mypackage=`pwd`; cd ~; package=`pwd`; cd $mypackage;

if [ -e "$package/avenmes/" ]; then
        if [[ "$param" == "-config" ]] ||  [[ "$2" == "0" ]]; then
        echo "Package avenmes exist..."
        fi
else
        mkdir ~/avenmes
fi

if [ -e "$package/avenmes/avenmes-1.0-SNAPSHOT.jar" ]; then
        if [[ "$param" == "-config" ]] || [[ "$2" == "0" ]]; then
        echo "File avenmes-1.0-SNAPSHOT.jar exist..."
        fi
else
        echo 'avenmes-1.0-SNAPSHOT.jar > copy files...'
        cp target/avenmes-1.0-SNAPSHOT.jar $package/avenmes/
        ls ~/avenmes/
fi

if [ -e "$package/avenmes/deploy.sh" ]; then
        if [[ "$param" == "-config" ]] || [[ "$2" == "0" ]]; then
        echo "File deploy.sh exist..."
        fi
else
        echo 'deploy.sh > copy files...'
        cp script/deploy.sh ~/avenmes/
        chmod +x ~/avenmes/deploy_AWS.sh
        ls ~/avenmes/
fi

if [ -e "$package/avenmes/log.txt" ]; then
        if [[ "$param" == "-config" ]] || [[ "$2" == "0" ]]; then
        echo "File log.txt exist..."
        fi
else
        echo 'new files log.txt...'
        touch ~/avenmes/log.txt
        ls ~/avenmes/
fi
#*************************************************************

# UPDATE
if [[ "$param" == "-update" ]] || [[ "$param" == "-up" ]]; then
    echo "UPDATE..."
    rm -rf ~/avenmes
    bash script/deploy.sh -config 0
fi
# PACKAGE END

# PACKAGE
if [[ "$param" == "-package" ]]; then
    mvn clean package
fi
# PACKAGE END

# START
if [[ "$param" == "-start" ]]; then
    echo "Start server..."
    mvn clean package
    nohup java -jar avenmes-1.0-SNAPSHOT.jar > log.txt &
fi
# START END

# STOP
if [[ "$param" == "-stop" ]]; then
    echo "Stop server..."
    pgrep java | xargs kill -9
fi
# STOP END

# RESTART
if [[ "$param" == "-restart" ]]; then
    echo "Restart server..."
    pgrep java | xargs kill -9
    nohup java -jar avenmes-1.0-SNAPSHOT.jar > log.txt &
fi
# RESTART END

# STATUS
if [[ "$param" == "-status" ]]; then
    tail -f log.txt
fi
# STATUS END

# HELP
if [[ "$param" == "" ]] || [[  "$param" == "-h"  ]] || [[  "$param" == "-help"  ]]; then
    echo "HELPER";
    echo "Parameters:"

    if [[ $len == "00000002" ]]; then
        echo "  ./$0 -start       | Start server"
        echo "  ./$0 -stop        | Stop server"
        echo "  ./$0 -restart     | Restart server"
        echo "  ./$0 -status      | Status server"; echo
        echo "  ./$0 -package     | Maven package project"
        echo "  ./$0 -update/-up  | Re build project"; echo
        echo "  ./$0 -config      | Check installed software"
        echo "  ./$0 -h           | Help"
        echo "  ./$0 -help        | Help"
    fi

    if [[ $len == "00001006" ]]; then
        echo "  ./$0 -start       | Запуск сервера"
        echo "  ./$0 -stop        | Остановка сервера"
        echo "  ./$0 -restart     | Перезагрузка сервера"
        echo "  ./$0 -status      | Статус сервера"; echo
        echo "  ./$0 -package     | Собрать проект"
        echo "  ./$0 -update/-up  | Пере собрать проект"; echo
        echo "  ./$0 -config      | Проверка установленого ПО"
        echo "  ./$0 -h           | Помошь"
        echo "  ./$0 -help        | Помошь"
    fi

fi
# HELP END
echo 'Bye'
exit 0;