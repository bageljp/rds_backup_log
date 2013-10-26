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
```

#### cron

```cron
5 0 * * * /usr/local/tlab/script/rds-backup-log.bash dev-hpplus-db01 /usr/local/tlab/backup/rds/dev-hpplus-db01
```

## TODO

s3 upload.

