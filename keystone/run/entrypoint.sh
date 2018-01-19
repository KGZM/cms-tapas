#/bin/env bash
cd /home/node/
echo "TAKING ACTION!"
if ! [ -e "app/creation.lock" ] ;
then
    echo "Installing yo and keystone!"
    npm install yo generator-keystone yeoman-gen-run
    cd app
    echo "Generating keystone app"
    `npm bin`/yo-gen-run --name keystone --config /home/node/run/keystone-config.json
    if [ -e "package.json" ] ;
    then
        npm install
        touch creation.lock
        exec npm start
    fi
else
    cd app
    npm install
    exec npm start
fi
