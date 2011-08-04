1. to override default.properties, you need define a dev.properties under settings/override directory then appContext will automatically pick it up
   for example my local dev.properties is like
   
jdbc.driver.className=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://192.168.1.17:3306/mbox
jdbc.username=mobx
jdbc.password=m06x$$*l
jdbc.hibernate.dialect=org.hibernate.dialect.MySQLDialect

