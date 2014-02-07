rds_backup_log
==============

## About

RDS Instance log backup to server local.

## Fork
* http://blog.suz-lab.com/2013/05/rubyrds.html
* http://blog.suz-lab.com/2013/05/rdss3.html

## Install

```
gem install aws-sdk
```

#### rds-backup-log.bash

<table>
  <tr>
    <th>ENVIRONMENT</th>
    <th>VALUE</th>
  </tr>
  <tr>
    <td>ROTATE</th>
    <td>rotate num</th>
  </tr>
  <tr>
    <td>DIR_SCRIPT</td>
    <td>scripts directory</td>
  </tr>
</table>

## Usage

```
/path/to/rds-backup-log.bash {db_instance_identifier} {log_dir}
/path/to/rds-event.bash {log_dir}
```

#### cron

```cron
5 0 * * * /path/to/rds-backup-log.bash rds-identifier01 /path/to/backup/rds/rds-identifier01
10 0 * * * /path/to/rds-event.bash /path/to/backup/rds/event
```

## TODO

s3 upload.

