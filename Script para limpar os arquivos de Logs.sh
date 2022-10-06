#Script para limpar os arquivos de Logs
#! /bin/sh
cd /var/log
#limpa arquivos compactados
rm *.gz
#Cria lista de todos os arquivos de log que serao limpos
lista=`find -type f`
#Executa a limpeza dos logs
for i in $lista
do
echo -n >$i &>/dev/null
echo Zerando arquivo $i...
done
truncate *.log --size 0
#Para configurar o sistema de forma que só armazene os últimos 30 dias de log
journalctl --vacuum-time=30d
#Por tamanho: journalctl --vacuum-size=200M
# sudo du /var/* -hs
find -maxdepth 1 -ctime +7 -exec rm -Rf {} \;
#Find -maxdepth 1 -ctime +7 -exec rm -Rf {} \;
echo Limpeza dos arquivos de log concluída!