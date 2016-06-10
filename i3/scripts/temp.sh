acpi -t | head -n1 | cut -d' ' -f4 | sed s/$/°C/g
