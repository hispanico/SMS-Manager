# SMS MANAGER

SMS MANAGER use **gammu-smsd** to processing the SMS received on the sim card in a USB datacard.

## Gammu-smsd configure

The folder **gammu-smsd** contein the congiruation file **gammu-smsdrc**.

This file can be used to configure **gammu-smsd** service.

Gammu-smsd supported device: http://wammu.eu/phones/

## SMS2MAIL script

The script **sms2mail.sh** in the folder **scripts** is used by **gammu-smsd**.

When new SMS is recevied its will be send by e-mail and an automatic message will be send by SMS to message sender.


## Debian/Ubuntu Configuration

```
sudo apt-get install gammu-smsd
```

Copy **gammu-smsdrc** in */etc/*

Copy **sms2mail.sh** in */var/spool/gammu/*

Start gammu-smsd

```
service gammu-smsd start
```
