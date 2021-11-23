# dcm4chee-arc-5.24.2 Installation User Manual
This repo is for installation of dcm4che
#### Please follow the follwing steps to install
### Step 1 
Download all files on your local system via follwing git command
```
git clone https://github.com/taimurkhan911/dcm4chee-arc-5.24.2-installation.git
```
### Step 2 
**Install JDK 11**. 
You can find JDK **jdk-11.0.12_windows-x64_bin.exe** file in **dcm4chee-arc-5.24.2-installation** directory. run the exe file and complete the installation.

### Step 3 
**Create database with name pacsdb**. 
and Import SQL file **pacsdb.sql** into it,You can find SQL file  **pacsdb.sql** file in **dcm4chee-arc-5.24.2-installation** directory.
You may need to install jdbc driver mysql. you can find **mysql-installer-web-community-8.0.27.1.msi** in **dcm4chee-arc-5.24.2-installation**

### Step 4 
**Install Apache DS 2**. 
You can find ApacheDS **apacheds-2.0.0.AM26.exe** file in **dcm4chee-arc-5.24.2-installation** directory. run the exe file and complete the installation.

### Step 5 
**Install ApacheDirectoryStudio-2.0.0.v20210717-M17-win32.win32.x86_64**. 
You can find ApacheDS **Install ApacheDirectoryStudio-2.0.0.v20210717-M17-win32.win32.x86_64** file in **dcm4chee-arc-5.24.2-installation** directory. run the exe file and complete the installation. During instalaton. 

### Step 6 
After inatlling a Apache Directory Studio Open it. and create new connectoin with the following credentials 
```
Network Parameter:
    Hostname: localhost
    Port:     10389
Authentication Parameter:
    Bind DN or user: uid=admin,ou=system
    Bind password:   secret
```
### Step 7 

Import LDAP schema files for Apache DS by right click on the connection you created in step 6. Then click on **import**. Then select **LDIF Import**.
A new window will be open. import the following files one by one into it.

```
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/apacheds/dicom.ldif
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/apacheds/dcm4che.ldif
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/apacheds/dcm4chee-archive.ldif
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/apacheds/dcm4chee-archive-ui.ldif
```
### Step 8 
One may modify the default Directory Base DN dc=example,dc=com by changing the value of attribute

ads-partitionsuffix: dc=dcm4che,dc=org`

of object
```
ou=config
+ ads-directoryServiceId=default
  + ou=partitions
      ads-partitionId=example

to ads-partitionId=dcm4che
```
## Please look at image How to add values##
![Screenshot](/screenshots/apache-directory-configration.png)

### Step 9 
**Create new user credentials the following data**
![Screenshot](/screenshots/apache-directory-add-new-credentials-step-1.png)
![Screenshot](/screenshots/apache-directory-add-new-credentials-step-2.png)
![Screenshot](/screenshots/apache-directory-add-new-credentials-step-3.png)
![Screenshot](/screenshots/apache-directory-add-new-credentials-step-4.png)
![Screenshot](/screenshots/apache-directory-add-new-credentials-step-5.png)



### Step 10 
**After step 9 is done. Create new connection with the following parameters**

```
Network Parameter:
    Hostname: localhost
    Port:     10389
Authentication Parameter:
    Bind DN or user: cn=admin,dc=dcm4che,dc=org
    Bind password:   secret
Browser Options:
    Base DN: dc=dcm4che,dc=org
```

### Step 11 
Now import the following LDIF files via **Apache Directory Studio** into the connection you have created earlier in **step 6**
```
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/init-baseDN.ldif
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/init-config.ldif
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/default-config.ldif
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/default-ui-config.ldif
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/add-vendor-data.ldif
```

### Step 12 
Now Copy **wildfly** directory from **dcm4chee-arc-5.24.2-installation** and place it in **C:**
Then change the database connection in C:\wildfly\standalone\configuration\dcm4chee-arc.xml in the following lines if req
```
<datasource jndi-name="java:/PacsDS" pool-name="PacsDS" statistics-enabled="true">
                    <connection-url>jdbc:mysql://localhost:3306/sandbox_pacsdb</connection-url>
                    <driver>mysql</driver>
                    <security>
                        <user-name>root</user-name>
                    </security>
</datasource>
```
### Step 13 
 run the follwing command inside wildfly\bin\
```
>C:\wildfly\bin\standalone.bat -c dcm4chee-arc.xml [Windows]
```
After command completed follow the following link 
(http://127.0.0.1:9990/console/index.html)

(http://localhost:8080/dcm4chee-arc/ui2)

### Step 14 
http://127.0.0.1:9990/console/index.html#deployments
goto the above page and import the following 2 files in it.

dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql\deploy

### Step 15
Install ApacheTomCat and oviyam2.
- Run the dcm4chee-arc-5.24.2-installation\apache-tomcat-8.5.71.exe to install the TomCat
- Copy all files inside **dcm4chee-arc-5.24.2-installation\Oviyam-2.8.1-bin\tomcat** and paste inside C:\Program Files\Apache Software Foundation\Tomcat 8.5\lib 
- Copy file inside **dcm4chee-arc-5.24.2-installation\Oviyam-2.8.1-bin\Oviyam-2.8.1-bin\oviyam2.war** and paste inside C:\Program Files\Apache Software Foundation\Tomcat 8.5\webapps
-  Copy file tomcat-users.xml and server.xml **dcm4chee-arc-5.24.2-installation\Oviyam-2.8.1-bin** and  and paste inside C:\Program Files\Apache Software Foundation\Tomcat 8.5\conf


.![image](/screenshots/oviyam2-config.png)


