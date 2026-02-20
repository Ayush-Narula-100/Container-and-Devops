Download Virtual Box from [here](https://www.virtualbox.org/wiki/Downloads)


Download Vagrant from [here](https://developer.hashicorp.com/vagrant/install)
![Download Vagrant](./Images/1.png)


To verify the installation we will check the version via following command
```
vagrant --version
```
![Version Check](./Images/2.png)


Initialize Vagrant with Ubuntu box:
```
vagrant init hashicorp/bionic64
```
![Initialize](./Images/3.png)


Start the VM:
```
vagrant up
```
![Vagrant up](./Images/4.png)


Access the VM:
```
vagrant ssh
```
![ssh](./Images/5.png)


Step 4: Install Nginx inside VM
```
sudo apt update
sudo apt install -y nginx
sudo systemctl start nginx
```


Verify Nginx
```
curl localhost
``` 
![Verify Nginx](./Images/6.png)


Utilization Matrix In Running State
![Running State Matrix](./Images/7.png)


Stop VM
```
vagrant halt
```
![Halt Vagrant](./Images/8.png)


Utilization Matrix In Stop State
![Stop State Matrix](./Images/9.png)


Remove VM
```
vagrant destroy
```
![Vagrant Deleted](./Images/10.png)





kf
