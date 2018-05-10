# centos72x64-mate-python-devel-g1

You can create new CentOS7 + MATE Desktop flavored python+Django developer's environment.

Install vagrant-vbguest plugin to acquire latest Virtualbox Guest Addition(if you like).
```
vagrant plugin install vagrant-vbguest
```

Install vagrant-cachier to speed up you vagrant provision performance (if you like).
```
vagrant plugin install vagrant-cachier
```

Make new VM, then provisioning task will start automatically.
```
vagrant up
```

After finishing the provisioning task, it is good to execute restart VM.
```
vagrant reload
```

Welcome to CentOS + MATE Desktop!!!



