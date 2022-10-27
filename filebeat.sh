#!/usr/bin/bash

export GODEBUG='madvdontneed=1'
export SERIAL_NUMBER="$(jq -r '.[] | select(.name=="/Hardware/Hardware/0/SerialNumber").value' /home/sinterit/global_parameters.json)"
export PRINTER_NAME="$(jq -r '.[] | select(.name=="/Hardware/Hardware/0/PrinterName").value' /home/sinterit/global_parameters.json)"

printenv

/home/sinterit/bin/filebeat/filebeat --environment systemd \
--c "/home/sinterit/bin/filebeat/${1}.yml" \
--path.home /home/sinterit/bin/filebeat \
--path.config /home/sinterit/bin/filebeat \
--path.data /home/sinterit/bin/filebeat \
--path.logs /home/sinterit/bin/filebeat