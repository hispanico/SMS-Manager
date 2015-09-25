#!/bin/bash

### Configuration ###

inbox=/var/spool/gammu/inbox
sentbox=/var/spool/gammu/sent
from=sender@example.com
smtp=smtp.example.com
user=username
pass=password
to=receiver@exsample.com
smsreply="Automatic reply Message"

### END Configuration ###

sms="$*"

### Mail relay ###
smssender=$(cut -d '_' -f4 <<<"$sms")
smstime=$(stat -c%y "$inbox/$sms" | cut -d'.' -f1)
smstext=$(<"$inbox/$sms")
echo -e "Received SMS from $smssender at $smstime: \n\n$smstext \n" | sendemail -f $from -t $to -u "New SMS from $smssender" -s $smtp -o tls=yes -xu $user -xp $pass

### SMS mobile reply ###
if [[ $smssender =~ ^\+393[0-9]{8,9}$ ]] && [ -z "$(find $sentbox -name "*_$smssender_*" -print 2>/dev/null)" ] ; then
  gammu-smsd-inject TEXT $smssender -text "$smsreply" >/dev/null 2>&1
fi
