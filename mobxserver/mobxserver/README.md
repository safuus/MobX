1. please create a dev.properties under settings/override. you may need create override directory if it does not exist yet. so we can define our own development environemnt variables.

2. Please follow the maven tips to manually install jta

3. after you set up the dev.properties. u can start server like 

mvn exec:java -Dexec.mainClass="com.mobx.server.App"

it runs the server in concole. If u dont see "Listening on port 9088", probably the server is already running, u can kill it first then run it again

