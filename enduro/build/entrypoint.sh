#/bin/env bash
cd /home/node/
if ! [ -e "app/creation.lock" ] ;
then
    npm install enduro
    cd app
    `npm bin`/enduro create my_cool_site
    mv my_cool_site/* ./
    rmdir my_cool_site
    npm install
    touch creation.lock
    `npm bin`/enduro admin add admin admin
    exec `npm bin`/enduro dev
else
    cd app
    npm install
    exec `npm bin`/enduro dev
fi
