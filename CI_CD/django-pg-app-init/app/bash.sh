i=1; until $1; do if [[ $i -eq 12 ]]; then echo "DB still not ready"; exit 1; else sleep 10; let i++; fi; done