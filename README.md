# MSC EAD CS
<h3>Group 02</h3>
<ul>
<li>Dasun Hegoda (MS14920646)</li>
<li>Varuna Lekamwasam (MS14921254)</li>
<li>Harsha Hapuarachchi (MS14921322)</li>
<li>Harsha Siriwardena (MS14920264)</li>
</ul>
<h3>Software Requirements</h3>
<ul>
<li>Java 1.7</li>
<li>Maven 3.2</li>
<li>Tomcat 7.0</li>
<li>MongoDB 3.0</li>
</ul>


##Deployment
* Building the system - Navigate to the project directory & execute the following maven command.
  * `mvn clean install`

* Start Mongo daemon on the server ([guide](http://docs.mongodb.org/master/tutorial/manage-mongodb-processes/))
`./mongod`

* Make changes to the app configuration file if needed: src/main/resources/application.properties (uses the default mongo port: 27017)

* To run the App either could use the pre-configured maven jetty server by executing following command: `mvn jetty:run` (now the app will be started at http://localhost:8099/FMS)
Copy the target/FMS.war to the installed tomcatHome/webapps folder & start the tomcat by running ./bin/startup.sh

##Demonstration
* Test backoffice staff user will be created- username: staff1@msc.ship | password: 123
* The vessel coordinates updating is mocked through an application which uses the */ajax/updateVesselLocation* web service API call. 
* System Log file location: User-Home/fms.log










