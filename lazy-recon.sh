# !/bin/bash

URL=$1

echo "
██╗      █████╗ ███████╗██╗   ██╗    ██████╗ ███████╗ ██████╗ ██████╗ ███╗   ██╗
██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝    ██╔══██╗██╔════╝██╔════╝██╔═══██╗████╗  ██║
██║     ███████║  ███╔╝  ╚████╔╝     ██████╔╝█████╗  ██║     ██║   ██║██╔██╗ ██║
██║     ██╔══██║ ███╔╝    ╚██╔╝      ██╔══██╗██╔══╝  ██║     ██║   ██║██║╚██╗██║
███████╗██║  ██║███████╗   ██║       ██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║
╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝       ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝                                             
"



if [ $1 == " " ];then
        echo "Please enter a URL"

else
        if [ ! -d = "$URL" ];then
                mkdir $URL
        fi

        if [ ! -d = "$URL/recon" ];then
                mkdir $URL/recon
        fi
fi

echo "# enumerating subdomains..."

assetfinder $URL --subs-only >> $URL/recon/subs.txt

echo "# Identifying live hosts..."

cat $URL/recon/subs.txt | sort -u | httprobe --prefer-https >> $URL/recon/livehost.txt

echo "# enumerating URL archives..."

gau $URL >> urls.txt

echo "greping api endpoints from archives..."
cat urls.txt | grep "/api/" >> api.txt
