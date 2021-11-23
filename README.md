# dcm4chee-arc-5.24.2 Installation User Manual
This repo is for installation of dcm4che
#### Please follow the follwing steps to install
#### Step 1 
Download all files on your local system via follwing git command
```
git clone https://github.com/taimurkhan911/dcm4chee-arc-5.24.2-installation.git
```
#### Step 2 
**Install JDK 11**. 
You can find JDK **jdk-11.0.12_windows-x64_bin.exe** file in **dcm4chee-arc-5.24.2-installation** directory. run the exe file and complete the installation.

#### Step 3 
**Create database with name pacsdb**. 
and Import SQL file **pacsdb.sql** into it,You can find SQL file  **pacsdb.sql** file in **dcm4chee-arc-5.24.2-installation** directory.

#### Step 4 
**Install Apache DS 2**. 
You can find ApacheDS **apacheds-2.0.0.AM26.exe** file in **dcm4chee-arc-5.24.2-installation** directory. run the exe file and complete the installation.

#### Step 5 
**Install ApacheDirectoryStudio-2.0.0.v20210717-M17-win32.win32.x86_64**. 
You can find ApacheDS **Install ApacheDirectoryStudio-2.0.0.v20210717-M17-win32.win32.x86_64** file in **dcm4chee-arc-5.24.2-installation** directory. run the exe file and complete the installation. During instalaton. 

#### Step 6 
After inalling a Apache Directory Studio Open it. and create new connectoin with the following credentials 
```
Network Parameter:
    Hostname: localhost
    Port:     10389
Authentication Parameter:
    Bind DN or user: uid=admin,ou=system
    Bind password:   secret
```
#### Step 7 

Import LDAP schema files for Apache DS by right click on the connection you created in step 6. Then click on **import**. Then select **LDIF Import**.
A new window will be open. import the following files one by one into it.

```
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/apacheds/dicom.ldif
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/apacheds/dcm4che.ldif
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/apacheds/dcm4chee-archive.ldif
dcm4chee-arc-5.24.2-installation\dcm4chee-arc-5.24.2-mysql/ldap/apacheds/dcm4chee-archive-ui.ldif
```
#### Step 7 
One may modify the default Directory Base DN dc=example,dc=com by changing the value of attribute

ads-partitionsuffix: dc=dcm4che,dc=org`

of object

ou=config
+ ads-directoryServiceId=default
  + ou=partitions
      ads-partitionId=example

to ads-partitionId=dcm4che
![Screenshot](/screenshots/apache-directory-configration)
![Please look at the image how to change value in apache directory](screenshots/change-apache-directory-values.png)

