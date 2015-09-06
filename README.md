# FMS
Freight Management Simplified! 
![GitHub Logo](https://cloud.githubusercontent.com/assets/388121/9705516/9310600e-54e4-11e5-8273-aa807b70d333.png)


<h3>MSC EAD CS - Group 02</h3>
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
  * `./mongod`

* Make changes to the app configuration file if needed: `src/main/resources/application.properties` (uses the default mongo port: 27017)

* To run the App either could use the pre-configured maven jetty server by executing following command:
  * `mvn jetty:run` (now the app will be started at: [http://localhost:8099/FMS/](http://localhost:8099/FMS/))
* Or else Copy the `target/FMS.war` to the installed `apache-tomcat-7.x.x/webapps` folder & start the tomcat by running 
  * `./bin/startup.sh`

* Running the Vessel Simulator: open the `Colombo Rider` project resides in `vessel_simulator` folder in Eclipse IDE and run the `ColomboRider.java` - Location updates will be sent to the webapp in background.

##Demonstration
* Test backoffice staff user will be created- username: staff1@msc.ship | password: 123
* The vessel coordinates updating is mocked through an application that mentioned earlier (Colombo Rider) which uses the `/ajax/updateVesselLocation` web service API call.
* System Log file location: `User-Home/fms.log`










